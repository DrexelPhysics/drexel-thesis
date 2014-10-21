The LaTeX class drexel-thesis is distributed in the docstrip file ``drexel-thesis.dtx`` with the install file ``drexel-thesis.ins``.  For more information on the docstrip format, look here__ and here__.

__ http://www.ctan.org/tex-archive/info/dtxtut/
__ http://www.ctan.org/tex-archive/macros/latex/base/

To generate the class file ``drexel-thesis.cls``, the template files,
the PDF documentation, and a bunch of intermediate files, run::

  $ make

in this directory.  You'll need to install ``drexel-thesis.cls``
somewhere in `your texmf tree`__ (or just dump it into the top level
of your thesis directory).  Running::

  $ make temp-clean

will get rid of the intermediate files.

__ http://www.tex.ac.uk/cgi-bin/texfaq2html?label=privinst

We also package the LyX template ``drexel-thesis.layout`` to assist
those using the drexel-thesis template with LyX.

Happy TeXing!
