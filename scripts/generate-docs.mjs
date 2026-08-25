import { readFileSync, writeFileSync, mkdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import {
  Document, Packer, Paragraph, TextRun, HeadingLevel,
  AlignmentType, BorderStyle, Table, TableRow, TableCell,
  WidthType, ShadingType,
} from 'docx';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = join(__dirname, '..');
const showAnswers = process.argv.includes('--answers');

// Find latest dump
const date = new Date().toISOString().slice(0, 10);
const dumpPath = join(ROOT, 'dumps', `dump_${date}.json`);
const sections = JSON.parse(readFileSync(dumpPath, 'utf-8'));

const BLUE = '2F6FED';
const GREEN = '15803d';
const RED = 'b91c1c';
const GRAY = '7d7979';

function spacer(size = 120) {
  return new Paragraph({ spacing: { before: size } });
}

const children = [];

// Title
children.push(
  new Paragraph({
    text: 'PCAM 9 OJK — Question Bank',
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

for (const section of sections) {
  // Section heading
  children.push(
    new Paragraph({
      text: section.title,
      heading: HeadingLevel.HEADING_1,
      spacing: { before: 400, after: 200 },
      border: { bottom: { style: BorderStyle.SINGLE, size: 6, color: BLUE } },
    }),
  );

  for (let qi = 0; qi < section.questions.length; qi++) {
    const q = section.questions[qi];
    const correctChoice = q.choices.find((c) => c.is_correct);

    // Question text
    children.push(
      new Paragraph({
        spacing: { before: 240, after: 80 },
        children: [
          new TextRun({ text: `${qi + 1}. `, bold: true, size: 22 }),
          new TextRun({ text: q.text, bold: true, size: 22 }),
        ],
      }),
    );

    // Choices
    const letters = ['A', 'B', 'C', 'D', 'E'];
    for (let ci = 0; ci < q.choices.length; ci++) {
      const c = q.choices[ci];
      const isCorrect = showAnswers && c.is_correct;
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

    // Answer line (only when --answers flag is set)
    if (showAnswers) {
      children.push(
        new Paragraph({
          spacing: { before: 80, after: 40 },
          indent: { left: 360 },
          children: [
            new TextRun({ text: 'Answer: ', bold: true, color: GRAY, size: 18 }),
            new TextRun({ text: correctChoice ? correctChoice.text : '—', color: GREEN, bold: true, size: 18 }),
          ],
        }),
      );
    }
  }
}

const doc = new Document({
  sections: [{ children }],
  styles: {
    default: {
      document: {
        run: { font: 'Arial', size: 22 },
      },
    },
  },
});

mkdirSync(join(ROOT, 'docs'), { recursive: true });
const out = join(ROOT, 'docs', `questions_${date}${showAnswers ? '_with-answers' : ''}.docx`);
const buffer = await Packer.toBuffer(doc);
writeFileSync(out, buffer);
console.log(`Saved to ${out}`);
