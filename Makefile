all:
	./uart.sh

.PHONY: clean
clean:
	rm -f synth.vhd *.ghw *.cf