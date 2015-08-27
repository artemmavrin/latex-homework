% LaTeX class for typesetting homework
% By Artem Mavrin
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2015/08/27 LaTeX class for typesetting homework]


%%%%%%%%%%%%%%%%%%%%%
%%% Class Options %%%
%%%%%%%%%%%%%%%%%%%%%

% Package for programming tools
\RequirePackage{etoolbox}

% Options for specifying fonts
\newcommand{\font@n@me}{cm}
\DeclareOption{cm}{\renewcommand{\font@n@me}{cm}}
\DeclareOption{dejavu}{\renewcommand{\font@n@me}{dejavu}}
\DeclareOption{helvetica}{\renewcommand{\font@n@me}{helvetica}}
\DeclareOption{kurier}{\renewcommand{\font@n@me}{kurier}}
\DeclareOption{palatino}{\renewcommand{\font@n@me}{palatino}}
\DeclareOption{times}{\renewcommand{\font@n@me}{times}}
\DeclareOption{utopia}{\renewcommand{\font@n@me}{utopia}}

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
% letterpaper is 8.5in x 11in
% a4paper is 210mm x 297mm
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
  \RequirePackage[T1]{fontenc}
}{}

\ifdefstring{\font@n@me}{dejavu}
{
  \SetSymbolFont{largesymbols}{normal}{OMX}{iwona}{m}{n}
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage{DejaVuSansCondensed}
  \RequirePackage{sfmath}
  \RequirePackage{sansmathaccent}
  \RequirePackage[T1]{fontenc}
}{}

\ifdefstring{\font@n@me}{helvetica}
{
  \SetSymbolFont{largesymbols}{normal}{OMX}{iwona}{m}{n}
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage[scaled]{helvet}
  \RequirePackage[helvet]{sfmath}
  \RequirePackage{sansmathaccent}
  \RequirePackage[T1]{fontenc}
}{}

\ifdefstring{\font@n@me}{kurier}
{
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage[math]{kurier}
  \RequirePackage[T1]{fontenc}
}{}

\ifdefstring{\font@n@me}{palatino}
{
  \RequirePackage{mathpazo}
  \RequirePackage{eulervm}
  \renewcommand{\mathbf}{\mathbold}
  \RequirePackage[T1]{fontenc}
  \linespread{1.05}
}{}

\ifdefstring{\font@n@me}{times}
{
  \RequirePackage{mathptmx}
  \RequirePackage[T1]{fontenc}
}{}

\ifdefstring{\font@n@me}{utopia}
{
  \RequirePackage{fourier}
  \RequirePackage[T1]{fontenc}
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
% These should be used in the preamble
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
\RequirePackage[margin=1in]{geometry}

% Headers and footers using the fancyhdr package
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
\AtBeginDocument{\maketitle}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Miscellaneous (non-math) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use UTF-8 encoding
\RequirePackage[utf8]{inputenc}

% Microtypography package
\RequirePackage{microtype}

% Insert hyperlinks to internal or external links
\RequirePackage[bookmarks=true]{hyperref}
\AtEndPreamble{
  \hypersetup{
    pdfauthor={\@name},
    pdftitle={\@hwtitle},
  }
}

% Insert pictures into documents
\RequirePackage{graphicx}

% Create pictures and diagrams using TikZ & PGF
\RequirePackage{tikz}

% Create borders around text
\RequirePackage{framed}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mathematics Packages %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Homework-specific features %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Counter for problem part depth
\newcounter{prob@level}
\setcounter{prob@level}{1}

% Environment for writing homework problems
\theoremstyle{definition}
\newtheorem{@problem}{Problem}
\numberwithin{equation}{@problem}
\newenvironment{problem}[1][]
{
  \begin{framed}
    \vspace{-1.5ex}
    \begin{@problem}[#1]
    \pdfbookmark[\theprob@level]{Problem \arabic{@problem}}{prob-\arabic{@problem}}
}
{
    \end{@problem}
    \vspace{-1.5ex}
  \end{framed}
}

% Environment for parts of a problem
\RequirePackage{enumitem}
\newcommand{\parts@label}{(\normalfont\alph{*})}
% By default, parts are labeled by lowercase letters.
% The parts environment provides options for other labels:
% 'a' (default) lowercase letters
% 'A' uppercase letters
% 'r' lowercase Roman numerals
% 'R' uppercase Roman numerals
% 'n' numbers
\newenvironment{parts}[1][]
{
  \stepcounter{prob@level}
  \mbox{} % Make the list always start on a new line
  \ifstrequal{#1}{a}
  {
    \renewcommand{\parts@label}{(\normalfont\alph{*})}
  }{}
  \ifstrequal{#1}{A}
  {
    \renewcommand{\parts@label}{(\normalfont\Alph{*})}
  }{}
  \ifstrequal{#1}{r}
  {
    \renewcommand{\parts@label}{(\normalfont\roman{*})}
  }{}
  \ifstrequal{#1}{R}
  {
    \renewcommand{\parts@label}{(\normalfont\Roman{*})}
  }{}
  \ifstrequal{#1}{n}
  {
    \renewcommand{\parts@label}{(\normalfont\arabic{*})}
  }{}
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
  \addtocounter{prob@level}{-1}
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
