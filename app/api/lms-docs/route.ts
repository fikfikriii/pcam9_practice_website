import { NextRequest, NextResponse } from 'next/server';
import {
  Document, Packer, Paragraph, TextRun, HeadingLevel,
  AlignmentType, BorderStyle,
} from 'docx';
import { LMS_QUESTIONS } from '@/lib/lms-questions';

const BLUE  = '2F6FED';
const GREEN = '15803d';
const GRAY  = '7d7979';

export async function GET(req: NextRequest) {
  const showAnswers = req.nextUrl.searchParams.get('answers') === 'true';
  const date = new Date().toISOString().slice(0, 10);

  const children: Paragraph[] = [];

  children.push(
    new Paragraph({
      text: 'PCAM 9 OJK — Soal Aktual',
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

  for (let qi = 0; qi < LMS_QUESTIONS.length; qi++) {
    const q = LMS_QUESTIONS[qi];
    const correctOpt = q.options.find((o) => o.label === q.correctLabel);

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

    for (const opt of q.options) {
      const isCorrect = showAnswers && opt.label === q.correctLabel;
      children.push(
        new Paragraph({
          spacing: { before: 40, after: 40 },
          indent: { left: 360 },
          children: [
            new TextRun({
              text: `${opt.label} ${opt.text}`,
              color: isCorrect ? GREEN : '201e1d',
              bold: isCorrect,
              size: 20,
            }),
            ...(isCorrect ? [new TextRun({ text: '  ✓', color: GREEN, bold: true, size: 20 })] : []),
          ],
        }),
      );
    }

    if (showAnswers && correctOpt) {
      children.push(
        new Paragraph({
          spacing: { before: 60, after: 0 },
          indent: { left: 360 },
          children: [
            new TextRun({ text: 'Jawaban: ', bold: true, color: GRAY, size: 18 }),
            new TextRun({ text: `${correctOpt.label} ${correctOpt.text}`, color: GREEN, bold: true, size: 18 }),
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
  const filename = `soal-aktual-ojk${showAnswers ? '-with-answers' : ''}_${date}.docx`;

  return new NextResponse(buffer as unknown as BodyInit, {
    headers: {
      'Content-Type': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'Content-Disposition': `attachment; filename="${filename}"`,
    },
  });
}
