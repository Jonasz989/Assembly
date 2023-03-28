all: add substract

add: add.s
	as --gstabs -o add.o add.s
	ld -o add add.o

substract: substract.s
	as --gstabs -o substract.o substract.s
	ld -o substract substract.o 

clean:

	rm -f add add.o substract substract.o