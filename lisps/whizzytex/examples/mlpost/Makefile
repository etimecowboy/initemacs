mlpostx: mlpostx.byte mlpostx.native
	cp _build/mlpostx.native $@

mlpostx.byte: mlpostx.ml
	ocamlbuild -classic-display -lib unix -lib str mlpostx.byte

mlpostx.native: mlpostx.ml
	ocamlbuild -classic-display -lib unix -lib str mlpostx.native

main.advi: main.tex
	mlpostx main.tex
	latex '\def\WhizzyMode{}\input' main.tex
	mv main.dvi main.advi


clean:
	rm -f main:*.{mps,fonts} *.font main-*.log main-*.err main.cahe
	ocamlbuild -clean
