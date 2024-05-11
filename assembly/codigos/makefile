NOME = quadrado

target: $(NOME).o
	ld -s -o main $(NOME).o
	rm -rf *.o
	clear

%.o: %.asm
	nasm -f elf64 $<
