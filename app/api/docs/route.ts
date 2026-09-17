import { NextRequest, NextResponse } from 'next/server';
import {
  Document, Packer, Paragraph, TextRun, HeadingLevel,
  AlignmentType, BorderStyle,
} from 'docx';

const GREEN = '15803d';
const GRAY  = '7d7979';

type DocChoice = { text: string; is_correct: boolean };
type DocQuestion = { text: string; choices: DocChoice[] };

export async function POST(req: NextRequest) {
  const { title, questions, withAnswers } = await req.json() as {
    title: string;
    questions: DocQuestion[];
    withAnswers: boolean;
  };

  const date = new Date().toISOString().slice(0, 10);
  const children: Paragraph[] = [];

  children.push(
    new Paragraph({
      text: `PCAM 9 OJK — ${title}`,
      heading: HeadingLevel.TITLE,
      alignment: AlignmentType.CENTER,
      spacing: { after: 200 },
    }),
    new Paragraph({
      alignment: AlignmentType.CENTER,
      spacing: { after: 600 },
      children: [new TextRun({ text: `Generated: ${date}`, color: GRAY, size: 20 })],
    }),
  );

  const letters = ['A', 'B', 'C', 'D', 'E'];

  for (let qi = 0; qi < questions.length; qi++) {
    const q = questions[qi];
    const correctChoice = q.choices.find((c) => c.is_correct);

    children.push(
      new Paragraph({
        spacing: { before: qi === 0 ? 0 : 280, after: 80 },
        border: qi === 0 ? undefined : { top: { style: BorderStyle.SINGLE, size: 2, color: 'e5e5e5' } },
        children: [
          new TextRun({ text: `${qi + 1}. `, bold: true, size: 22 }),
          new TextRun({ text: q.text, bold: true, size: 22 }),
        ],
      }),
    );

    for (let ci = 0; ci < q.choices.length; ci++) {
      const c = q.choices[ci];
      const isCorrect = withAnswers && c.is_correct;
      children.push(
        new Paragraph({
          spacing: { before: 40, after: 40 },
          indent: { left: 360 },
          children: [
            new TextRun({
              text: `${letters[ci] ?? ci + 1}. ${c.text}`,
              color: isCorrect ? GREEN : '201e1d',
              bold: isCorrect,
              size: 20,
            }),
            ...(isCorrect ? [new TextRun({ text: '  ✓', color: GREEN, bold: true, size: 20 })] : []),
          ],
        }),
      );
    }

    if (withAnswers && correctChoice) {
      children.push(
        new Paragraph({
          spacing: { before: 60, after: 0 },
          indent: { left: 360 },
          children: [
            new TextRun({ text: 'Jawaban: ', bold: true, color: GRAY, size: 18 }),
            new TextRun({ text: correctChoice.text, color: GREEN, bold: true, size: 18 }),
          ],
        }),
      );
    }
  }

  const doc = new Document({
    sections: [{ children }],
    styles: { default: { document: { run: { font: 'Arial', size: 22 } } } },
  });

  const buffer = await Packer.toBuffer(doc);
  const slug = title.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '');
  const filename = `${slug}${withAnswers ? '-with-answers' : ''}_${date}.docx`;

  return new NextResponse(buffer as unknown as BodyInit, {
    headers: {
      'Content-Type': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'Content-Disposition': `attachment; filename="${filename}"`,
    },
  });
}
