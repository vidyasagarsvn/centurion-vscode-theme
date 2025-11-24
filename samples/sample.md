# Markdown Sample - Comprehensive Syntax Reference

## Headings

# H1 - Main Heading
## H2 - Subheading
### H3 - Sub-subheading
#### H4 - Sub-sub-subheading
##### H5 - Sub-sub-sub-subheading
###### H6 - Sub-sub-sub-sub-subheading

## Text Formatting

**Bold text** using double asterisks
__Bold text__ using double underscores

*Italic text* using single asterisks
_Italic text_ using single underscores

***Bold and italic*** using triple asterisks
___Bold and italic___ using triple underscores

~~Strikethrough~~ using double tildes

`Inline code` using backticks

## Lists

### Unordered Lists

- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
- Item 3

* Item 1
* Item 2
  * Nested item 2.1

+ Item 1
+ Item 2
  + Nested item 2.1

### Ordered Lists

1. First item
2. Second item
   1. Nested first
   2. Nested second
3. Third item

1. First
1. Second (auto-numbered)
1. Third

### Mixed Lists

1. Ordered item 1
   - Unordered sub-item
   - Unordered sub-item
2. Ordered item 2

### Task Lists

- [x] Completed task
- [ ] Incomplete task
- [x] Another completed task

## Code Blocks

```
Simple code block
with multiple lines
and no syntax highlighting
```

```python
# Python code block with syntax highlighting
def hello_world():
    print("Hello, World!")

for i in range(5):
    hello_world()
```

```javascript
// JavaScript code block
function helloWorld() {
    console.log("Hello, World!");
}

for (let i = 0; i < 5; i++) {
    helloWorld();
}
```

```json
{
  "name": "example",
  "version": "1.0.0",
  "description": "JSON in markdown"
}
```

    Indented code block
    with 4 spaces or 1 tab
    No language specified

## Links and Images

[Link text](https://example.com)

[Link with title](https://example.com "Link title")

<https://example.com>

<email@example.com>

[Reference link][reference]

[reference]: https://example.com

![Alt text](image.jpg)

![Alt text](image.jpg "Image title")

[![Linked image](image.jpg)](https://example.com)

## Blockquotes

> This is a blockquote.
> It can span multiple lines.

> This is a blockquote.
>
> With multiple paragraphs.
>
> > Nested blockquote

## Horizontal Rules

---

***

___

## Tables

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1.1 | Cell 1.2 | Cell 1.3 |
| Cell 2.1 | Cell 2.2 | Cell 2.3 |
| Cell 3.1 | Cell 3.2 | Cell 3.3 |

| Left Align | Center Align | Right Align |
|:-----------|:------------:|------------:|
| Left       | Center       | Right       |
| L          | C            | R           |

## Inline Elements

This is a paragraph with **bold**, *italic*, and `code`.

This line has a<br />line break using `<br />`.

## HTML

<div class="custom-html">
This is raw HTML inside markdown.
</div>

<button>Click me</button>

## Escaping

\*This is not italic\*
\[This is not a link\](url)
\`This is not code\`

## Footnotes

This is a sentence with a footnote[^1].

[^1]: This is the footnote content.

Another footnote[^2]:

[^2]: Footnote with multiple lines
    and more content.

## Definition Lists

Term 1
:   Definition 1

Term 2
:   Definition 2a
:   Definition 2b

## Abbreviations

HTML
*[HTML]: Hyper Text Markup Language

The HTML abbreviation will be expanded.

## Subscript and Superscript

H~2~O (water)

E=mc^2^ (energy equals mass times speed of light squared)

## Keyboard, Variable, Sample Output

`Ctrl` + `C` to copy

The <var>x</var> variable represents...

Sample output: <samp>Hello, World!</samp>

## Comments

<!-- This is a comment and won't be rendered -->

<!--
Multi-line comment
that won't be rendered
-->

## Special Markers and Comments

<!-- TODO: Add more examples -->
<!-- FIXME: Fix this section -->
<!-- NOTE: This is important -->
<!-- HACK: Temporary solution -->

## Checklist

- [x] Done item
- [ ] Todo item
- [ ] Another todo

## Metadata (YAML Front Matter)

---
title: Document Title
author: Author Name
date: 2024-01-15
tags: [markdown, example, syntax]
---

Content starts here...

## Summary

This markdown sample demonstrates:
- **Headings** - All levels H1-H6
- **Text formatting** - Bold, italic, strikethrough, inline code
- **Lists** - Ordered, unordered, nested, and task lists
- **Code blocks** - With syntax highlighting
- **Links and images** - Various formats
- **Blockquotes** - Simple and nested
- **Tables** - Left, center, and right aligned columns
- **Horizontal rules** - Line separators
- **Special elements** - Footnotes, abbreviations, sub/superscript
- **HTML** - Embedded HTML elements
- **Escaping** - Special character escaping
- **Comments** - Visible and hidden comments
- **Metadata** - YAML front matter
- **Task lists** - Checkboxes for todos

---

*Last updated: 2024-01-15*
