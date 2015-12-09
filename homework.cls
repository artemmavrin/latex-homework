% LaTeX class for typesetting homework
% By Artem Mavrin
% Most recent version here:
% https://github.com/artemmavrin/latex-homework/blob/master/homework.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2015/12/08 LaTeX class for typesetting homework]


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
\newcommand{\@fontName}{cm}
\DeclareVoidOption{cm}{\renewcommand{\@fontName}{cm}}
\DeclareVoidOption{cmsans}{\renewcommand{\@fontName}{cmsans}}
\DeclareVoidOption{dejavu}{\renewcommand{\@fontName}{dejavu}}
\DeclareVoidOption{helvetica}{\renewcommand{\@fontName}{helvetica}}
\DeclareVoidOption{kurier}{\renewcommand{\@fontName}{kurier}}
\DeclareVoidOption{palatino}{\renewcommand{\@fontName}{palatino}}
\DeclareVoidOption{times}{\renewcommand{\@fontName}{times}}
\DeclareVoidOption{utopia}{\renewcommand{\@fontName}{utopia}}

% Options for 10pt, 11pt, or 12pt fonts
\newcommand{\@fontSize}{12pt}
\DeclareVoidOption{10pt}{\renewcommand{\@fontSize}{10pt}}
\DeclareVoidOption{11pt}{\renewcommand{\@fontSize}{11pt}}
\DeclareVoidOption{12pt}{\renewcommand{\@fontSize}{12pt}}

% Option for using a QED symbol or not (false by default)
\DeclareBoolOption{qed}

% Option for starting problems on a new page
\DeclareBoolOption{newpage}

% Options for displaying problem point worth
\DeclareBoolOption{points}

% Option for hiding solutions
\DeclareBoolOption{hidesolutions}

% Option for not boxing problem statements
\DeclareBoolOption{noboxes}

% Options for setting margins uniformly
% i.e., left, right, top, and bottom all at once
% The default margin size depends on the font size.
\DeclareStringOption[]{margins}[]

% All other options get passed to the article class
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}

% Process the options provided to the class
\ProcessKeyvalOptions*

% This class is based on the article class
\LoadClass[\@fontSize]{article}


%%%%%%%%%%%%%%%%%%%%%%%%
%%% Homework Details %%%
%%%%%%%%%%%%%%%%%%%%%%%%

% Internal names for homework details
\newcommand{\@name}{\@latex@error{No \noexpand\name given}\@ehc}
\newcommand{\@course}{\@latex@error{No \noexpand\course given}\@ehc}
\newcommand{\@term}{\@latex@error{No \noexpand\term given}\@ehc}
\newcommand{\@hwNum}{\@latex@error{No \noexpand\hwnum given}\@ehc}

\newcommand{\@hwType}{Homework}
\newcommand{\@problemTitle}{Problem}
\newcommand{\@pointLabel}{point}
\newcommand{\@pointsLabel}{points}
\newcommand{\@solutionTitle}{Solution}
\newcommand{\@hwtitle}{\@course\ \@hwType\ \@hwNum}

% Macros to define the homework details in .tex files using this class

% Necessary
% These commands should be used in the preamble (or else you will get an error)
\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\term}[1]{\renewcommand{\@term}{#1}}
\newcommand{\hwnum}[1]{\renewcommand{\@hwNum}{#1}}

% Optional
% The commands redefine default values
\newcommand{\hwtype}[1]{\renewcommand{\@hwType}{#1}}
\newcommand{\solutiontitle}[1]{\renewcommand{\@solutionTitle}{#1}}
\newcommand{\problemtitle}[1]{\renewcommand{\@problemTitle}{#1}}
\newcommand{\pointlabel}[1]{\renewcommand{\@pointLabel}{#1}}
\newcommand{\pointslabel}[1]{\renewcommand{\@pointsLabel}{#1}}


%%%%%%%%%%%%%%%%%%%
%%% Page Layout %%%
%%%%%%%%%%%%%%%%%%%

% Set page margin size using the geometry package
\ifdefempty{\HW@margins}{}{
  \RequirePackage[margin=\HW@margins]{geometry}
}

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
    \titlepage
    \begin{center}
      \vspace*{1cm}
      \Huge \@hwType\ \@hwNum\\
      \vspace*{1cm}
      \Large\@name\\
      \vspace*{1cm}
      \@course, \@term
    \end{center}
    \endtitlepage
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

\ifdefstring{\@fontName}{cm}
{
  \RequirePackage{lmodern}
}{}

\ifdefstring{\@fontName}{cmsans}
{
  \SetSymbolFont{largesymbols}{normal}{OMX}{iwona}{m}{n}
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage{cmbright}
  \RequirePackage[bb=fourier]{mathalfa}
}{}

\ifdefstring{\@fontName}{dejavu}
{
  \SetSymbolFont{largesymbols}{normal}{OMX}{iwona}{m}{n}
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage{DejaVuSansCondensed}
  \RequirePackage{sfmath}
  \RequirePackage{sansmathaccent}
  \RequirePackage[bb=fourier]{mathalfa}
}{}

\ifdefstring{\@fontName}{helvetica}
{
  \SetSymbolFont{largesymbols}{normal}{OMX}{iwona}{m}{n}
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage[scaled]{helvet}
  \RequirePackage[helvet]{sfmath}
  \RequirePackage{sansmathaccent}
  \RequirePackage[bb=fourier]{mathalfa}
}{}

\ifdefstring{\@fontName}{kurier}
{
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage[math]{kurier}
  \RequirePackage[bb=fourier]{mathalfa}
}{}

\ifdefstring{\@fontName}{palatino}
{
  \RequirePackage{mathpazo}
  \RequirePackage{eulervm}
  \renewcommand{\mathbf}{\mathbold}
  \linespread{1.05}
}{}

\ifdefstring{\@fontName}{times}
{
  \RequirePackage{mathptmx}
}{}

\ifdefstring{\@fontName}{utopia}
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
\RequirePackage[bookmarks=true, hidelinks]{hyperref}
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

%---------------------%
% Problem Environment %
%---------------------%
\RequirePackage{framed}
\newcounter{@problemNumber}
\theoremstyle{definition}
\newtheorem{@problem}{\@problemTitle}
\numberwithin{equation}{@problem}
\newenvironment{problem}[1][]
{
  \stepcounter{@problemNumber}
  \ifHW@newpage
    \ifnum\value{@problemNumber}>1
      \newpage
    \fi
  \fi
  \notbool{HW@noboxes}{\framed\vspace{-1.5ex}}{}
  \ifHW@points
    \@problem
    \def\temp{#1}\ifx\temp\empty\else
      \ifnum#1=1
        \textit{(#1 \@pointLabel)}
      \else
        \textit{(#1 \@pointsLabel)}
      \fi
    \fi
  \else
    \@problem[#1]
  \fi
  \pdfbookmark{\@problemTitle\ \arabic{@problem}}{prob-\arabic{@problem}}
}
{
  \end@problem
  \notbool{HW@noboxes}{\vspace{-1.5ex}\endframed}{}
}
% Use a custom problem number
\newcommand{\problemnumber}[1]%
{
  \setcounter{@problem}{#1}
  \addtocounter{@problem}{-1}
}

%-------------------%
% Parts Environment %
%-------------------%
% By default, parts are labeled by lowercase letters.
% The parts environment provides options for other labels:
% 'a' (default) lowercase letters
% 'A' uppercase letters
% 'r' lowercase Roman numerals
% 'R' uppercase Roman numerals
% 'n' numbers
\RequirePackage{enumitem}
\newcommand{\@partLabelDefault}{\textup{(\alph*)}}
\newcommand{\@partLabel}{}

% Define parts environment option actions
\@namedef{partLabel@a}{\renewcommand{\@partLabel}{\textup{(\alph*)}}}
\@namedef{partLabel@A}{\renewcommand{\@partLabel}{\textup{(\Alph*)}}}
\@namedef{partLabel@r}{\renewcommand{\@partLabel}{\textup{(\roman*)}}}
\@namedef{partLabel@R}{\renewcommand{\@partLabel}{\textup{(\Roman*)}}}
\@namedef{partLabel@n}{\renewcommand{\@partLabel}{\textup{(\arabic*)}}}

% Actual parts environment
\newenvironment{parts}[1][a]
{
  % Process option (default is "a")
  \@ifundefined{partLabel@#1}
  {
    \@latex@error{Invalid parts environment option: #1}\@ehc
  }
  {
    \@nameuse{partLabel@#1}
  }
  % Make the list always start on a new line
  \
  \enumerate%
  [ label=\@partLabel,
  , itemsep=1pt
  , parsep=1pt
  , topsep=0pt
  , partopsep=100pt
  , labelindent=0pt
  , labelwidth=4.5em
  , labelsep=0.5em
  , resume
  ]%
}
{
  \endenumerate
}
\renewcommand{\part}{\item}
\newcommand{\unresume}{\setcounter{enumi}{0}}

%----------------------%
% Solution Environment %
%----------------------%
\newcommand{\@solutionTitleFormat}{\normalfont\bfseries}
\ifHW@hidesolutions
  \RequirePackage{comment}
  \excludecomment{solution}
\else
  \newenvironment{solution}
  {
    \proof[\@solutionTitleFormat\@solutionTitle]%
  }
  {
    \endproof
  }
\fi
