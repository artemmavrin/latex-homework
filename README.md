# latex-homework

Provides the LaTeX class [homework.cls](homework.cls) for typesetting math homework.

*****************

## Features

### Class Options

**Font style**

* `sans`:
  (_default_) Use a sans-serif font.
* `serif`:
  Use a serif font.

**Font size**

* `10pt`:
  Set the font size to 10pt.
* `11pt`:
  Set the font size to 11pt.
* `12pt`:
  (_default_) Set the font size to 12pt.

### Commands

The following commands should be used in the preamble of the homework `.tex` file.

* `\name{` _your name_ `}`:
  Your name, which will appear on the homework.
* `\course{` _course name_ `}`:
  The name of the course.
* `\term{` _course term_ `}`:
  The term in which the course is held.
* `\hwnum{` _number_ `}`:
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

******************

## Example

For an example `.tex` file that uses the `homework` class, see [example.tex](example.tex), which produces [example.pdf](example.pdf).
