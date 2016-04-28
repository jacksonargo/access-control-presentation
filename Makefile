main:
	pdflatex --draftmode main.tex
	pdflatex main.tex
clean:
	rm main.toc main.snm main.out main.nav main.aux main.log
