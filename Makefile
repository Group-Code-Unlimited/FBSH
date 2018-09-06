all: shell

shell:

	rm -f Src/shell~

	mkdir -p Run

	gcc -o Run/init Src/init.c
