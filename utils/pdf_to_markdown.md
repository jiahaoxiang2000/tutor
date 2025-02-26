# PDF to Markdown Converter

There are several ways to convert PDF to Markdown. If the PDF is **text-based**, you can use the following methods, the `markitdown` command-line tool, or the `pandoc` command-line tool.

```bash
markitdown input.pdf -o output.md
```

when the PDF is **image-based**, you can use the `ocrmypdf` command-line tool to convert the PDF to text-based PDF, then use the `markitdown` command-line tool to convert the text-based PDF to Markdown.

```bash
ocrmypdf input.pdf output.pdf
markitdown output.pdf -o output.md
```
