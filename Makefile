all: cskeeper

cskeeper: main.o
	gcc --std=gnu99 -g -o $@ $^

main.o:main.c
	gcc --std=gnu99 -g -c $^

clean:
	@rm -f *.o  Makefile*~ cskeeper

install:
	mkdir -p ~/bin
	cp -av ./cskeeper ~/bin/
	cp -av ./vimscripts/* ~/.vim/plugin/

prepare_commit:
	make clean
	@rm -f cscope*
