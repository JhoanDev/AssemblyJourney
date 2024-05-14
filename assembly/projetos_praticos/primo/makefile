NOME = primo

all: $(NOME).cpp $(NOME).o
	g++ -no-pie $(NOME).o $(NOME).cpp -o main
	rm -rf *.o
	clear

%.o: %.asm
	nasm -f elf64 $<