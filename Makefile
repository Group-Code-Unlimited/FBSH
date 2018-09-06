all: shell

shell:

	rm -f Src/shell~

	gcc -o Run/init Src/init.c
