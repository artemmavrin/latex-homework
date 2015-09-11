% LaTeX class for typesetting homework
% By Artem Mavrin
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2015/09/08 LaTeX class for typesetting homework]


%%%%%%%%%%%%%%%%%%%%%
%%% Class Options %%%
%%%%%%%%%%%%%%%%%%%%%

% Package for key-value options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=HW,
  prefix=HW@,
}

% Package for programming tools
\RequirePackage{etoolbox}

% Options for specifying fonts
\newcommand{\@fontname}{cm}
\DeclareVoidOption{cm}{\renewcommand{\@fontname}{cm}}
\DeclareVoidOption{cmsans}{\renewcommand{\@fontname}{cmsans}}
\DeclareVoidOption{dejavu}{\renewcommand{\@fontname}{dejavu}}
\DeclareVoidOption{helvetica}{\renewcommand{\@fontname}{helvetica}}
\DeclareVoidOption{kurier}{\renewcommand{\@fontname}{kurier}}
\DeclareVoidOption{palatino}{\renewcommand{\@fontname}{palatino}}
\DeclareVoidOption{times}{\renewcommand{\@fontname}{times}}
\DeclareVoidOption{utopia}{\renewcommand{\@fontname}{utopia}}

% Options for 10pt, 11pt, or 12pt fonts
\newcommand{\@fontsize}{12pt}
\DeclareVoidOption{10pt}{\renewcommand{\@fontsize}{10pt}}
\DeclareVoidOption{11pt}{\renewcommand{\@fontsize}{11pt}}
\DeclareVoidOption{12pt}{\renewcommand{\@fontsize}{12pt}}

% Option for using a QED symbol or not (false by default)
\DeclareBoolOption{qed}

% Options for setting margins uniformly
% i.e., left, right, top, and bottom all at once
% Default is 1in
\DeclareStringOption[1in]{margins}[1in]

% All other options get passed to the article class
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}

% Process the options provided to the class
\ProcessKeyvalOptions*

% This class is based on the article class
\LoadClass[\@fontsize]{article}


%%%%%%%%%%%%%%%%%%%%%%%%
%%% Homework Details %%%
%%%%%%%%%%%%%%%%%%%%%%%%

% Internal names for homework details
\newcommand{\@name}{\@latex@error{No \noexpand\name given}\@ehc}
\newcommand{\@course}{\@latex@error{No \noexpand\course given}\@ehc}
\newcommand{\@term}{\@latex@error{No \noexpand\term given}\@ehc}
\newcommand{\@hwnum}{\@latex@error{No \noexpand\hwnum given}\@ehc}

\newcommand{\@hwtype}{Homework}
\newcommand{\@problemtitle}{Problem}
\newcommand{\@solutiontitle}{Solution}
\newcommand{\@hwtitle}{{\@course} {\@hwtype} {\@hwnum}}

% Macros to define the homework details in .tex files using this class

% Necessary
% These commands should be used in the preamble (or else you will get an error)
\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\term}[1]{\renewcommand{\@term}{#1}}
\newcommand{\hwnum}[1]{\renewcommand{\@hwnum}{#1}}

% Optional
% The commands redefine default values
\newcommand{\hwtype}[1]{\renewcommand{\@hwtype}{#1}}
\newcommand{\solutiontitle}[1]{\renewcommand{\@solutiontitle}{#1}}
\newcommand{\problemtitle}[1]{\renewcommand{\@problemtitle}{#1}}


%%%%%%%%%%%%%%%%%%%
%%% Page Layout %%%
%%%%%%%%%%%%%%%%%%%

% Paragraph indentation and vertical spacing
\setlength{\parindent}{2em}
\setlength{\parskip}{5pt}

% Set page margin size using the geometry package
\RequirePackage[margin=\HW@margins]{geometry}

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
\if@titlepage
  \renewcommand{\maketitle}
  {
    \begin{titlepage}
    \begin{center}
      \vspace*{1cm}
      \Huge {\@hwtype} {\@hwnum}\\
      \vspace*{1cm}
      \Large\@name\\
      \vspace*{1cm}
      \@course, \@term
    \end{center}
    \end{titlepage}
  }
\else
  \renewcommand{\maketitle}
  {
    \thispagestyle{firstpage}
    \vspace{1ex}
    \begin{center}
      \textbf{\Large\@hwtitle}
    \end{center}
    \vspace{1ex}
  }
\fi
\AtBeginDocument{\maketitle}


%%%%%%%%%%%%%
%%% Fonts %%%
%%%%%%%%%%%%%

\ifdefstring{\@fontname}{cm}
{
  \RequirePackage{lmodern}
}{}

\ifdefstring{\@fontname}{cmsans}
{
  \SetSymbolFont{largesymbols}{normal}{OMX}{iwona}{m}{n}
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage{cmbright}
  \RequirePackage[bb=fourier]{mathalfa}
}{}

\ifdefstring{\@fontname}{dejavu}
{
  \SetSymbolFont{largesymbols}{normal}{OMX}{iwona}{m}{n}
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage{DejaVuSansCondensed}
  \RequirePackage{sfmath}
  \RequirePackage{sansmathaccent}
  \RequirePackage[bb=fourier]{mathalfa}
}{}

\ifdefstring{\@fontname}{helvetica}
{
  \SetSymbolFont{largesymbols}{normal}{OMX}{iwona}{m}{n}
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage[scaled]{helvet}
  \RequirePackage[helvet]{sfmath}
  \RequirePackage{sansmathaccent}
  \RequirePackage[bb=fourier]{mathalfa}
}{}

\ifdefstring{\@fontname}{kurier}
{
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage[math]{kurier}
  \RequirePackage[bb=fourier]{mathalfa}
}{}

\ifdefstring{\@fontname}{palatino}
{
  \RequirePackage{mathpazo}
  \RequirePackage{eulervm}
  \renewcommand{\mathbf}{\mathbold}
  \linespread{1.05}
}{}

\ifdefstring{\@fontname}{times}
{
  \RequirePackage{mathptmx}
}{}

\ifdefstring{\@fontname}{utopia}
{
  \RequirePackage{fourier}
}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Miscellaneous (non-math) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use UTF-8 encoding
\RequirePackage[utf8]{inputenc}

% Use Type 1 fonts
\RequirePackage[T1]{fontenc}

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mathematics Packages %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\notbool{HW@qed}{\renewcommand{\qedsymbol}{}}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Homework-specific features %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Environment for writing homework problems
\theoremstyle{definition}
\newtheorem{@problem}{\@problemtitle}
\numberwithin{equation}{@problem}
\newenvironment{problem}[1][]
{
  \begin{framed}
    \vspace{-1.5ex}
    \begin{@problem}[#1]
    \pdfbookmark{\@problemtitle\ \arabic{@problem}}{prob-\arabic{@problem}}
}
{
    \end{@problem}
    \vspace{-1.5ex}
  \end{framed}
}

% Environment for parts of a problem
\RequirePackage{framed}
\RequirePackage{enumitem}
\newcommand{\@partslabel}{(\normalfont\alph{*})}
% By default, parts are labeled by lowercase letters.
% The parts environment provides options for other labels:
% 'a' (default) lowercase letters
% 'A' uppercase letters
% 'r' lowercase Roman numerals
% 'R' uppercase Roman numerals
% 'n' numbers
\newenvironment{parts}[1][]
{
  % Make the list always start on a new line
  \
  \ifstrequal{#1}{a}
  {
    \renewcommand{\@partslabel}{(\normalfont\alph{*})}
  }{}
  \ifstrequal{#1}{A}
  {
    \renewcommand{\@partslabel}{(\normalfont\Alph{*})}
  }{}
  \ifstrequal{#1}{r}
  {
    \renewcommand{\@partslabel}{(\normalfont\roman{*})}
  }{}
  \ifstrequal{#1}{R}
  {
    \renewcommand{\@partslabel}{(\normalfont\Roman{*})}
  }{}
  \ifstrequal{#1}{n}
  {
    \renewcommand{\@partslabel}{(\normalfont\arabic{*})}
  }{}
  \renewcommand{\part}{\item}
  \begin{enumerate}%
  [ label=\@partslabel,
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
\newenvironment{solution}
{
  \begin{proof}[\normalfont\bfseries\@solutiontitle]%
}
{
  \end{proof}
}
