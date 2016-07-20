\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{laursenthesis}

\newif\ifwatermark
  \watermarkfalse
\newif\ifdtucompute
  \dtucomputefalse
\newif\ifconfidential
  \confidentialfalse

\DeclareOption{watermark}{%
  \watermarktrue
}
\DeclareOption{dtucompute}{%
  \dtucomputetrue
  \watermarktrue
  % Pass default b5paper and font size to memoir
  \PassOptionsToClass{b5paper}{memoir}%
  \PassOptionsToClass{10pt}{memoir}%
}
\DeclareOption{confidential}{%
  \confidentialtrue
}
% Pass all other options to memoir
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}
\ProcessOptions\relax


\LoadClass{memoir}


% Checks if XeTeX or LuaTeX is being used
\newif\ifxetexorluatex
  \xetexorluatexfalse
\ifxetex
  \xetexorluatextrue
\fi
\ifluatex
  \xetexorluatextrue
\fi




\begin{comment}
  \part{Default values}
\end{comment}


\newcommand{\thesubject}{}
\newcommand{\thepdfkeywords}{}
\newcommand{\theemail}{}
\newcommand{\thecity}{}
\newcommand{\thetype}{}
\newcommand{\theaddress}{}
\newcommand{\thelogo}{DTU-logo-CMYK}
\newcommand{\thedeplogo}{DTU-Compute-A-UK}
\newcommand{\thewatermark}{DTU-frise-SH-15}


\begin{comment}
  \part{Trim marks}
\end{comment}

% if showtrims is on, more functions need to be specified. Plase make it easy.
% Argument is stock size, which should be larger than paper size
\newcommand{\easytrimmarks}[1]{
  % Set stock size
  #1

  % Align paper in middle of stock
  \setlength{\trimtop}{\stockheight}
  \addtolength{\trimtop}{-\paperheight}
  \setlength{\trimtop}{0.5\trimtop}
  \setlength{\trimedge}{\stockwidth}
  \addtolength{\trimedge}{-\paperwidth}
  \setlength{\trimedge}{0.5\trimedge}

  % Bigger margin notes, now that we have rome for it
  \setmarginnotes{10pt}{90pt}{\onelineskip}

  % Trim marks style (trimXmarks, trimLmarks, trimFrame, quarkmarks)
  \trimLmarks

  % Remove middle L trim marks
  \renewcommand*{\tmarktm}{}
  \renewcommand*{\tmarkml}{}
  \renewcommand*{\tmarkmr}{}
  \renewcommand*{\tmarkbm}{}

  % Put jobname in left top on stock paper
  \renewcommand*{\tmarktl}{%
  \begin{picture}(0,0)
    \unitlength 1mm
    \thinlines
    \put(-2,0){\line(-1,0){18}}
    \put(0,2){\line(0,1){18}}
    \put(3,15){\normalfont\ttfamily\fontsize{8bp}{10bp}\selectfont\jobname\ --\
      \today\ --\
      \printtime\ --\
      Page \thepage\ --\
      Sheet\ \thesheetsequence\ of\ \thelastsheet\ sheets
      }
  \end{picture}}

  % Check if errors in paper format!
  \checkandfixthelayout
}


\begin{comment}
  \part{DTU Compute defaults}
\end{comment}

% Adjust the actual margins for DTU Compute style
\ifdtucompute
  % Page size
  \pagebv
  % Margins
  \if@twoside
    \setlrmarginsandblock{26mm}{20mm}{*}
  \else
    \setlrmarginsandblock{23mm}{23mm}{*}
  \fi
  \setulmarginsandblock{35mm}{25mm}{*}
  \setheadfoot{8mm}{10mm}
  \setlength{\headsep}{7mm}
  \setlength{\marginparwidth}{18mm}
  \setlength{\marginparsep}{2mm}

  % Check if errors in paper format!
  \checkandfixthelayout

  % if the showtrims flag is set, please make it easy for me and just print on a4...
  \ifshowtrims
    \easytrimmarks{\stockaiv}
  \fi
\fi




\begin{comment}
  \part{Large environments}
\end{comment}

% Large environments
\usepackage{microtype}
\usepackage{mathtools,amssymb,amsthm,stmaryrd,proof}%,mathabx}  NEJ TIL mathabx
\usepackage{etoolbox}% http://ctan.org/pkg/etoolbox
\usepackage{tikz}

% Links
\usepackage[hyphens]{url}                       % Allow hyphens in URL's
\usepackage[unicode=false,psdextra]{hyperref}   % References package

% Graphics and colors
\usepackage{graphicx}                 % Including graphics and using colours
\usepackage{xcolor}                   % Defined more color names
\usepackage{eso-pic}                  % Watermark and other bag
\usepackage[space]{grffile}           % spacing in filenames


\begin{comment}
  \part{DTU Colors}
\end{comment}

% Primally colors
\definecolor{dtured}{cmyk}{0,.91,.72,.23}
\definecolor{dtugray}{cmyk}{0,0,0,.56}
% Secondary colors
\definecolor{s12}{cmyk}{0,0.25,1,0}    % yellow
\definecolor{s01}{cmyk}{0,0.5,1,0}     %
\definecolor{s02}{cmyk}{0,0.75,1,0}    % orange
\definecolor{s03}{cmyk}{0,1,1,0}       % red
\definecolor{s04}{cmyk}{0,1,1,0.5}     %
\definecolor{s05}{cmyk}{.0,1,.0,.0}    % magenta
\definecolor{s06}{cmyk}{.25,1,.0,.0}   %
\definecolor{s07}{cmyk}{.25,1,0,0}     % purple
\definecolor{s08}{cmyk}{.75,1,0,0}     %
\definecolor{s09}{cmyk}{.75,.75,.0,.0} %
\definecolor{s13}{cmyk}{.75,.50,.0,.0} % blue
\definecolor{s10}{cmyk}{.5,0,0,0}      %
\definecolor{s11}{cmyk}{.5,.0,.0,.0}   %
\definecolor{s14}{cmyk}{.5,0,1,0}      % green
% Tinted colors
\definecolor{s14a}{cmyk}{.6,0,1,.25}   % green


\begin{comment}
  \part{Encoding, Language and Hyphenation}
\end{comment}

% Hyphenation
\ifxetexorluatex
    \usepackage{polyglossia}    % multilingual typesetting and appropriate hyphenation
    \setdefaultlanguage{english}
    \setotherlanguage{danish}
\else
    \usepackage[danish,english]{babel}
\fi


% Encoding
\ifxetexorluatex
    \usepackage{xunicode}
\else
    \usepackage[T1]{fontenc}
    \usepackage[utf8]{inputenc}
\fi


% language sensitive quotation facilities
\usepackage{csquotes}


\begin{comment}
  \part{Floats, marginnotes, references, figures, tables }
\end{comment}

% Floating objets, captions and references
%\usepackage{flafter}  % floats is positioned after or where it is defined!
%\setfloatlocations{figure}{bhtp}
%\setfloatlocations{table}{bhtp}

%\setFloatBlockFor{section}


% Put sidemargins in outer position (why the * is this option not default by the class?)
\sideparmargin{outer}

% Clever references
\usepackage[noabbrev,nameinlink,capitalise]{cleveref} % Options: "fig. !1!" --> "!Figure 1!"

% Caption style
\hangcaption
\captionnamefont{\bfseries}
\subcaptionlabelfont{\bfseries}
\captiontitlefinal{.}

% Enable subfloats on figure and tables
\newsubfloat{figure}
\newsubfloat{table}

% Consecutive numbering
%\letcountercounter{figure}{table}     % Consecutive table and figure numbering
%\letcountercounter{lstlisting}{table}     % Consecutive table and listing numbering


% Strip things from equation references
% http://tex.stackexchange.com/questions/122174/how-to-strip-eq-from-cleveref
%\crefformat{equation}{#2(#1)#3}
%\crefrangeformat{equation}{#3(#1)#4--#5(#2)#6}
%\crefmultiformat{equation}{#2(#1)#3}%
%{ and~#2(#1)#3}{, #2(#1)#3}{ and~#2(#1)#3}
\crefname{equation}{}{}


\begin{comment}
  \part{Table of content, depth, font, style}
\end{comment}

% Table of contents (TOC)
\setcounter{tocdepth}{1}              % Depth of table of content
\setcounter{secnumdepth}{3}           % Depth of section numbering
\setcounter{maxsecnumdepth}{2}        % Max depth of section numbering

% Add more space to page numbers (we have over 100 pages, i.e. three digits!)
\setpnumwidth{2.55em}

% Add more space to section numbers (we can have 10 sections, i.e. two digits!)
\renewcommand{\cftsectionaftersnum}{\hspace*{0.7em}}
\addtolength{\cftsectionnumwidth}{0.7em}


% TOC font ...
\renewcommand*{\cftchapterfont}{\sffamily\bfseries\large}
\renewcommand*{\cftchapterpagefont}{\sffamily\bfseries\large}
%\renewcommand*{\cftsectionfont}{\sffamily\bfseries}
%\renewcommand*{\cftsectionpagefont}{\sffamily\bfseries}
%\renewcommand*{\cftsubsectionfont}{\sffamily\bfseries}
%\renewcommand*{\cftsubsectionpagefont}{\sffamily\bfseries}
%\renewcommand*{\cftsubsubsectionfont}{\sffamily\bfseries}
%\renewcommand*{\cftsubsubsectionpagefont}{\sffamily\bfseries}




\begin{comment}
  \part{Todos}
\end{comment}

\usepackage{totcount}                 % For total counting of counters
\usepackage[colorinlistoftodos]{todonotes} % Todonotes package for nice todos

\newtotcounter{todocounter}           % Creates counter in todo
\let\oldtodo\todo
\newcommand*{\newtodo}[2][]{\stepcounter{todocounter}\oldtodo[#1]{\thesection~(\thetodocounter)~#2}}
\let\todo\newtodo
\let\oldmissingfigure\missingfigure
\newcommand*{\newmissingfigure}[2][]{\stepcounter{todocounter}\oldmissingfigure[#1]{\thesection~(\thetodocounter)~#2}}
\let\missingfigure\newmissingfigure
\makeatletter
\newcommand*{\mylistoftodos}{% Only show list if there are todos
\if@todonotes@disabled
\else
    \ifnum\totvalue{todocounter}>0
        \markboth{\@todonotes@todolistname}{\@todonotes@todolistname}
        %\listoftodos -- hyperlink not working so good
        \chapter{\@todonotes@todolistname}
        \@starttoc{tdo}
    \else
    \fi
\fi
}
\makeatother



\begin{comment}
  \part{Style for Chapter, header/footer, section and paragraphs}
\end{comment}

% Chapterstyle
\makeatletter
\makechapterstyle{mychapterstyle}{
    \chapterstyle{default}
    \def\format{\normalfont\sffamily}

    \setlength\beforechapskip{0mm}
    \ifxetexorluatex
        \renewcommand*{\chapnamefont}{\format\HUGE}
        \renewcommand*{\chapnumfont}{\format\fontsize{54}{54}\selectfont}
        \renewcommand*{\chaptitlefont}{\format\fontsize{42}{42}\selectfont}
    \else
        \renewcommand*{\chapnamefont}{\format\Huge}
        \renewcommand*{\chapnumfont}{\format\fontsize{43}{44}\selectfont}
        \renewcommand*{\chaptitlefont}{\format\fontsize{33}{32}\selectfont}
    \fi
    \renewcommand*{\printchaptername}{\chapnamefont\MakeUppercase{\@chapapp}}
    \patchcommand{\printchaptername}{\begingroup\color{dtugray}}{\endgroup}
    \renewcommand*{\chapternamenum}{\space\space}
    \patchcommand{\printchapternum}{\begingroup\color{dtured}}{\endgroup}
    \renewcommand*{\printchapternonum}{%
        \vphantom{\printchaptername\chapternamenum\chapnumfont 1}
        \afterchapternum
    }

    \setlength\midchapskip{1ex}

    \renewcommand*{\printchaptertitle}[1]{\raggedleft \chaptitlefont ##1}
    \renewcommand*{\afterchaptertitle}{\vskip0.5\onelineskip \hrule \vskip1.3\onelineskip}
}
\makeatother
\chapterstyle{mychapterstyle}

% Header and footer
\def\hffont{\sffamily\small}
\makepagestyle{myruled}
\makeheadrule{myruled}{\textwidth}{\normalrulethickness}
\makeevenhead{myruled}{\hffont\thepage}{}{\hffont\leftmark}
\makeoddhead{myruled}{\hffont\rightmark}{}{\hffont\thepage}
%\makefootrule{myruled}{\textwidth}{\normalrulethickness}{0ex}
\makeevenfoot{myruled}{}{}{}
\makeoddfoot{myruled}{}{}{}
\makepsmarks{myruled}{
    \nouppercaseheads
    \createmark{chapter}{both}{shownumber}{}{\space}
    \createmark{section}{right}{shownumber}{}{\space}
    \createplainmark{toc}{both}{\contentsname}
    \createplainmark{lof}{both}{\listfigurename}
    \createplainmark{lot}{both}{\listtablename}
    \createplainmark{bib}{both}{\bibname}
    \createplainmark{index}{both}{\indexname}
    \createplainmark{glossary}{both}{\glossaryname}
}
\pagestyle{myruled}
\copypagestyle{cleared}{myruled}      % When \cleardoublepage, use myruled instead of empty
\makeevenhead{cleared}{\hffont\thepage}{}{} % Remove leftmark on cleared pages

\makeevenfoot{plain}{}{}{}            % No page number on plain even pages (chapter begin)
\makeoddfoot{plain}{}{}{}             % No page number on plain odd pages (chapter begin)


% \*section, \*paragraph font styles
\ifxetexorluatex
    \setsecheadstyle              {\huge\sffamily\raggedright}
    \setsubsecheadstyle           {\LARGE\sffamily\raggedright}
    \setsubsubsecheadstyle        {\Large\sffamily\raggedright}
    %\setparaheadstyle             {\normalsize\sffamily\itseries\raggedright}
    %\setsubparaheadstyle          {\normalsize\sffamily\raggedright}
\else
    \setsecheadstyle              {\LARGE\sffamily\raggedright}
    \setsubsecheadstyle           {\Large\sffamily\raggedright}
    \setsubsubsecheadstyle        {\large\sffamily\raggedright}
    %\setparaheadstyle             {\normalsize\sffamily\itseries\raggedright}
    %\setsubparaheadstyle          {\normalsize\sffamily\raggedright}
\fi


\begin{comment}
  \part{Hypersetup and hypersetup hacks}
\end{comment}

% Hypersetup
\hypersetup{
  pdfdisplaydoctitle=true,
  bookmarksnumbered=true,
  bookmarksopen,
  bookmarksdepth=4,
  breaklinks,
  linktoc=all,
  plainpages=false,
  unicode=true,
  colorlinks=false,
  citebordercolor=dtured,           % color of links to bibliography
  filebordercolor=dtured,           % color of file links
  linkbordercolor=dtured,           % color of internal links (change box color with linkbordercolor)
  urlbordercolor=s13,               % color of external links
  hidelinks,                        % Do not show boxes or colored links.
}

% Hack to make right pdfbookmark link. The normal behavior links just below the chapter title. This hack put the link just above the chapter like any other normal use of \chapter.
% http://tex.stackexchange.com/questions/59359/certain-hyperlinks-memoirhyperref-placed-too-low
\makeatletter
% Patch 'Table of Contents'
\patchcmd{\mem@tableofcontents}% <cmd>
  {\phantomsection}% <search>
  {\relax}% <replace>
  {}{\@latex@error{Could not patch \string\mem@tableofcontents}}% <success><failure>
% Patch 'List of Tables'
\patchcmd{\mem@listoftables}% <cmd>
  {\phantomsection}% <search>
  {\relax}% <replace>
  {}{\@latex@error{Could not patch \string\mem@listoftables}}% <success><failure>
% Patch 'List of Figures'
\patchcmd{\mem@listoffigures}% <cmd>
  {\phantomsection}% <search>
  {\relax}% <replace>
  {}{\@latex@error{Could not patch \string\mem@listoffigures}}% <success><failure>
% Patch 'Bibliography'
\patchcmd{\@memb@bchap}% <cmd>
  {\phantomsection}% <search>
  {\relax}% <replace>
  {}{\@latex@error{Could not patch \string\@memb@bchap}}% <success><failure>
% Insert phantomsection before chapterheadstart on toc, lot, and lof
\renewcommand{\tocheadstart}{%
  \phantomsection\chapterheadstart%
}
\let\lotheadstart\tocheadstart
\let\lofheadstart\tocheadstart
\makeatother







\begin{comment}
  \part{Watermark}
\end{comment}


\newcommand{\watermark}[1]{
  \renewcommand{\thewatermark}{#1}
}

% Watermark the page with DTU watermark
\newcommand{\makewatermark}{%
  \AddToShipoutPicture*{
    \put(0,0){
      \parbox[b][\paperheight]{\paperwidth}{%
        \includegraphics[trim=130mm 0 0 0,width=0.9\textwidth]{\thewatermark}
        \vspace*{2.5cm}
}}}}


% Todo: make to more complex class option
% watermark=on Always add freize to last blank page (even thoug it contains text)
% watermark=onblank Always add a blank page with watermark
% watermark=ongatheringtwo Only add if page no mod two      (default)
\makeatletter
\ifwatermark
  \if@twoside
  % This is a two sided. If there is a last empty page lets use it for some fun e.g. the watermark.
  % NB: For a fully functional hack the \clearpage used in \include does some odd thinks with the sequence numbering. Thefore use \input instead of \include at the end of the book. If bibliography is used at last everything should be ok.
  % Adjust so gatherings is allowd for single sheets too! (hacking functions in memoir.dtx)
  \patchcmd{\leavespergathering}{\ifnum\@memcnta<\tw@}{\ifnum\@memcnta<\@ne}{
    \leavespergathering{1}
    % Insert the watermark
    \patchcmd{\@memensuresigpages}{\repeat}{\repeat\makewatermark}{}{}
  }{}
  \else
    \AtEndDocument{\clearpage\newpage~\thispagestyle{empty}\makewatermark}
  \fi
\fi
\makeatother




\begin{comment}
  \part{Fonts}
\end{comment}

% Text fonts (http://www.macfreek.nl/memory/Fonts_in_LaTeX)
\ifxetexorluatex
    \usepackage{fontspec}
    \setsansfont{texgyreadventor}[
        Ligatures=TeX,
        Path,
        UprightFont=*-regular,
        BoldFont=*-bold,
        ItalicFont=*-italic,
        BoldItalicFont=*-bolditalic,
        %SlantedFont=,
        %BoldSlantedFont=,
        %SmallCapsFont=
        Scale=0.8      % Adjustmens when using sf in text
    ]
    %\setmathsf{lmsans10-regular}[Path] % Probably nNot needed any more, sf in math is latin modern.
\else
    \usepackage{lmodern}
    \usepackage{tgadventor}
\fi



\begin{comment}
  \part{(meta) data, author, title, subject, keywords, city ...}
\end{comment}


\apptocmd{\title}% <command>
  {\hypersetup{pdftitle=#1}}% <code>
  {}% <success>
  {}% <failure>

\apptocmd{\author}% <command>
  {\hypersetup{pdfauthor=#1}}% <code>
  {}% <success>
  {}% <failure>

\newcommand{\subject}[1]{
  \hypersetup{pdfsubject={#1}}
  \renewcommand{\thesubject}{#1}
}
\newcommand{\pdfkeywords}[1]{
  \hypersetup{pdfkeywords={#1}}
  \renewcommand{\thepdfkeywords}{#1}
}
\newcommand{\email}[1]{
  \renewcommand{\theemail}{#1}
}
\newcommand{\city}[1]{
  \renewcommand{\thecity}{#1}
}
\newcommand{\address}[1]{
  \renewcommand{\theaddress}{#1}
}
\newcommand{\type}[1]{
  \renewcommand{\thetype}{#1}
}
\newcommand{\logo}[1]{
  \renewcommand{\thelogo}{#1}
}
\newcommand{\deplogo}[1]{
  \renewcommand{\thedeplogo}{#1}
}





\begin{comment}
  \part{Pre-frontmatter, title page, colophon, confidential}
\end{comment}

% Confidential
\newcommand{\confidentialbox}[1]{
  \put(0,0){\parbox[b][\paperheight]{\paperwidth}{
    \begin{vplace}
      \centering
      \scalebox{1.3}{
        \begin{tikzpicture}
          \node[very thick,draw=red!#1,color=red!#1,
                rounded corners=2pt,inner sep=8pt,rotate=-20]
                {\sffamily \HUGE \MakeUppercase{Confidential}};
        \end{tikzpicture}
      }
    \end{vplace}
  }}
}


\newcommand{\prefrontmatter}{
    \pagenumbering{alph}
    \ifconfidential
        \AddToShipoutPictureBG{\confidentialbox{10}}   % 10% classified box in background on each page
        \AddToShipoutPictureFG*{\confidentialbox{100}} % 100% classified box in foreground on first page
    \fi
}


\newcommand{\blanktitlepage}[1]{%
  \thispagestyle{empty}%
  \sffamily%
  \calccentering{\unitlength}%
  \begin{adjustwidth*}{\unitlength}{-\unitlength}%
    \begin{adjustwidth}{-0.5cm}{-0.5cm}%
      #1
    \end{adjustwidth}%
  \end{adjustwidth*}%
  \normalfont%
  \normalsize%
}

\renewcommand{\maketitle}{%
  \blanktitlepage{%
    \begin{flushright}
      \hfill\includegraphics[scale=0.7]{\thelogo}
    \end{flushright}
    \vspace*{\fill}
    \noindent
    \HUGE \raggedright \thetitle{}\\*[0.2cm]
    \Huge \thesubject\\*[1.2cm]
    \LARGE
    \theauthor\\*[1.2cm]
    \large
    \thecity\ \the\year\\*[1.2cm]
    \includegraphics[width=0.75\textwidth]{\thedeplogo}
  }
}


\newcommand{\blankcolophon}[1]{%
  \cleartoevenpage%
  \thispagestyle{empty}% No page numbers
  \ifwatermark\makewatermark\fi%
  \noindent%
  \sffamily%
  \small%
  #1%
  \normalsize%
  \normalfont%
  \clearforchapter%
}

\newcommand{\makecolophon}{%
  \blankcolophon{%
    \thetype\\
    \\
    \textbf{\thetitle}\\
    \thesubject\\
    \\
    \theauthor\\
    \theemail\\
    \\
    \vspace*{\fill}\\
    \theaddress
  }
}


\begin{comment}
  \part{Biblatex hacks}
\end{comment}


% Hack for dealing with biblatex, use before usepackage{biblatex}
\newcommand{\prebiblatexhacks}{
  % Hack for correct theauthor, biblatex redefines this
  \let\classtheauthor\theauthor     % save class definition
  \let\theauthor\relax              % 'undefine' \theauthor
}

% Hack for dealing with biblatex, use after usepackage{biblatex}
\newcommand{\postbiblatexhacks}{
  % .. continued hack for theauthor
  \let\biblatextheauthor\theauthor  % rename biblatex’s \theauthor
  \let\theauthor\classtheauthor     % restore \theauthor to the class definition

  % Hack for corret hyperlink using biblatex
  \makeatletter
  \defbibheading{bibliography}[\refname]{\chapter{##1}}
  \makeatother
}

