\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{custom}[2024/02/17 Custom class for weekly reports]

\LoadClass{article}
% Report-specific packages

\RequirePackage{graphicx}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=blue,
  filecolor=blue,
  urlcolor=blue,
  citecolor=blue
}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{subcaption}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{multirow}
\RequirePackage{tikz}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{titling}
\RequirePackage{titlesec}

\RequirePackage{ctex}
% Choose Chinese fonts
\setCJKmainfont{Songti SC} % Main Chinese font (Songti)
\setCJKsansfont{Lantinghei TC} % Sans-serif Chinese font (Heiti)
% \setCJKmonofont{Maple Mono NF CN} % Monospaced Chinese font (Fangsong)

%% Customize the title format
\titleformat{\section}
{\normalfont\Large\bfseries}{\thesection}{1em}{}

% Settings specific to report
\geometry{margin=0.5in, paperheight=11in, paperwidth=8.5in} % Set paper size

\renewcommand{\maketitle}{
  \begin{center}
    \LARGE\bfseries\thetitle\\[0.5em]
    \large\today
  \end{center}
}