The `antanilipsum` package is an italian blind text generator that ouputs _supercazzole_, mocking nonsense phrases from the movie series Amici Miei, directed by Mario Monicelli.  

The package is a modified version of `kantlipsum` by Enrico Gregorio that uses paragraphs from a variety of sources, including original movies, examples from the GitHub package [esseks/monicelli](https://github.com/esseks/monicelli), and online generators like [AntanIpsum](https://antanipsum.com).  

The package GitHub repo [AlphaJack/antanilipsum](https://github.com/AlphaJack/antanilipsum) is aimed to facilitate the creation of a custom blind text generator by simply replacing the paragraph files used to build this package.  

This released is based on `kantilipsum` version 0.8a.

Copyright 2020 Jack Coleman

It may be distributed and/or modified under the conditions of the LaTeX Project Public License (LPPL), either version 1.3c of this license or (at your option) any later version.  The latest version of this license is in the file https://www.latex-project.org/lppl.txt.
The author is Jack Coleman and is reachable at the email address `alphajack AT tuta DOT io`.

This work has the LPPL maintenance status "author-maintained".

This work consists of the following files:

- README.md (this file)
- antanilipsum.dtx
- antanilipsum.pdf

and of the derived file

- antanilipsum.sty

To install the distribution run

```
lualatex antanilipsum.dtx
```

It is also possible to use `tex` or `pdflatex` for the task, but `lualatex` [is advised](https://github.com/matlab2tikz/matlab2tikz/wiki/TeX-capacity-exceeded,-sorry) when using a large amount of paragraphs.
