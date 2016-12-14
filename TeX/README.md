# TeX

These are configurations and templates for TeX based systems. They are created based on the packages and fonts included in 'texlive-full', as well as `latexmk`.

## Dependencies

 - latexmk
 - texlive-full

## latexmk

Place `.latexmkrc` in your home directory. Then, execute `latexmk` in the folder with the `.tex` file to build the a PDF.

The `latexmk` configuration makes use of LuaLaTeX to produce PDFs. On top of that, it also configures several additional files to be associated with latexmk so that they can be cleaned.

> `.bbl` files will be cleaned. The configuration file assumes the use of a `.bib` file.

## Template

`TexDocument.tex` is a generic boilerplate latex template file to quickly set up a document.

 - Fields that needs to be filled are marked by `<++>`. This marker can be automatically replaced via `<C-j>` if [vim-latex](https://github.com/vim-latex/vim-latex) is used.
 - Common packages/options are defined, and commented out. Uncomment them as needed. Descriptions are included beside each package. All packages are included in a full texlive distrubution.

> The template uses `fontspec`, and requires either XeLaTex or LuaLaTeX to build.

2 sets of fonts are defined:

1. Default set
 - Main Font (serif): Baskervaldx
 - Sans Serif: TeX Gyre Heros
 - Monospace: Latin Modern Mono
 - Math Font: Cambria Math
2. Alternate set
 - Main font (serif): Latin Modern
 - Sans Serif: TeX Gyre Heros
 - Monospace: Roboto Mono (requires external installation)
 - Math Font: Latin Modern Math

> You can copy `TexDocument.tex` to `~/Templates` add a template entry in nautilus.

