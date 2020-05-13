# antanilipsum

`kantlipsum` come se fosse antani

## Description

> "Supercazzola is an italian nonsense phrase composed of invented words, which is used as a joke in order to mock or confuse the person to whom the phrase is addressed."
>
> [taganaka](https://github.com/esseks/monicelli/pull/21/commits/223bb47d39298dd5b22423d882a190c6679c9c93)

The package spits out _supercazzole_ in [Amici Miei style](https://www.youtube.com/watch?v=_9MTJw5ctVE), the text is taken both from the [original movies](https://en.wikipedia.org/wiki/My_Friends_(film)) and online generators, but user produced content is also available in the git repo.  

The package is a modified version of [kantlipsum](https://www.ctan.org/pkg/kantlipsum) by Enrico Gregorio and can easily be hacked with texts of your choice.



## File organization

This repo is organized in various folders:

- `build`, which contains the script used to generate the package;

- `dist`, which contains the package file and its documentation;

- `example`, which contains an example document;

- `sources`, which contains the files used to generate the package;

- `sources-extra`, which contains additional text files not read by the build script.

	

## Usage

### Installation

#### Package manager

`antanilipsum` is available from the [CTAN](https://www.ctan.org/pkg/antanilipsum) website

#### DIY approach

Place `antanilipsum.sty` in your project folder

### Commands

```latex
\usepackage{antanilipsum} % uses the package

\usepackage[nopar]{antanilipsum} % doesn't end paragraphs with a \par command, as "[par]" is the default option

\usepackage[numbers]{antanilipsum} % each paragraph will be preceded by its number

\usepackage[index]{antanilipsum} % each paragraph will generate an index entry that will appear with packages like "imakeidx" with the command \makeindex and \printindex

\antani % prints the first 7 paragraphs

\antani* % if "[par]" is set, it behaves like "[nopar]", and vice versa

\antani[1] % prints the paragraph #1

\antani[2-4] % prints the paragraphs #2 to #4

\antani[5][6-8] % prints the sentences #6 to #8 of the paragraph #5

\antanidef{\barilotto}{8} % defines the variable "barilotto" as the paragraph #8
\barilotto % prints the paragraph #8
\\ % adds a new line
\barilotto % prints again the paragraph #8
```

Instructions unclear, got scappellamento a destra? Read `dist/antanilipsum.pdf`



## Build

You may need to install the `csquotes` package if you don't have it. 

Modify `sources/template.dtx`, `sources/words.txt` (used to generate the index) and the files you want inside the `sources` folder, make sure that:

- paragraph files begin with `par`;

- every paragraph is contained in a single line.

Go inside the `build` folder and run the `build.sh` script. It will:

1. make a copy of `sources/template.dtx` called `build/antanilipsum.dtx`;
1. read the files inside the `sources` folder and format their paragraphs to be compiled in $\LaTeX$ ;
1. write the modified paragraphs to `antanilipsum.dtx` replacing the string `%replacemewithparagraphs`;
1. read the word list inside `sources/words.txt` and format it to be compiled in $\LaTeX$ ;
1. write the modified word list to `antani.dtx` replacing the string `%replacemewithwords`;
1. compile the modified `antanilipsum.dtx` with `lualatex`;
1. create a `build/dist` folder and move inside it
	- `antanilipsum.dtx`, the file it just compiled;
	- `antanilipsum.sty`, the file sourced with the command `\usepackage{antanilipsum}`;
	- `antanilipsum.pdf`, the documentation that explains the code;
	- `README.md`, a brief description of the package.
1. create a `build/buildfiles` folder and move inside it the other files it generates.

These two folders will be automatically deleted the next time the script is run.  

If you want to make your own package, a batch replace of "antani" in `sources/template.dtx` and `build/build.sh` with something of your choice, like "fuffaro", should be enough to make the package work with commands like:

```latex
\usepackage{fuffarolipsum}
\fuffaro[4]
\fuffarodef{\turbocapitalismo}{6}
\turbocapitalismo
```

Manual edit of `sources/template.dtx` is required if you want to modify the author of your package.



## Credits

### Kantlipsum

https://ctan.org/pkg/kantlipsum

### Used sources

http://web.archive.org/web/20060306103011/http://www.ilcineforum.it/frasi/supercazzole.asp

http://www.polygen.org/it/grammatiche/musica_cinema_e_spettacolo/ita/antani.grm

https://github.com/esseks/monicelli

https://antanipsum.com/

### Extra sources

https://twitter.com/FuffaroDiego

http://it.heracleums.org/fun/supercazzole/

https://nonciclopedia.org/wiki/Supercazzola



## License

[LPPL 1.3c](https://www.latex-project.org/lppl/)

A TD;DR summary is available [here](https://tldrlegal.com/license/latex-project-public-license-v1.3c-(lppl-1.3c))
