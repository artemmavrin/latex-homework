% LaTeX class for typesetting homework
% By Artem Mavrin
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2015/08/11 LaTeX class for typesetting homework]

%%%%%%%%%%%%%%%%%%%%%
%%% Class Options %%%
%%%%%%%%%%%%%%%%%%%%%

% Load programming tools
% Documentation:
% https://www.ctan.org/pkg/etoolbox
\RequirePackage{etoolbox}

% Options for serif vs. sans-serif fonts

\newtoggle{sans@serif}
\toggletrue{sans@serif}
\DeclareOption{sans}{\toggletrue{sans@serif}}
\DeclareOption{serif}{\togglefalse{sans@serif}}

% Options for 10pt, 11pt, or 12pt fonts

\newcommand{\font@size}{12pt}
\DeclareOption{10pt}{\renewcommand{\font@size}{10pt}}
\DeclareOption{11pt}{\renewcommand{\font@size}{11pt}}
\DeclareOption{12pt}{\renewcommand{\font@size}{12pt}}

\ProcessOptions\relax

% This class is based on the article class
\LoadClass[\font@size, letterpaper]{article}

%%%%%%%%%%%%%
%%% Fonts %%%
%%%%%%%%%%%%%

\iftoggle{sans@serif}
{
  % A sans-serif font
  % Documentation:
  % https://www.ctan.org/pkg/kurier
  \RequirePackage[math]{kurier}
}
{
  % A serif font (New Century Schoolbook with Fourier math fonts)
  % Documentation:
  % https://www.ctan.org/pkg/fouriernc
  \RequirePackage{fouriernc}
}


%%%%%%%%%%%%%%%%%%%%%%%%
%%% Homework Details %%%
%%%%%%%%%%%%%%%%%%%%%%%%

% Internal names for homework details
\newcommand{\@name}{1}
\newcommand{\@course}{2}
\newcommand{\@term}{3}
\newcommand{\@hwnum}{4}
\newcommand{\@hwtitle}{{\@course} Homework {\@hwnum}}

% Macros to define the homework details in .tex files using this class
\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\term}[1]{\renewcommand{\@term}{#1}}
\newcommand{\hwnum}[1]{\renewcommand{\@hwnum}{#1}}


%%%%%%%%%%%%%%%%%%%
%%% Page Layout %%%
%%%%%%%%%%%%%%%%%%%

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
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}
% Page style for all subsequent pages
\fancypagestyle{runningpage}
{
  \fancyhf{}
  \fancyhead[L]{\@hwtitle}
  \fancyhead[R]{\@name}
  \fancyfoot[C]{\thepage}
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
\newenvironment{parts}
{
  \mbox{} % Make the list always start on a new line
  \renewcommand{\part}{\item}
  \begin{enumerate}%
  [ label=(\normalfont\alph{*}),
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
\renewcommand{\qedsymbol}{}
\newenvironment{solution}
{
  \begin{proof}[\normalfont\bfseries\solution@marker]%
}
{
  \end{proof}
}
