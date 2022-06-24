all: supermon64.prg

supermon64.prg: relocate.prg supermon64-8000.prg supermon64-C000.prg
	./build.py $^ $@

supermon64-8000.prg: supermon64.asm
	64tass -i $< -o $@ -DORG='$$8000'

supermon64-C000.prg: supermon64.asm
	64tass -i $< -o $@ -DORG='$$C000'

relocate.prg: relocate.asm
	64tass -L relocate.lst -i $< -o $@

clean:
	rm -f relocate.prg
	rm -f supermon64-8000.prg
	rm -f supermon64-C000.prg
	rm -f supermon64.prg
	rm -f relocate.lst
	rm -f hex

