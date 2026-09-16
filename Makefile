PROG = to_upper swap find_max_index sort

all: $(PROG)

to_upper: to_upper.o to_upper_c.o to_upper_s.o
	gcc -g -o $@ $^

swap: swap.o swap_c.o swap_s.o
	gcc -g -o $@ $^

find_max_index: find_max_index.o find_max_index_c.o find_max_index_s.o
	gcc -g -o $@ $^

sort: sort.o sort_c.o sort_s.o find_max_index_c.o find_max_index_s.o
	gcc -g -o $@ $^

%.o: %.c
	gcc -g -c -o $@ $<

%.o: %.s
	as -g -o $@ $<

clean: 
	rm -rf $(PROG) *.o
