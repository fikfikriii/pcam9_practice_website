import requests

url = "https://lms.ojk.go.id/learnojk/mod/quiz/review.php?attempt=237214&cmid=40103"

payload = {}
headers = {
  'Referer': 'https://lms.ojk.go.id/learnojk/mod/quiz/summary.php?attempt=237214&cmid=40103',
  'Upgrade-Insecure-Requests': '1',
  'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36',
  'sec-ch-ua': '"Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"',
  'sec-ch-ua-mobile': '?0',
  'sec-ch-ua-platform': '"macOS"'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
