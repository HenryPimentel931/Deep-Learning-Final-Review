\ProvidesClass{lzureport}
\LoadClass[a4paper,12pt]{ctexart}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\usepackage{fontspec}
\usepackage{fancyhdr}
\usepackage{lipsum}
\usepackage{zhlipsum}
\usepackage{soul}
\newcommand{\mathcolorbox}[2]{\colorbox{#1}{$\displaystyle #2$}}

\usepackage[inline]{enumitem}
\usepackage{caption}
\usepackage{amsmath}
\usepackage{amssymb} % 输出 \because 和 \therefore
\usepackage{mathtools}
\usepackage{mathrsfs}
\usepackage{graphicx}
\usepackage[dvipsnames]{xcolor}  % 更全的色系
\usepackage{listings}  % 排代码用的宏包
\usepackage{tikz}  % 画图用的宏包

% 在代码中天数数学公式
\usepackage{algorithm}
\usepackage{algpseudocode}

% \setmainfont{texgyrepagella-regular.otf} 
\setmainfont{Times New Roman}
\bibliographystyle{IEEEtran}

\geometry{top=1.25in,bottom=1.25in,left=1.25in,right=1.25in}

% 信息
\newcommand\major[1]{\def\@major{#1}}
\newcommand\name[1]{\def\@name{#1}}
\newcommand\stuid[1]{\def\@stuid{#1}}
\newcommand\college[1]{\def\@college{#1}}
\renewcommand\date[1]{\def\@date{#1}}
\newcommand\expname[1]{\def\@expname{#1}}
\newcommand\course[1]{\def\@course{#1}}

%页眉页脚
\pagestyle{fancy}
\fancyhead[L]{\@name}
\fancyhead[C]{\@expname}
\fancyhead[R]{\@stuid}

% 封面
\newcommand{\makecover}{
  \thispagestyle{empty}
  \begin{center}
    \begin{center}
      \includegraphics[width=4cm]{figure/JLU_LOGO.png}\\
      \includegraphics[width=6cm]{figure/JLU.png}
    \end{center}
    \vspace{1cm}
    \bfseries\huge{\@course}\\
    \vspace{0.5cm}
    \bfseries\Large{内容：\@expname}
    \vspace{2cm}
    \begin{center}
      \large
      \renewcommand\arraystretch{1.6}
      \begin{tabular}{p{2cm}p{6cm}}
        \bfseries{姓名：} & \@name   \\ \cline{2-2}
        \bfseries{学院：} & \@college \\ \cline{2-2}
        \bfseries{专业：} & \@major  \\ \cline{2-2}
        \bfseries{学号：} & \@stuid  \\ \cline{2-2}
      \end{tabular}
    \end{center}
    \vfill
    \Large{\@date}
  \end{center}
  \newpage
}

% 设置公式编号样式为“章节编号.公式编号”  
\numberwithin{equation}{section}  
  
% % 设置公式编号样式为“章节编号.公式编号”
% \numberwithin{equation}{section}

% % 设置公式编号为独立序号，不与章节相关
% % 重新定义 \theequation 命令
% \renewcommand{\theequation}{\thesection.\arabic{equation}}

% % 定义新的命令 \eqref，使其输出格式为带括号的编号
% \newcommand{\eqref}[1]{(\ref{#1})}

%%% 制作方框 $> texdoc mdframed
\usepackage[framemethod=TikZ]{mdframed}
%%%% 定理的样式
\newcounter{Thm}[section]
%\renewcommand{\theThm}{\arabic{section}.\arabic{Thm}}
\newenvironment{Thm}[1][]{
	\refstepcounter{Thm}
	\mdfsetup{
		frametitle={
			\tikz[baseline=(current bounding box.east), outer sep=0pt]
			\node[anchor=east,rectangle,fill=orange!20]
      {\strut \ifstrempty{#1}{}{~#1}};},%Theorem~\theThm\ifstrempty{#1}{}{:~#1}};},
		innertopmargin=10pt,linecolor=orange!20,
		linewidth=2pt,topline=true,
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax
}{\end{mdframed}}

%%%%% 证明环境
\usepackage[leftbars,color,xcolor]{changebar}
\definecolor{DeriveColor}{rgb}{.85,.2,.25}
\setlength{\changebarsep}{-3pt}
 \setlength{\changebarwidth}{2pt}

 \newenvironment{derivation}[1]
    {\cbcolor{DeriveColor}\par \vspace{10pt}
     \begin{changebar}
    \begin{enumerate}\item[]
     \noindent\textbf{#1}
     \par\vspace{5pt}\small\noindent
   } {\end{enumerate}
 \end{changebar}\par \vspace{10pt}}

 %%%%% 举例环境
\definecolor{BarColor}{rgb}{.1,.3,.6}

%\newcounter{example}[chapter] % 这里是report没有chapter，所以用section
\newcounter{example}[section]
\renewcommand{\theexample}{\thesection.\arabic{example}}
\newcommand{\exProblem}{\par\vspace{2pt}\small\noindent\noindent}
\newcommand{\exSolution}{\par\vspace{10pt}\noindent\textbf{解:} }

\newenvironment{example}
    {\cbcolor{BarColor}\par \vspace{10pt} 
	\begin{changebar}
    \begin{enumerate}\item[]
     \refstepcounter{example}\noindent\textbf{例子
     \theexample} 
	 } {\end{enumerate} 
\end{changebar}\par \vspace{8pt}}

%%% 定义颜色
% 颜色设置
\definecolor{YBXPurple}{RGB}{102,8,116}
\definecolor{YBXGreen}{RGB}{0,166,82}
\definecolor{YBXRed}{RGB}{157,41,51}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% listings设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\lstset{
	language = Python,
	backgroundcolor = \color{yellow!10},    % 背景色：淡黄
	basicstyle = \small\ttfamily,           % 基本样式 + 小号字体
	rulesepcolor= \color{gray},             % 代码块边框颜色
	breaklines = true,                  % 代码过长则换行
	numbers = left,                     % 行号在左侧显示
	numberstyle = \small,               % 行号字体
	keywordstyle = \color{blue},            % 关键字颜色
	commentstyle =\color{green!100},        % 注释颜色
	stringstyle = \color{red!100},          % 字符串颜色
	frame = shadowbox,                  % 用（带影子效果）方框框住代码块
	showspaces = false,                 % 不显示空格
	columns = fixed,                    % 字间距固定
	%escapeinside={<@}{@>}              % 特殊自定分隔符：<@可以自己加颜色@>
	morekeywords = {as},                % 自加新的关键字（必须前后都是空格）
	deletendkeywords = {compile}        % 删除内定关键字；删除错误标记的关键字用deletekeywords删！
}