import requests
from bs4 import BeautifulSoup
import re
import sys
from datetime import datetime

BASE_URL = "https://lms.ojk.go.id/learnojk/mod/quiz/review.php"
PARAMS = {"attempt": "237214", "cmid": "40103"}

HEADERS = {
    "Referer": "https://lms.ojk.go.id/learnojk/mod/quiz/summary.php?attempt=237214&cmid=40103",
    "Upgrade-Insecure-Requests": "1",
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36",
    "sec-ch-ua": '"Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"',
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": '"macOS"',
}

# Optional: set your MoodleSession cookie here if login is required
COOKIES = {
    "MoodleSession": "c4ag6e6jm09sg2mtcho7en5bvc",
}


def fetch_page(page: int) -> str:
    params = {**PARAMS, "page": str(page)}
    r = requests.get(BASE_URL, headers=HEADERS, cookies=COOKIES or None, params=params, timeout=30)
    r.raise_for_status()
    return r.text


def parse_questions(html: str) -> list[dict]:
    soup = BeautifulSoup(html, "html.parser")

    # Detect redirect to login
    if "login" in soup.get_text().lower() and len(soup.get_text().strip()) < 500:
        print("ERROR: Page redirected to login. Add MoodleSession cookie.", file=sys.stderr)
        sys.exit(1)

    questions = []

    # Moodle quiz review wraps each question in .que or div[id^='q']
    for qblock in soup.select("div.que"):
        q: dict = {}

        # Question number + text
        info = qblock.select_one(".info .no")
        q["number"] = info.get_text(strip=True).replace("Question", "").strip() if info else "?"

        qtext_el = qblock.select_one(".qtext")
        q["text"] = qtext_el.get_text(" ", strip=True) if qtext_el else ""

        # Answer choices (radio/checkbox list)
        choices = []
        for row in qblock.select(".answer .r0, .answer .r1"):
            label = row.select_one("label") or row
            text = label.get_text(" ", strip=True)
            # Moodle marks correct answers with class 'correct' on the row or within feedback
            is_correct = (
                "correct" in row.get("class", [])
                or bool(row.select_one(".correct"))
                or bool(row.select_one("[class*='correct']"))
            )
            # Also check for .gradedright on the row
            if "gradedright" in row.get("class", []):
                is_correct = True
            choices.append({"text": text, "correct": is_correct})

        # Fallback: try .correctness or .outcome for correct answer text
        if not any(c["correct"] for c in choices):
            correct_el = qblock.select_one(".outcome .correct, .feedback .correct, [class*='correct'] label")
            if correct_el:
                correct_text = correct_el.get_text(" ", strip=True)
                for c in choices:
                    if correct_text and correct_text in c["text"]:
                        c["correct"] = True

        q["choices"] = choices

        # General feedback / explanation
        feedback_el = qblock.select_one(".generalfeedback, .outcome")
        q["feedback"] = feedback_el.get_text(" ", strip=True) if feedback_el else ""

        if q["text"]:
            questions.append(q)

    return questions


def total_pages(html: str) -> int:
    soup = BeautifulSoup(html, "html.parser")
    # Moodle pagination: look for the last page link
    last = None
    for a in soup.select(".paging a, nav.paging a"):
        try:
            last = int(a.get_text(strip=True))
        except ValueError:
            pass
    return last if last is not None else 0  # 0-indexed last page


def to_markdown(all_questions: list[dict]) -> str:
    lines = [
        "# Modul 2 — Quiz Questions & Answers",
        f"_Scraped from LMS OJK — {datetime.today().strftime('%Y-%m-%d')}_",
        f"_Total questions: {len(all_questions)}_",
        "",
    ]
    for q in all_questions:
        lines.append(f"## Soal {q['number']}")
        lines.append("")
        lines.append(q["text"])
        lines.append("")
        for i, c in enumerate(q["choices"]):
            letter = chr(65 + i)  # A, B, C, D, E
            marker = "**✓**" if c["correct"] else ""
            lines.append(f"- **{letter}.** {c['text']} {marker}".rstrip())
        lines.append("")
        if q["feedback"]:
            lines.append(f"> {q['feedback']}")
            lines.append("")
    return "\n".join(lines)


def main():
    print("Fetching page 0 …")
    first_html = fetch_page(0)

    max_page = total_pages(first_html)
    print(f"Detected {max_page + 1} page(s).")

    all_q = parse_questions(first_html)
    print(f"  Page 0: {len(all_q)} question(s)")

    for p in range(1, max_page + 1):
        print(f"Fetching page {p} …")
        html = fetch_page(p)
        qs = parse_questions(html)
        print(f"  Page {p}: {len(qs)} question(s)")
        all_q.extend(qs)

    print(f"\nTotal questions collected: {len(all_q)}")

    md = to_markdown(all_q)
    out = "/Users/mackbookm1pro/Documents/OJK/practice_website/endpoint_lms/modul_2_questions.md"
    with open(out, "w", encoding="utf-8") as f:
        f.write(md)
    print(f"Saved → {out}")


if __name__ == "__main__":
    main()
