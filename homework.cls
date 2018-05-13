% homework.cls
% LaTeX class for typesetting homework
% Author: Artem Mavrin
%
% The most recent version can be found here:
% https://github.com/artemmavrin/latex-homework/blob/master/homework.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2017/11/09 LaTeX class for typesetting homework]


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class base and options %
%%%%%%%%%%%%%%%%%%%%%%%%%%

% Support for key-value class options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=HW,
  prefix=HW@,
}

% Options for 10pt, 11pt, or 12pt fonts
% We don't defer this to the article class because we want 12pt to be the
% default font size
\def\@fontsize{12pt}
\DeclareVoidOption{10pt}{\renewcommand{\@fontsize}{10pt}}
\DeclareVoidOption{11pt}{\renewcommand{\@fontsize}{11pt}}
\DeclareVoidOption{12pt}{\renewcommand{\@fontsize}{12pt}}

% True/False options. Defaults are False
\DeclareBoolOption{qed}             % End solutions with a QED tombstone symbol
\DeclareBoolOption{hidesolutions}   % Do not display solutions
\DeclareBoolOption{boxes}           % Wrap problems in boxes

% All other options get passed to the article class
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}

% Process the options provided to the class and load the `article' class
\ProcessKeyvalOptions*
\LoadClass[\@fontsize]{article}


%%%%%%%%%%%%%%%%%%%%
% Homework details %
%%%%%%%%%%%%%%%%%%%%

% Internal names for homework details

% The internal student name, course name, term, and HW number macros have no
% default value and will raise an error if used before being set by their
% corresponding defining macros.
\def\@name{\@latex@error{No \noexpand\name given}\@ehc}
\def\@course{\@latex@error{No \noexpand\course given}\@ehc}
\def\@term{\@latex@error{No \noexpand\term given}\@ehc}
\def\@hwnum{\@latex@error{No \noexpand\hwnum given}\@ehc}
% The following internal homework detail macros have default values and do not
% have to be specified manually.
\def\@hwname{Homework}
\def\@problemname{Problem}
\def\@solutionname{Solution}
% The homework title is determined by the course name, homework name, and
% homework number, and cannot be changed by the user (without redefining
% \@hwtitle).
\def\@hwtitle{\@course\ \@hwname\ \@hwnum}

% The following macros let the user specify the values of the internal homework
% detail macros defined above.

% The following four macros must be used in the preamble.
\def\name#1{\renewcommand\@name{#1}}
\def\course#1{\renewcommand\@course{#1}}
\def\term#1{\renewcommand\@term{#1}}
\def\hwnum#1{\renewcommand\@hwnum{#1}}
% The following just redefine default values and are therefore optional
\def\hwname#1{\renewcommand\@hwname{#1}}
\def\solutionname#1{\renewcommand\@solutionname{#1}}
\def\problemname#1{\renewcommand\@problemname{#1}}


%%%%%%%%%%%%%%%%%%%
% Page formatting %
%%%%%%%%%%%%%%%%%%%

% Set up page headers and footers using the `fancyhdr' package
\RequirePackage{fancyhdr}
\renewcommand\headrulewidth{0pt}
% First page style
\fancypagestyle{firstpage}
{
  \fancyhf{}
  \fancyhead[R]{{\@name}\\{\@term}}
  \fancyfoot[C]{\small\thepage}
}
% Subsequent page style
\fancypagestyle{runningpage}
{
  \fancyhf{}
  \fancyhead[L]{\small\@hwtitle}
  \fancyhead[R]{\small\@name}
  \fancyfoot[C]{\small\thepage}
}
\pagestyle{runningpage}

% Specify how the title is printed
\renewcommand\maketitle
{
  \thispagestyle{firstpage}
  \begingroup
  \center
  \sffamily\bfseries\Large\@hwtitle
  \endcenter
  \endgroup
}
% The title is printed automatically, no need to type \maketitle manually
\AtBeginDocument{\maketitle}


%%%%%%%%%%%%%%%%%
% Miscellaneous %
%%%%%%%%%%%%%%%%%

\RequirePackage{lmodern}            % Use the Latin Modern font
\RequirePackage[utf8]{inputenc}     % Use UTF-8 encoding
\RequirePackage[T1]{fontenc}        % Use Type 1 fonts
\RequirePackage{microtype}          % Microtypography package

% Insert hyperlinks to internal or external links
\RequirePackage[bookmarks=true, hidelinks]{hyperref}

% Add student name and homework title to the PDF document metadata
\AtBeginDocument{
  \hypersetup{
    pdfauthor={\@name},
    pdftitle={\@hwtitle},
  }
}

% Mathematics packages
\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage{mathtools}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem, parts, solution, and claim environments %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem environment
\ifHW@boxes
  \RequirePackage{framed}
\fi
\theoremstyle{definition}
\newtheorem{@problem}{\sffamily\@problemname}
\numberwithin{equation}{@problem}
\numberwithin{table}{@problem}
\numberwithin{figure}{@problem}
\newenvironment{problem}[1][]
{
  \ifHW@boxes
    \framed
    \vspace{-1.5ex}
  \fi
  \def\@arg{#1}
  \ifx\@arg\empty
    \@problem
  \else
    \@problem[\normalfont\@arg\sffamily]
  \fi
  \pdfbookmark{\@problemname\ \arabic{@problem}}{\arabic{@problem}}
}
{
  \end@problem
  \ifHW@boxes
    \vspace{-1.5ex}
    \endframed
  \fi
}

% Problems are numbered 1, 2, 3, ... by default
% If a custom problem number is desired for a particular problem, use the
% following macro before the problem.
\def\problemnumber#1{\setcounter{@problem}{#1}\addtocounter{@problem}{-1}}

% Parts environment
% By default, parts are labeled by lowercase letters.
% The parts environment provides options for other labels:
% `a' (default) lowercase letters
% `A' uppercase letters
% `r' lowercase Roman numerals
% `R' uppercase Roman numerals
% `n' numbers
\RequirePackage{enumitem}

% Define parts environment option actions
\@namedef{partlabel@a}{\def\@partlabel{\textup{(\alph*)}}}
\@namedef{partlabel@A}{\def\@partlabel{\textup{(\Alph*)}}}
\@namedef{partlabel@r}{\def\@partlabel{\textup{(\roman*)}}}
\@namedef{partlabel@R}{\def\@partlabel{\textup{(\Roman*)}}}
\@namedef{partlabel@n}{\def\@partlabel{\textup{(\arabic*)}}}

% Actual parts environment
\newenvironment{parts}[1][a]
{
  % Process option (default is `a')
  \@ifundefined{partlabel@#1}
  {
    \@latex@error{Invalid parts environment option: #1}\@ehc
  }
  {
    \@nameuse{partlabel@#1}
  }
  \renewcommand\part\item
  \ % Make the list always starts on a new line
  \enumerate
  [ label=\@partlabel,
  , itemsep=1pt
  , parsep=1pt
  , topsep=0pt
  , partopsep=100pt
  , labelindent=0pt
  , labelwidth=4.5em
  , labelsep=0.5em
  , resume
  ]
}
{
  \endenumerate
}
\def\unresume{\setcounter{enumi}{0}}

% Solution environment
\ifHW@hidesolutions
  % Hide solutions if the `hidesolutions' class option is enabled
  \RequirePackage{comment}
  \excludecomment{solution}
\else
  % This is a modification of the `proof' environment from the amsthm package
  \newenvironment{solution}[1][\@solutionname]
  {
    \par
    \ifHW@qed
      \pushQED{\qed}
    \else
      \renewcommand\qedhere{}
    \fi
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item[\hskip\labelsep
          \sffamily\bfseries#1\@addpunct{.}]\ignorespaces
  }
  {
    \ifHW@qed
      \popQED
    \fi
    \endtrivlist\@endpefalse
  }
\fi

% 'claim' environment for better organization of claims made within a problem
% solution.
\def\@defaultclaimname{Claim}
\newenvironment{claim}[1][\@defaultclaimname]{
    \begin{quote}
    \textsf{\textbf{#1\@addpunct{.}}}
}
{
    \end{quote}\noindent
}

% Some common alternative uses of the 'claim' environment
\newcommand{\newclaim}[2]{\newenvironment{#1}{\begin{claim}[#2]}{\end{claim}}}
\newclaim{lemma}{Lemma}
\newclaim{proposition}{Proposition}
\newclaim{theorem}{Theorem}
\newclaim{corollary}{Corollary}
\newclaim{remark}{Remark}

% The 'proof' environment is re-defined to serve as a proof environment for
% claims made within a problem
\let\proof\@undefined
\let\endproof\@undefined
\newclaim{proof}{Proof}

% Remove indentation after 'claim' and all the related environments
\RequirePackage{noindentafter}
\NoIndentAfterEnv{claim}
\NoIndentAfterEnv{lemma}
\NoIndentAfterEnv{proposition}
\NoIndentAfterEnv{theorem}
\NoIndentAfterEnv{corollary}
\NoIndentAfterEnv{remark}
\NoIndentAfterEnv{proof}
