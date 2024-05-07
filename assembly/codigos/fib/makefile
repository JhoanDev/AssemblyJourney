NOME = fib

all: $(NOME).cpp $(NOME).o
	g++ $(NOME).o $(NOME).cpp -o main
	rm -rf *.o
	clear

%.o: %.asm
	nasm -f elf64 $<