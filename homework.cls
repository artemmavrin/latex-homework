% LaTeX class for typesetting homework
% By Artem Mavrin
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2015/08/11 LaTeX class for typesetting homework]

%%%%%%%%%%%%%%%%%%%%%
%%% Class Options %%%
%%%%%%%%%%%%%%%%%%%%%

% Easy key-value option package
% Documentation:
% https://www.ctan.org/pkg/kvoptions
\RequirePackage{kvoptions}

% Use shorter family name and prefix
\SetupKeyvalOptions{
  family=hw,
  prefix=hw@
}

% Options for serif vs. sans-serif fonts
\DeclareBoolOption[true]{sans}
\DeclareComplementaryOption{serif}{sans}

% Options for 10pt, 11pt, or 12pt fonts
\newcommand{\font@size}{12pt}
\DeclareVoidOption{10pt}{\renewcommand{\font@size}{10pt}}
\DeclareVoidOption{11pt}{\renewcommand{\font@size}{11pt}}
\DeclareVoidOption{12pt}{\renewcommand{\font@size}{12pt}}

% Option for using a QED symbol or not
\DeclareBoolOption[true]{noqed}
\DeclareComplementaryOption{qed}{noqed}

% Process the options provided to the class
\ProcessKeyvalOptions*

% This class is based on the article class
\LoadClass[\font@size, letterpaper]{article}

%%%%%%%%%%%%%
%%% Fonts %%%
%%%%%%%%%%%%%

\ifhw@sans
  % A sans-serif font
  % Documentation:
  % https://www.ctan.org/pkg/kurier
  \RequirePackage[math]{kurier}
\else
  % A serif font (New Century Schoolbook with Fourier math fonts)
  % Documentation:
  % https://www.ctan.org/pkg/fouriernc
  \RequirePackage{fouriernc}
\fi


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

% Package for programming tools
% Documentation:
% https://www.ctan.org/pkg/etoolbox
\RequirePackage{etoolbox}


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
\ifhw@noqed
  \renewcommand{\qedsymbol}{}
\fi
\newenvironment{solution}
{
  \begin{proof}[\normalfont\bfseries\solution@marker]%
}
{
  \end{proof}
}
