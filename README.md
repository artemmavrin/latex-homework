# latex-homework

Provides the LaTeX class [homework.cls](homework.cls) for typesetting math homework.

*****************

## Example

For an example `.tex` file that uses the `homework` class, see [example.tex](example.tex), which produces [example.pdf](example.pdf).

## Features

### Commands

The following commands should be used in the preamble of the homework `.tex` file.

* `\name{<name>}`:
  Replace `<name>` with your name.
* `\course{<course>}`:
  Replace `<course>` with the name of the course.
* `\term{<term>}`:
  Replace `<term>` with the term in which the course is held.
* `\hwnum{<number>}`:
  Replace `<number>` with the number of the homework.

Using the `\maketitle` command at the beginning of your document will print this information on the first page.

### Environments

The following environments are provided to typeset the homework.

* `problem`:
  wraps individual problem statements.
* `solution`:
  wraps the solution to a problem.
* `parts`:
  enumerates parts of a multiple-part problem.
  New parts are declared using the `\part` command.
  The part labels can be customized by providing one of the following options:
    * `a`:
      (default) Lowercase letters.
    * `A`:
      Uppercase letters.
    * `r`:
      Lowercase Roman numerals.
    * `R`:
      Uppercase Roman numerals.
    * `n`:
      Numbers.

### Class Options

**Font**

* `cm`:
  (default) Use the serif Latin Modern font, an enhanced version of Computer Modern.
* `times`:
  Use the serif Times font.
* `palatino`:
  Use the serif Palatino font.
* `helvetica`:
  Use the sans-serif Helvetica font.
* `kurier`:
  Use the sans-serif Kurier font.

**Font size**

* `10pt`:
  Set the font size to 10pt.
* `11pt`:
  Set the font size to 11pt.
* `12pt`:
  (default) Set the font size to 12pt.

**End-of-proof symbol**

* `noqed`:
  (default) Do not print an end-of-proof tombstone at the end of solutions.
* `qed`:
  Print an end-of-proof tombstone at the end of solutions.

**Paper size**

* `letterpaper`:
  (default) 8.5in x 11in.
* `a4paper`:
  210mm x 297mm.

**Draft/final**

* `final`:
  (default) Do not mark overfull lines.
* `draft`:
  Mark overfull lines.

## License

This code is distributed under the MIT license. For more info, read the [LICENSE](LICENSE) file.
