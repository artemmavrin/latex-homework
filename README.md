# latex-homework

Provides the LaTeX class [homework.cls](homework.cls) for typesetting homework.


## Features

* Simple interface for specifying homework information (e.g., name and course).
* Environments for writing problem statements, problem parts, and solutions.
* Automatic title creation.
* Easy to change the font to one of eight choices.
* Narrow margins to save paper while remaining legible.
* Compatible with `article` class options.
* Loads the AMS math packages.
* Automatic PDF author/title/bookmark metadata creation.


## Example

For an example `.tex` file that uses the `homework` class, see
[example.tex](example.tex), which produces [example.pdf](example.pdf).


## Usage

* Download `homework.cls` and save it in the same directory as your homework
  `.tex` file.
* At the top of the homework `.tex` file, put `\documentclass{homework}`.
* In the preamble, specify the homework information using the commands listed in
  the [Commands](#commands) section.
* In the document, begin writing problems in the `problem` environment and
  solutions in the `solution` environment.


## Documentation

### <a name="commands"></a>Commands

The following commands should be used in the preamble of the homework `.tex`
file.

* `\name{<name>}`:
  Replace `<name>` with your name.
* `\course{<course>}`:
  Replace `<course>` with the name of the course.
* `\term{<term>}`:
  Replace `<term>` with the term in which the course is held.
* `\hwnum{<number>}`:
  Replace `<number>` with the number of the homework.

You can also change the default text of various labels that appear on the
document by using the following commands.

* `\hwtype{<type>}`:
  Replace `<type>` with the desired label for the type of homework (e.g.,
  *Assignment*, *Problem Sheet*, or a label in another language).
  The default is *Homework*.
* `\problemtitle{<title>}`:
  Replace `<title>` with the desired label for problems created with the
  `problem` environment (e.g., *Exercise*, *Question*, or a label in another
  language).
  The default is *Problem*.
* `\solutiontitle{<title>}`:
  Replace `<title>` with the desired label for solutions created with the
  `solution` environment (e.g., *Proof*, *Answer*, or a label in another
  language).
  The default is *Solution*.

### Environments

The following environments are provided to typeset the homework.

* `problem`:
  wraps individual problem statements.
* `solution`:
  wraps the solution to a problem.
* `parts`:
  enumerates parts of a multiple-part problem.
  New parts are declared using the `\part` command.
  The part labels can be customized by providing one of the following options to
  the `parts` environment:
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

The `homework` class accepts the following options.

**Font**

*Serif fonts*

* `cm`:
  (default) Latin Modern, an enhanced version of Computer Modern.
* `palatino`:
  Palatino.
* `times`:
  Times.
* `utopia`:
  Utopia Regular.

*Sans-serif fonts*

* `cmsans`:
  Computer Modern Bright.
* `dejavu`:
  DejaVu Sans Condensed.
* `helvetica`:
  Helvetica.
* `kurier`:
  Kurier.

**End-of-proof symbol**

* `qed=<value>`:
  `<value>` can be either `true` or `false`.
  If `true`, an end-of-proof symbol will be printed at the end of solutions.
  If `false`, there will be no end-of-proof symbol.
  The default is `false`.

**Page margins***

* `margins=<value>`:
  `<value>` is the size of the left, right, top, and bottom margins.
  The default is `1in`.

**`article` class options**

All options of the `article` class may be used. For example,

* `10pt`, `11pt`, `12pt`:
  Set the font size to 10pt, 11pt, or 12pt. The default is `12pt`.
* `letterpaper`, `a4paper`, etc.:
  Set the paper size. The default paper size is `letterpaper`.
* `draft`:
  Mark overfull lines.
* `twocolumn`:
  Typeset the document on two columns per page.
* `titlepage`:
  Print the title of the homework on a separate page.


## License

This code is distributed under the MIT license. For more info, read the
[LICENSE](LICENSE.txt) file.
