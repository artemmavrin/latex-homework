# latex-homework

Provides the LaTeX class [homework.cls](homework.cls) for typesetting math homework.

*****************

## Features

### Commands

The following commands should be used in the preamble of the homework `.tex` file.

* `\name{}`:
  Your name, which will appear on the homework.
* `\course{}`:
  The name of the course.
* `\term{}`:
  The term in which the course is held.
* `\hwnum{}`:
  The number of the homework.

Using `\maketitle` will print this information on the first page homework.

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
  (default) Use the Latin Modern font, an enhanced version of Computer Modern.
* `sans`:
  Use the sans-serif Kurier font.
* `times`:
  Use the Times font.
* `palatino`:
  Use the Palatino font.

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
  (default) 8.5 in by 11 in.
* `a4paper`:
  210 mm x 297 mm.

**Draft/final**

* `final`:
  (default) Do not mark overfull lines.
* `draft`:
  Mark overfull lines.

******************

## Example

For an example `.tex` file that uses the `homework` class, see [example.tex](example.tex), which produces [example.pdf](example.pdf).
