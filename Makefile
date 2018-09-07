all: shell

shell:

	rm -f Run/init~
	rm -f Run/shell~

	mkdir -p Run

	gcc -o Run/init Src/init.c

	gcc -o Run/shell Src/shell.c
