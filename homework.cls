% LaTeX class for typesetting homework
% By Artem Mavrin
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2015/08/11 LaTeX class for typesetting homework]

%%%%%%%%%%%%%%%%%%%%%
%%% Class Options %%%
%%%%%%%%%%%%%%%%%%%%%

% Package for programming tools
% Documentation:
% https://www.ctan.org/pkg/etoolbox
\RequirePackage{etoolbox}

% Options for specifying fonts
\newcommand{\font@n@me}{cm}
\DeclareOption{cm}{
  \renewcommand{\font@n@me}{cm}
}
\DeclareOption{sans}{
  \renewcommand{\font@n@me}{sans}
}
\DeclareOption{times}{
  \renewcommand{\font@n@me}{times}
}
\DeclareOption{palatino}{
  \renewcommand{\font@n@me}{palatino}
}

% Options for 10pt, 11pt, or 12pt fonts
\newcommand{\font@size}{12pt}
\DeclareOption{10pt}{\renewcommand{\font@size}{10pt}}
\DeclareOption{11pt}{\renewcommand{\font@size}{11pt}}
\DeclareOption{12pt}{\renewcommand{\font@size}{12pt}}

% Option for using a QED symbol or not
\newtoggle{qed@symbol}
\togglefalse{qed@symbol}
\DeclareOption{noqed}{\togglefalse{qed@symbol}}
\DeclareOption{qed}{\toggletrue{qed@symbol}}

% Options for letterpaper or a4paper paper size
% letterpaper is 8.5in by 11in
% a4paper is 210 mm x 297 mm
\newcommand{\paper@size}{letterpaper}
\DeclareOption{letterpaper}{\renewcommand{\paper@size}{letterpaper}}
\DeclareOption{a4paper}{\renewcommand{\paper@size}{a4paper}}

% Draft/final option
\newtoggle{dr@ft}
\DeclareOption{draft}{\toggletrue{dr@ft}}
\DeclareOption{final}{\togglefalse{dr@ft}}

% Process the options provided to the class
\ProcessOptions\relax

% This class is based on the article class
\LoadClass[\font@size, \paper@size]{article}

%%%%%%%%%%%%%
%%% Fonts %%%
%%%%%%%%%%%%%

\ifdefstring{\font@n@me}{cm}
{
  \RequirePackage{lmodern}
}{}

\ifdefstring{\font@n@me}{sans}
{
  \RequirePackage[math]{kurier}
}{}

\ifdefstring{\font@n@me}{times}
{
  \RequirePackage{mathptmx}
}{}

\ifdefstring{\font@n@me}{palatino}
{
  \RequirePackage{mathpazo}
}{}


%%%%%%%%%%%%%%%%%%%%%%%%
%%% Homework Details %%%
%%%%%%%%%%%%%%%%%%%%%%%%

% Internal names for homework details
\newcommand{\@name}{}
\newcommand{\@course}{}
\newcommand{\@term}{}
\newcommand{\@hwnum}{}
\newcommand{\@hwtitle}{{\@course} Homework {\@hwnum}}

% Macros to define the homework details in .tex files using this class
\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\term}[1]{\renewcommand{\@term}{#1}}
\newcommand{\hwnum}[1]{\renewcommand{\@hwnum}{#1}}


%%%%%%%%%%%%%%%%%%%
%%% Page Layout %%%
%%%%%%%%%%%%%%%%%%%

% Mark overfull lines
\iftoggle{dr@ft}{\setlength{\overfullrule}{5pt}}{}

% Paragraph indentation and vertical spacing
\setlength{\parindent}{2em}
\setlength{\parskip}{5pt}

% 1-inch margins using the geometry package
% Documentation:
% https://www.ctan.org/pkg/geometry
\RequirePackage[margin=1in]{geometry}

% Headers and footers using the fancyhdr package
% Documentation:
% https://www.ctan.org/pkg/fancyhdr
\RequirePackage{fancyhdr}
% Page style for the first page only
\fancypagestyle{firstpage}
{
  \fancyhf{}
  \fancyhead[R]{{\@name}\\{\@term}}
  \fancyfoot[C]{\small\thepage}
  \renewcommand{\headrulewidth}{0pt}
}
% Page style for all subsequent pages
\fancypagestyle{runningpage}
{
  \fancyhf{}
  \fancyhead[L]{\small\@hwtitle}
  \fancyhead[R]{\small\@name}
  \fancyfoot[C]{\small\thepage}
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{runningpage}


% Define how the title is printed
\renewcommand{\maketitle}
{
  \thispagestyle{firstpage}
  \vspace{1ex}
  \begin{center}
    \textbf{\Large\@hwtitle}
  \end{center}
  \vspace{1ex}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Miscellaneous (non-math) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use UTF-8 encoding
% Documentation:
% https://www.ctan.org/pkg/inputenc
\RequirePackage[utf8]{inputenc}

% Microtypography package
% Documentation:
% https://www.ctan.org/pkg/microtype
\RequirePackage{microtype}

% Insert hyperlinks to internal or external links
% Documentation:
% https://www.ctan.org/pkg/hyperref
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=blue,
  urlcolor=red,
}

% Insert pictures into documents
% Documentation:
% https://www.ctan.org/pkg/graphicx
\RequirePackage{graphicx}

% Create pictures and diagrams using TikZ & PGF
% Documentation:
% https://www.ctan.org/pkg/pgf
\RequirePackage{tikz}

% Create borders around text
% Documentation:
% https://www.ctan.org/pkg/framed
\RequirePackage{framed}


%%%%%%%%%%%%%%%%%%%
%%% Mathematics %%%
%%%%%%%%%%%%%%%%%%%

% Load the AMS math packages
% Documentation:
% https://www.ctan.org/pkg/amsmath
% https://www.ctan.org/pkg/amsthm
% https://www.ctan.org/pkg/amsfonts
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}

% Enhance the AMS math packages
% Documentation:
% https://www.ctan.org/pkg/mathtools
\RequirePackage{mathtools}

% Environment for writing homework problems
\theoremstyle{definition}
\newtheorem{@problem}{Problem}
\numberwithin{equation}{@problem}
\newenvironment{problem}
{
  \begin{framed}
    \vspace{-1.5ex}
    \begin{@problem}%
}
{
    \end{@problem}
    \vspace{-1.5ex}
  \end{framed}
}

% Environment for multi-part problems
% Uses the enumerate package
% Documentation:
% https://www.ctan.org/pkg/enumitem
\RequirePackage{enumitem}
\newcommand{\parts@label}{(\normalfont\alph{*})}
% By default, parts are labeled by lowercase letters.
% To get lowercase roman numerals, use the 'r' option
\newenvironment{parts}[1][]
{
  \mbox{} % Make the list always start on a new line
  \ifstrequal{#1}{r}
  {
    \renewcommand{\parts@label}{(\normalfont\roman{*})}
  }
  {
    \renewcommand{\parts@label}{(\normalfont\alph{*})}
  }
  \renewcommand{\part}{\item}
  \begin{enumerate}%
  [ label=\parts@label,
  , itemsep=1pt
  , parsep=1pt
  , topsep=0pt
  , partopsep=100pt
  , labelindent=0pt
  , labelwidth=4.5em
  , labelsep=0.5em,
  ]%
}
{
  \end{enumerate}
}

% Environment for writing solutions
\newcommand{\solution@marker}{Solution}
\nottoggle{qed@symbol}
{
  \renewcommand{\qedsymbol}{}
}{}
\newenvironment{solution}
{
  \begin{proof}[\normalfont\bfseries\solution@marker]%
}
{
  \end{proof}
}
