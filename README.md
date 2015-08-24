# latex-homework

Provides the LaTeX class [homework.cls](homework.cls) for typesetting math homework.
This class is based on the `article` class.

***

## Features

### Class Options

* `sans`:
  Boolean key-value option. Use a sans-serif font. `true` by default.
* `serif`:
  Boolean key-value option. Use a serif font. `false` by default.
* `10pt`:
  Set the font size to 10pt.
* `11pt`:
  Set the font size to 11pt.
* `12pt`:
  Set the font size to 12pt. This is the default font size.

### Commands

The following commands should be used in the preamble of the homework `.tex` file.

* `\name`:
  Your name, which will appear on the homework.
* `\course`:
  The name of the course.
* `\term`:
  The term in which the course is held.
* `\hwnum`:
  The number of the homework.

### Environments

The following environments are provided to typeset the homework.

* `problem`:
  wraps individual problem statements.
* `parts`:
  enumerates parts of a multiple-part problem.
  New parts are declared using the `\part` command.
* `solution`:
  wraps the solution to a problem.

***

## Example

For an example `.tex` file that uses the `homework` class, see [example.tex](example.tex), which produces [example.pdf](example.pdf).
