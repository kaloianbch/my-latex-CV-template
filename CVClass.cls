 % Thanks to Jan Vorisek (jan@vorisek.me) and Vel from latextemlates.com for the basis of this class and some of the code (https://www.latextemplates.com/template/developer-cv)

\NeedsTeXFormat{LaTeX2e}			% Required version of LaTeX
\ProvidesClass{CVClass}				% Class name
\LoadClass{article}					% Base class to build on top of


\usepackage[hidelinks]{hyperref}	% Required for links but hide the default boxes around links
\usepackage{moresize} 				% Provides more font size commands (\HUGE and \ssmall)
\usepackage{fontawesome}			% Required for FontAwesome icons
\usepackage{geometry}				% Required for adjusting page dimensions and margins
\usepackage[utf8]{inputenc}			% Required for inputting international characters
\usepackage[T1]{fontenc}			% Output font encoding for international characters
\usepackage[default]{raleway}		% Font package
\usepackage[none]{hyphenat}			% Removes hyphens, does not work with babel
\usepackage{xcolor}					% For changing text color
\usepackage{lipsum}					% For adding filler text
\usepackage{ifthen}					% For if statements
\usepackage{tikz}					% Required for creating squares in the background
\usepackage{enumitem}				% Used to remove indentatation


\setlength{\parindent}{0mm} 		% Suppress paragraph indentation
\pagestyle{empty} 					% No headers or footers
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm}				% Default tikz units
\geometry{
	paper=a4paper,	% Paper size, change to letterpaper for US letter size
	top=0.5cm,		% Top margin
	bottom=0.5cm,	% Bottom margin
	left=0.75cm,	% Left margin
	right=0.75cm,	% Right margin
	%showframe,		% Uncomment to show how the type block is set on the page
}


% desc: Command to vertically centre adjacent content
% args: Content to be aligned
\newcommand{\vcenteredhbox}[1]{
	\begingroup
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}
	\endgroup
}


% desc: Creates title of the CV
% args: #1 []optional title for applicant
% args: #2 Name of applicant
\renewcommand{\title}[2][]{	
	\mbox{}
	\vfill
	\bfseries
	\HUGE	% change to smaller size if text wraps
	\underline{#2}
	\newline
	\huge	% change to smaller size if text wraps
	\normalfont#1
	\vspace{15mm}
}


% desc: Creates icon with surrounding black box and text with an optional link
% args: #1 []optional Link for text
% args: #2 FontAwesome Icon name, IDs can be found in package README.pdf
% args: #3 Text accompanying the icon
\newcommand{\info}[3][]{
	\vcenteredhbox{
		\colorbox{black}{
			\makebox(6, 10){	%TODO - round edges of boxes
				\textcolor{white}{
					\large\csname #2\endcsname
				}
			}
		}
	}
	\hskip1mm
	\vcenteredhbox{\href{#1}{\small#3}}
	\vspace{1mm}
	\newline
}


% desc: Creates address icon and aligns and formats address text
% args: #1 Address with line seperators
\newcommand{\address}[1]{
	\vcenteredhbox{
		\colorbox{black}{
			\makebox(6, 10){	%TODO - round edges of boxes
				\textcolor{white}{
					\large\csname faMapMarker\endcsname
				}
			}
		}
	}
	\hskip1mm
	\parbox[t]{4cm}{\small#1}
	\vspace{1mm}
	\newline
}


% desc: Creates section title
% args: #1 Section name
% args: #2 Section content
\renewcommand{\section}[2]{
	\bfseries
	\Large
	\underline{#1}
	\vskip2mm
	\normalsize
	\normalfont
	#2
}


% desc: Adds and formats a subsection for describing an activity the applicant has done
% args: #1 []optional Time period of the activity
% args: #2 Job Title, Education level, etc. and Location
% args: #3 Description and details
\renewcommand{\subsection}[5][]{
	\parbox[t]{0.17\textwidth}{
		\raggedleft
		#2
		\hskip1mm
	}
    \hfill
    \parbox[t]{0.83\textwidth}{
		\raggedright
		\bfseries
		\href{#1}{#3}
		\\
		\href{#1}{#4}
		\newline
		\normalfont
		#5
    }
}

\newcommand{\subsecbullet}[1]{
	\\
	$\bullet$\,
	\parbox[t]{0.8\textwidth}{
		#1
	}
}


% desc: Fortmats a Language entry for the skills sections
% args: #1 []optional Proficiency
% args: #2 Language, be it programming or other
\newcommand{\lang}[2][]{
	\begin{minipage}[t]{0.25\textwidth}
		\bfseries
		#2
		
	\end{minipage}
	\begin{minipage}[t]{0.30\textwidth}
		#1
	\end{minipage}
	\vskip0.5mm
}


% desc: Fortmats a skill entry for the skills sections
% args: #1 Skill
\newcommand{\skill}[1]{
	#1
	\vskip0.5mm
}

% desc: Creates reference section
% args: #1 Content of section
\newcommand{\refsection}[1]{
	\vskip3mm
	\rule{\textwidth}{0.2mm}
	\bfseries
	\large 
	\underline{REFERENCES}
	\vskip1mm
	#1
}

% desc: Adds formatted reference
% args: #1 []optional link
% args: #2 Name of reference
% args: #3 Profession or association
% args: #4 Contact Information
\newcommand{\refentry}[4][]{
	\href{#1}{
	\small
	\normalfont
	\itshape
	#2 - #3
	\normalfont
	| #4
	}
	\vskip0.2mm
}

