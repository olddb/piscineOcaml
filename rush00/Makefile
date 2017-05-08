OCAML_DEFAULT_DIRS=\
	Core
SOURCES =\
	Data/Config.mli\
	Data/Mapp.mli\
	Gui/Ncurses.mli\
	\
	Data/Config.ml \
	Data/Mapp.ml \
	Data/Gconf.ml\
	Gui/Ncurses.ml\
	Gui/Gui.ml\
	Core/Core.ml\
	Core/main.ml

RESULT = tictactoe

LIBS=$(WITHUNIX)
WITHUNIX = unix

CAMLC = ocamlc.opt
CAMLOPT = ocamlopt.opt

all: native-code

native: native-code

byte: byte-code

include OCamlMakefile
