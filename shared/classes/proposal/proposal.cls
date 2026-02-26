%
% Based on the SelfArx document class.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{proposal}[16/084/2021, v1.3]
\RequirePackage[utf8]{inputenc}

\RequirePackage{ifthen}
\RequirePackage{calc}
\newboolean{usept}
\setboolean{usept}{false}

\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption{pt}{\setboolean{usept}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*

\LoadClass{article}
\RequirePackage{lmodern}
\renewcommand*\familydefault{\sfdefault}

%\RequirePackage[english]{babel}

\newcommand{\@subtitle}{Joint PhD research proposal}
\newcommand{\@supervs}{Supervisors}
\newcommand{\@abs}{Abstract}

\newcommand{\@obj}{Objective}
\newcommand{\@quest}{Research questions}
\newcommand{\@steps}{Steps}
\newcommand{\@deliv}{Deliverables}
\newcommand{\@risks}{Risks}

% Languague related stuff
\ifthenelse{\boolean{usept}}{%
  \RequirePackage[portuguese]{babel}

  \renewcommand{\@subtitle}{Proposta conjunta de pesquisa de doutorado}
  \renewcommand{\@supervs}{Supervisores}
  \renewcommand{\@abs}{Resumreo}

  \renewcommand{\@obj}{Objetivreo}
  \renewcommand{\@quest}{Pergurentas de pesquisa}
  \renewcommand{\@steps}{Etapares}
  \renewcommand{\@deliv}{Entregáveis}
  \renewcommand{\@risks}{Riscos}
}{
  \RequirePackage[english]{babel}
}

\RequirePackage{ifpdf}

\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx,xcolor}
\RequirePackage{booktabs}
\RequirePackage{authblk}

\RequirePackage[left=2.15cm,%
                right=2.15cm,%
                top=2.5cm,%
                bottom=2.8cm,%
                headheight=32pt,%
                a4paper]{geometry}%

\RequirePackage[labelfont={bf,sf},%
                labelsep=period,%
                justification=raggedright]{caption}

\RequirePackage{natbib}
\RequirePackage{hyperref}
\bibliographystyle{apalike}

%
% writeLaTeX logo
%
\newcommand\wllogo{%
\renewcommand*\rmdefault{ugq}\normalfont\upshape{}write%
\renewcommand*\rmdefault{cmr}\normalfont\upshape{\bf\LaTeX}}

%
% headers and footers
%
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\lhead{}%
\chead{}%
\rhead{}%
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{\small\sffamily\bfseries\thepage/\pageref{LastPage}}%
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

%
% section/subsection/paragraph set-up
%
\definecolor{color1}{RGB}{0,0,0} % Color of section headings
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{color1}\sffamily\bfseries}
  {\thesection}
  {0.5em}
  {\MakeUppercase{#1}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\sffamily\bfseries}
  {}
  {0em}
  {\MakeUppercase{#1}}
  []
\titleformat{\subsection}
  {\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\itshape}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%
% tableofcontents set-up
%
\usepackage{titletoc}
\contentsmargin{0cm}
\titlecontents{section}[\tocsep]
  {\addvspace{4pt}\small\bfseries\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\hfill\thecontentspage}
  []
\titlecontents{subsection}[\tocsep]
  {\addvspace{2pt}\small\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\ \titlerule*[.5pc]{.}\ \thecontentspage}
  []
\titlecontents*{subsubsection}[\tocsep]
  {\footnotesize\sffamily}
  {}
  {}
  {}
  [\ \textbullet\ ]

\newlength{\tocsep}
\setlength\tocsep{1.5pc} % Sets the indentation of the sections in the table of contents
\setcounter{tocdepth}{2} % Show only three levels in the table of contents section: sections, subsections and subsubsections

\newcommand{\usection}[1]{%
  \phantomsection
  \section*{#1}
  \addcontentsline{toc}{section}{\protect\numberline{}#1}
}

\newcommand{\usubsection}[1]{%
  \phantomsection
  \subsection*{#1}
  \addcontentsline{toc}{subsection}{\protect\numberline{}#1}
}

\newcommand{\usubsubsection}[1]{%
  \phantomsection
  \subsubsection*{#1}
  \addcontentsline{toc}{subsubsection}{\protect\numberline{}#1}
}

\RequirePackage{enumitem}
\setlist{nolistsep} % Uncomment to remove spacing between items in lists (enumerate, itemize)

% Remove brackets from numbering in List of References
\renewcommand{\@biblabel}[1]{\bfseries\color{color1}\textsuperscript{[#1]}}

% Title page settings
\renewcommand{\author}[2]{%
  \def\theauthor{#1}
  \def\themail{#2}
}

\newcommand{\supervisors}[1]{\def\thesupervisors{#1}}
\newcommand{\departments}[1]{\def\thedepartments{#1}}
\newcommand{\faculties}[1]{\def\thefaculties{#1}}

\def\xabstract{abstract}
\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract
\long\gdef\theabstract{\ignorespaces#1}
\def\go{\end{abstract}}\else
\typeout{^^J^^J PLEASE DO NOT USE ANY \string\begin\space \string\end^^J
COMMANDS WITHIN ABSTRACT^^J^^J}#1\end{#2}
\gdef\theabstract{\vskip12pt BADLY FORMED ABSTRACT: PLEASE DO
NOT USE {\tt\string\begin...\string\end} COMMANDS WITHIN
THE ABSTRACT\vskip12pt}\let\go\relax\fi
\go}

\renewcommand{\@maketitle}{
  \begin{titlepage}
    % cover page
    \thispagestyle{empty}
    \begin{center}
      \begin{LARGE}\textbf{\@title}\\[.5 cm]\end{LARGE}
      \begin{Large}\@subtitle\end{Large}

      \begin{Large}
        \vfill
        \theauthor \\
        \href{mailto:\themail}{\themail} \\[1 cm]\vfill

        \@date\\[1 cm]\vfill

        \emph{\@supervs}\\
        \thesupervisors\ifhmode\\[1 cm]\fi
        \vfill
        \begin{center}
          \thedepartments\\
          \thefaculties\\
        \end{center}
        \vspace{8pt}

        %choose between bnw or rgb logo
        \centerline{
          \quad\includegraphics[width=\linewidth]{ugent-usp-logos.pdf}
        }

      \end{Large}
    \end{center}
  \end{titlepage}
  {%
    \usection{\@abs}
    \noindent
    \parbox{\dimexpr\linewidth-2\fboxsep\relax}{%
      \sffamily\small\vskip1ex\theabstract
    }%
    \vskip18pt%
    \noindent
  }%
  \tableofcontents
  \newpage
}

%landscape pages
\RequirePackage{pdflscape}
\RequirePackage{fancyhdr}

%page number at bottom in landscape
\fancypagestyle{mylandscape}{
  \fancyhf{} %Clears the header/footer
  \rhead{\small\sffamily\bfseries\rotatebox{90}{\thepage/\pageref{LastPage}}}
  \renewcommand{\headrulewidth}{0pt}% No header rule
  \renewcommand{\footrulewidth}{0pt}% No footer rule
}

%-----------------------------------------------
\setlength{\columnsep}{0.55cm} % Distance between the two columns of text
\setlength{\fboxrule}{0.75pt} % Width of the border around the abstract

\renewcommand\Authfont{\fontsize{12}{14}\usefont{OT1}{phv}{b}{n}}
\renewcommand\Affilfont{\fontsize{10}{12}\usefont{OT1}{phv}{b}{n}}

\usepackage{lipsum} % Required to insert dummy text
%-----------------------------------------------
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \addcontentsline{toc}{section}{\refname}%
  \oldbibliography{#1}%
}
\def\bibfont{\small}
\setlength{\bibsep}{4pt plus 0.3ex}

\newcounter{objective}
\newcommand{\objective}[1]{%
  \refstepcounter{objective}%
  \vspace{1em}\par\noindent\textbf{\@obj~\theobjective:} \textit{#1}\vspace{.8em}\par
}

\newcommand{\questions}[1]{%
  \subsubsection*{\@quest}
  \begin{enumerate}#1\end{enumerate}
}

\newcounter{method}
\newcommand{\method}[3]{%
  \refstepcounter{method}%
  \subsection*{\@obj~\themethod}
  \subsubsection*{\@steps}
  \begin{itemize}#1\end{itemize}
  \subsubsection*{\@deliv}
  \begin{itemize}#2\end{itemize}
  \subsubsection*{\@risks}
  \begin{itemize}#3\end{itemize}
}
