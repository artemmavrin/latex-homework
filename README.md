# latex-homework

Provides the LaTeX class [homework.cls](homework.cls) for typesetting homework.
Designed to avoid [this mistake](http://tex.stackexchange.com/a/139878/23505).

### Table of Contents

* [**Introduction**](#introduction)
  * [**Features**](#features)
  * [**Example**](#example)
* [**Getting Started**](#getting-started)
  * [**Template**](#template)
  * [**Usage**](#usage)
* [**Documentation**](#documentation)
  * [**Commands**](#commands)
  * [**Environments**](#environments)
  * [**Class Options**](#class-options)
* [**License**](#license)


## Introduction


### Features

* Simple interface for specifying homework information (e.g., name and course).
* Environments for writing problem statements, problem parts, and solutions.
* Automatic title creation.
* Easy to change the font to one of eight choices.
* Easy to change the size of the page margins.
* Compatible with `article` class options.
* Loads the AMS math packages.
* Automatic PDF author/title/bookmark metadata creation.


### Example

For an example `.tex` file that uses the `homework` class, see
[example.tex](example.tex), which produces [example.pdf](example.pdf).


## Getting Started


### Template

[template.tex](template.tex) is a ready-to-use homework template that uses the
`homework` class.


### Usage

* Download `homework.cls` and save it in the same directory as your homework
  `.tex` file (*alternatively*, see
  [this question](http://tex.stackexchange.com/questions/1137/) to learn where
  to put `.cls` files to be globally available to TeX)
* At the top of the homework `.tex` file, put `\documentclass{homework}`.
* In the preamble, specify the homework information using the commands listed in
  the [Commands](#commands) section.
* In the document, begin writing problems in the `problem` environment and
  solutions in the `solution` environment (see [Environments](#environments)).


## Documentation


### Commands

The following commands should be used in the preamble of the homework `.tex`
file.
If these are not used, you will get an error.

* `\name{<name>}`:
  Replace `<name>` with your name.
* `\course{<course>}`:
  Replace `<course>` with the name of the course.
* `\term{<term>}`:
  Replace `<term>` with the term in which the course is held.
* `\hwnum{<number>}`:
  Replace `<number>` with the number of the homework.

Thus, at a *minimum*, your preamble must contain

    \documentclass{homework}

    \name{<name>}
    \course{<course>}
    \term{<term>}
    \hwnum{<hwnum>}

You can also change the default text of various labels that appear on the
document by using the following commands.

* `\hwtype{<type>}`:
  Replace `<type>` with the desired label for the type of homework (e.g.,
  *Assignment* or *Problem Set*).
  The default is *Homework*.
* `\problemtitle{<title>}`:
  Replace `<title>` with the desired label for problems created with the
  `problem` environment (e.g., *Exercise* or *Question*).
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
  By default, problems are numbered beginning at 1.
  To change the number to `n`, use the command `\problemnumber{n}` before the
  `problem` environment.
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

To use a class option, write

    \documentclass[<options>]{homework}

at the beginning of your homework file, where `<options>` is a comma-separated
list of the options that you wish to use.
The `homework` class accepts the following options.

**Change the font**

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
If the option `qed` is used but no `<value>` is specified, the option will be
`true`.

**Start problems on a new page**

* `newpage=<value>`:
`<value>` can be either `true` or `false`.
If `true`, each problem will start on a new page.
If `false`, problems will follow each other immediately.
The default is `false`.
If the option `newpage` is used but no `<value>` is specified, the option will
be `true`.

**Change the page margins**

* `margins=<value>`:
  `<value>` is the size of the left, right, top, and bottom margins.
  The default is `1in`.

**Use the `article` class options**

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
