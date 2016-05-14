import subprocess


biblio = {'bibtex', 'biblatex'}

texengines = {
    'latex-ps'  :'-ps -pdfps',
    'latex-dvi' :'-dvi -pdfdvi',
    'pdflatex'  :'-pdf',
    'xelatex'   :'-xelatex', 
    'lualatex'  :'-lualatex',
}

for tex, arg in texengines.iteritems():
    for b in biblio:
        execute = 'latexmk %s -jobname=test_%s_%s  -f -gg example_%s.tex' % (arg, tex, b, b)
        subprocess.Popen(execute, shell=True)
