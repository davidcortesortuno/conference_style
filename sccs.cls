% This work is licensed under the Creative Commons Attribution-NonCommercial 4.0
% International License. To view a copy of this license, visit
% http://creativecommons.org/licenses/by-nc/4.0/ or send a letter to Creative
% Commons, PO Box 1866, Mountain View, CA 94042, USA.
% 
%
%
% Style class for a conference database (names, abstracts, affiliations, emails,
% etc) Some of the packages are not necessary but this was taken from a previous
% work, so it still needs a proper formatting
% 
% Author: David Ignacio Cortes
% Email: dic1e13@soton.ac.uk
% 
% Created on Wed 13 Apr 2016 22:29:43 BST
% Images and logos are property of the University of Southampton
% 
% 
% 
% Intended to use with LuaLatex
%
% We shouldnt have used article. Komascript should be better
% but it was a first try
\LoadClass[11pt,twoside,a4paper]{article}
\usepackage{lipsum}

% For strange characters. We output Python in UTF8 format
\usepackage[utf8]{luainputenc}
\usepackage[T1]{fontenc}
\usepackage{csquotes}
% Due to our bad database formatting, we need to reformat
% some quotes!
\MakeOuterQuote{"}

% For symbols
\usepackage{gensymb}

% For multi columns
\usepackage{multicol}

% To avoid hypenathion in some titles (breaking words)
\usepackage{hyphenat}

% Remove indentations
\setlength{\parindent}{0pt}

%\RequirePackage{david_style}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%   PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\usepackage[bitstream-charter]{mathdesign}
\usepackage[usenames,dvipsnames]{xcolor}

% The conference colours
\definecolor{mycolour}{HTML}{FF5814}
\definecolor{back}{HTML}{141414}
% \definecolor{fore}{HTML}{E01BC6}
\definecolor{fore}{HTML}{DE3523}

\usepackage{amsmath}

% Margins
\usepackage[top=2.6cm, bottom=3cm, left=4.1cm, right=3cm]{geometry}

% To change sections Sections
\usepackage{tikzpagenodes}
\usepackage[explicit, raggedright, pagestyles]{titlesec}

% Hyperlinks
\usepackage[%
        bookmarks,
        linkbordercolor=white,% 
	    urlbordercolor=white,% 
	    colorlinks=true,% 
	    linkcolor=back,%
	    urlcolor=back,%
        bookmarksopen,
        bookmarksnumbered,
	    citecolor=back]{hyperref}

% Footnotes (to split to different pages, reduce the penalty)
%\interfootnotelinepenalty=0

% To include the extra cover page
\usepackage{pdfpages}

% Math:
\usepackage[math]{kurier}

% %%%%%%%%%%%%%%%%% FONTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We use Lato (you need to install it)

\RequirePackage[no-math]{fontspec}
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[BoldItalicFont={Lato Italic}, ItalicFont={Lato Light Italic}, BoldFont={Lato Bold}]{Lato Light}
%\setsansfont[BoldItalicFont={Fira Sans Italic}, ItalicFont={Fira Sans Light Italic}, BoldFont={Fira Sans}]{Fira Sans Light}
\setmonofont{Fira Mono}
\newfontfamily\ExtraLight{Lato Light}
\newfontfamily\UltraBold{Lato_900}
\newfontfamily\Light{Lato Light}
\newfontfamily\Book{Lato}
\newfontfamily\Medium{Fira Sans Medium}
% The first parameter (50) is font size. The second parameter (60) is
% line spacing. An appropriate line spacing depends on the font.
% Something like 1.2 times font size is commonly used with CM fonts
\newcommand\TITLESIZE{\@setfontsize\Huge{19}{19}}
\newcommand\HUGE{\@setfontsize\Huge{40}{65}}
\newcommand\HUGESECTION{\@setfontsize\Huge{60}{100}}
\newcommand\HUGEE{\@setfontsize\Huge{1.6cm}{1.8cm}}
\newcommand\COVERSIZE{\@setfontsize\Huge{1.5cm}{3cm}}


% For LuaLateX only
\newcommand\substring[3]{%
    \directlua{ tex.sprint ( string.sub ( "#1", #2, #3 ) ) } }

\usepackage{xstring}

% For the image
\tikzset{%
  path image/.style={%
    path picture={%
      \node[inner sep=0pt, outer sep=0pt] at (path picture bounding box.center) {%
          \includegraphics[height=24cm]{./image_example.jpg}};}},
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% CUSTOM SECTIONS %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usetikzlibrary{fadings}

% Sections for the subjects of the Conference
% Big Image fading from top
\tikzfading[name=fade top,
top color=transparent!0, bottom color=transparent!100]

\titleformat{name=\section,page=odd}[block]%
{\Large}%
% Default measures in cm
{%
 	\flushleft
    \begin{tikzpicture}[remember picture, overlay, xshift=-4.1cm, yshift=4cm]
        % \fill[titlepagecolor] (0, 0) rectangle (15, -8); 
        % \path[fill stretch image={height=3cm}{}] (0,0) rectangle (\textwidth, 4cm);
        \fill[path image] (0, 0) rectangle (\paperwidth, -13);
        \fill[white, scope fading=north] (0, -4) rectangle (\paperwidth + 0.2, -13.1);
        \node(x)[text=fore] at (4.1, -16) {\HUGESECTION \bfseries{\thesection}};
        \node[below right, text=back, text width=14cm,%
        execute at begin node=\setlength{\baselineskip}{4em}] at (x.north east) {\HUGESECTION \ExtraLight \nohyphens{#1}};
    \end{tikzpicture}
}%
{0cm}%
{\thispagestyle{empty}\vspace{4cm}}

% \titleformat{name=\section,page=even}[block]%
% {\Large}%
% % Default measures in cm
% {%
%  	\flushleft
%     \begin{tikzpicture}[remember picture, overlay, xshift=-4.1cm, yshift=4cm]
%         % \fill[titlepagecolor] (0, 0) rectangle (15, -8); 
%         % \path[fill stretch image={height=3cm}{}] (0,0) rectangle (\textwidth, 4cm);
%         \fill[path image] (0, 0) rectangle (\paperwidth, -13);
%         \fill[white, scope fading=north] (0, -4) rectangle (\paperwidth + 0.2, -13.1);
%         \node[text=fore] at (4.1, -16) {\HUGE \bfseries{\thesection}};
%         \node[right, text=back] at (5.1, -16) {\HUGESECTION \ExtraLight #1};
%     \end{tikzpicture}
% }%
% {0cm}%
% {\vspace{4cm}}


% Sections for the Daily Schedule
% Dirty hack: we use the numberless sections for the days

\titleformat{name=\section,numberless,page=odd}[hang]%
{}%Format, e.g. \bfseries, etc
% Default measures in cm
{%
    \begin{tikzpicture}[remember picture, overlay]
  	\fill[back]
 	(0, 0)%
    rectangle%
    (13.95, -3);%
    \fill[fore]
 	(14, 0)%
    rectangle%
    (17, -3);%
    \node[rectangle,minimum width=4cm, minimum height=4cm, text=fore]%
    at (2, -1.5) {\HUGE\ExtraLight Day};%
    \node[rectangle,minimum width=4cm, minimum height=4cm, text=back]%
    at (15.5, -1.5) {\HUGE\ExtraLight #1};%
%
    \end{tikzpicture}%
}%
{0pt}%Spacing between title and number
{\vspace{4cm}}%Command after title body

\titleformat{name=\section,numberless,page=even}[hang]%
{}%Format
% Default measures in cm
{%
    \begin{tikzpicture}[remember picture, overlay]
  	\fill[back]
 	(-3, 0)%
    rectangle%
    (10.85, -3);%
    \fill[fore]
 	(10.9, 0)%
    rectangle%
    (13.9, -3);%
    \node[rectangle,minimum width=4cm, minimum height=4cm, text=fore]%
    at (-1, -1.5) {\HUGE\ExtraLight Day};%
    \node[rectangle,minimum width=4cm, minimum height=4cm, text=back]%
    at (12.5, -1.5) {\HUGE\ExtraLight #1};%
%
    \end{tikzpicture}%
}%
{0pt}%Spacing between title and number
{\vspace{4cm}}%Command after title body

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5%%%%%%%%%%%%%%%%%
% SUBSECTIONS for the abstracts FORMAT
% The spacing between the first letter of the abstract title and the title
% itself can be formatted to fit better
% Also, justification can be changed to a left or right align

\titleformat{name=\subsection,page=odd}[hang]%
{\Large}%
% Default measures in cm
{%\hspace{-200pt}%		
    \begin{tikzpicture}[remember picture, overlay, xshift=-4.1cm]
  	\fill[back]
 	(0, 0)%
    rectangle%
    (4, -4);%
    \node(x)[rectangle,minimum width=4cm, minimum height=4cm, text=fore]%
    at (2, -2) {\HUGE\ExtraLight\thesubsection};%
%
	\node[below right, text width=13.5cm, fill=white, text=back,%
    align=justify, execute at begin node=\setlength{\baselineskip}{1.4em}]%
    at ([yshift=-1cm]x.north east) {\hspace{2.01cm}%
    \TITLESIZE\nohyphens{\StrGobbleLeft{#1}{1}} };%
%
\node[rectangle, below right, minimum width=1.65cm, minimum height=1.65cm,%
    fill=fore, text=back, text centered] at ([xshift=0.05cm]x.north east)%
    {\HUGEE{\StrLeft{#1}{1} } };%
%
	\draw[line width=0.5pt, color=back, dash pattern=on 5pt off 3pt]%
    ([yshift=-0.1cm]x.south east) -- ([yshift=-16.3cm]x.south east);
    %
    \end{tikzpicture}%
}%
{0cm}%
{\vspace{3.6cm}}

% The subsections for even pages
\titleformat{name=\subsection,page=even}[hang]%
{\Large}%
% Default measures in cm
{%\hspace{-200pt}%		
    \noindent
    \begin{tikzpicture}[remember picture, overlay]
  	\fill[back]
    (14, 0)%
    rectangle%
    (18, -4);%
    \node(x)[rectangle,minimum width=4cm, minimum height=4cm, text=fore]%
    at (16, -2) {\HUGE\ExtraLight\thesubsection};%
%
    \node[below right, text width=13.5cm, fill=white, text=back, align=justify,%
    execute at begin node=\setlength{\baselineskip}{1.4em}] at (0, -1)%
    {\hspace{2.01cm}  \TITLESIZE\nohyphens{\StrGobbleLeft{#1}{1} } };%
%
\node[rectangle, below right, minimum width=1.65cm, minimum height=1.65cm,%
    fill=fore, text=back, text centered] at (0, 0)%
    {\HUGEE{\StrLeft{#1}{1} }};%
    %
    \draw[line width=0.5pt, color=back, dash pattern=on 5pt off 3pt]%
    ([yshift=-0.1cm]x.south west) -- ([yshift=-16.3cm]x.south west);%
%	
    \end{tikzpicture}%
}%
{0cm}%
{\vspace{3.6cm}}


% After each section:
% \newcommand{\sectionbreak}{\clearpage}
% \newcommand{\subsectionbreak}{\vspace{0.5cm}}


% Table of contents
\usepackage{titletoc}

\titlecontents{section}[0cm]
{\addvspace{0.7cm}%
\begin{tikzpicture}[remember picture, overlay]%
    \draw[fill=back, text=fore] (0, 1) rectangle (1, 0);%
	\node[rectangle,minimum width=1cm, text=fore]%
    at (0.5, 0.5) {\bfseries\thecontentslabel};%
\end{tikzpicture}\contentsmargin[-1cm]{0cm}}%
{\hspace{1.2cm}} % Commands before the title of the index entry
{} % Filler and title page
{\;\titlerule\;\large\bfseries \thecontentspage} % After the code for , e.g. vertical space

% Subsections
\titlecontents{subsection}[1.1cm] % Brackets spacing is the margin
{\addvspace{10pt} \thecontentslabel\contentsmargin[2cm]{0cm}}% Above code 
%                       We will correct the title margin with contentsmargin
{\hspace{0.6cm}} % Commands before the title of the index entry (entry format)
{} % Numberless entry format
{\;\titlerule*[6pt]{.}\;\bfseries \thecontentspage} % After the code for , e.g. vertical space

% New title format for the Contents Section
\makeatletter
\renewcommand{\tableofcontents}{%
    \begin{tikzpicture}[remember picture, overlay]%
        \fill[fore]
        (-4.1, 0)%
        rectangle%
        (0, -4);%
        \node[rectangle, minimum width=1cm, minimum height=1cm, text=back]%
        at (-2.1, -2) {\Huge \contentsname};%
    \end{tikzpicture}%
    \vspace{4cm}%
\@starttoc{toc}%
}
\makeatother

% Daily schedule (time of talks) 
%
% Create a matrix with filled boxes for the timings (1st column) and
% the abstract titles in the second column. We will pass a single argument
% which is a list that we iterate with the tools below. every list element
% have the time and the abstract name separated by a '/' symbol
\usepackage{pgffor}
\usepackage{etoolbox}
\usetikzlibrary{matrix}

\newcommand{\dailysched}[1]{%
%
\begin{tikzpicture}
    % Expand before matrix 
    % http://tex.stackexchange.com/questions/22275/foreach-inside-a-tikz-matrix
    \let\mymatrixcontent\empty
    % \newcommand{\mystring}[1]{10:00 \& #1}
    \foreach \c/\d in {#1}{%
        % \renewcommand{\mystring}{10:00 \& \c}
        % or
        \xappto\mymatrixcontent{\expandonce{\d}}
        \xappto\mymatrixcontent{\expandonce{\&}}
        \xappto\mymatrixcontent{\expandonce{\c\\}}
    }
    % \show\mymatrixcontent
    \matrix [matrix of nodes, column sep=0.1cm, row sep=0cm,ampersand replacement=\&,%
                     column 1/.style={nodes={fill=back,text=fore},text width=2cm,%
                                      text centered, font=\Large\bf},%
                     column 2/.style={text width=12cm},%
                     nodes={minimum height=1.5cm,anchor=south},%
                     inner sep=0pt]%
    {\mymatrixcontent};
\end{tikzpicture}
}

% The same for a single column with a single column with abstract names
% and a first column with empty boxes
\newcommand{\postersched}[1]{%
%
\begin{tikzpicture}
    % Expand before matrix 
    % http://tex.stackexchange.com/questions/22275/foreach-inside-a-tikz-matrix
    \let\mymatrixcontent\empty
    % \newcommand{\mystring}[1]{10:00 \& #1}
    \foreach \c in {#1}{%
        % \renewcommand{\mystring}{10:00 \& \c}
        % or
        \xappto\mymatrixcontent{\expandonce{}}
        \xappto\mymatrixcontent{\expandonce{\&}}
        \xappto\mymatrixcontent{\expandonce{\c\\}}
    }
    % \show\mymatrixcontent
    \matrix [matrix of nodes,nodes in empty cells, column sep=0.1cm, row sep=0cm,ampersand replacement=\&,%
                    column 1/.style={nodes={fill=back,text=fore},minimum width=1.5cm,%
                                     text centered, font=\Large\bf},%
                    column 2/.style={text width=12cm},%
                    nodes={minimum height=1.5cm,anchor=south},%
                    inner sep=0pt]%
    {\mymatrixcontent};
\end{tikzpicture}
}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55%%%%%%%
% ABSTRACTS
%
% Make the side note to appear in the opposite margin
\reversemarginpar
% Insert an abstract with the Title, Full Name, Affiliation
% Email, Abstract Body, label for subsection, Session Format
\newcommand{\InsertAbstract}[7]{%
    
    % The abstract title in the Subsection
    \subsection{#1}  
    \label{#6}

    {\bfseries Author:} #2 \\
    {\bfseries Affiliation:} #3 \\
    {\bfseries Email:} #4 \\
    % 
    \vspace{0.1cm}

    % Show if it is a TALk or POSTER as a text under the section number
    \marginpar{%
        \vspace{-1.5cm}
        \Large {\bfseries #7}%
        %\begin{tikzpicture}[remember picture, overlay]
        %    \node[right] at ([yshift=-7.5cm, xshift=-4cm]current page.north east) {\Large {\bfseries TALK}};
        %\end{tikzpicture}
    }

    % The  abstract body 
    \begin{minipage}[t][12cm][t]{\textwidth}
    #5
    \vfill
    \end{minipage}

    \vspace{2cm} \vfill

    % A box for comments
    {\bfseries Comments:} \\[0.2cm]
    \noindent
    \begin{Form}
        \TextField[multiline=true, donotscroll=true,% 
        width=14.05cm, height=2.1cm, charsize=11pt, 
        borderwidth=0.2pt, bordercolor=back,%
        backgroundcolor=back!6]{}
    \end{Form}

    \clearpage

}
\usetikzlibrary{positioning, backgrounds}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title Page
% Format as desired

\newcommand{\FrontPage}{%
    % The abstract title in the Subsection
    \begin{titlepage}
    \newgeometry{top=0cm, bottom=0cm, left=0cm, right=0cm}
    \begin{tikzpicture}[remember picture, overlay]%
        \fill[back]
        (current page.north west)%
        rectangle%
        (6, -29.4);%
        \node [rotate=90, anchor=south west] at (2.5, -26) {\color{white}\COVERSIZE\UltraBold Student Conference};
        \node [rotate=90, anchor=south west] at (4.5, -26) {\color{white}\COVERSIZE\UltraBold on Some Subject};
        \node[inner sep=0pt, below right] (x) at (6.13, 0.24) {\includegraphics[scale=1.08]{./logo_FINAL_example.pdf}};
        \node[inner sep=0pt, below right] at (8, -25) {\color{back}\COVERSIZE\UltraBold ABSTRACT BOOK};
        %\node[rectangle, minimum width=1cm, minimum height=1cm, text=back]%
        %at (-2.1, -2) {\Huge \contentsname};%
    \end{tikzpicture}
    \begin{center}
        % {\color{back}\COVERSIZE\UltraBold Student Conference }\\[0.3cm]
        % {\color{back}\COVERSIZE\UltraBold on }\\[0.3cm]
        % {\color{back}\COVERSIZE\UltraBold Complex Systems }\\[1cm]
        % \includegraphics[scale=0.8]{./logo_FINAL.pdf}\\[3cm]
        % {\color{back}\COVERSIZE\UltraBold ABSTRACT BOOK }

    \end{center}
    \end{titlepage}
    \restoregeometry
}

% Copyright page
\newcommand{\CopyrightPage}{%
    % The abstract title in the Subsection
    \begin{titlepage}
        \newgeometry{top=20cm, bottom=2cm, left=3cm, right=3cm}
        5th Student Conference on Some Subject\\
        Institute for Simulations \\
        University of United Something, United Something\\
        Student Committee: Organiser 1, Organiser 2, David Cortes\\ 
        Copyright 2016 \\
        Design: David Cortes\\
        Pictures are property of the Institute, University of Something \\
        
    \end{titlepage}
    \restoregeometry
}
