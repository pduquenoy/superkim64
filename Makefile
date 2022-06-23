all: supermon64.prg kimmon9000.ptp

supermon64.prg: relocate.prg supermon64-8000.prg supermon64-C000.prg
	./build.py $^ $@

supermon64-8000.prg: supermon64.asm
	64tass -L 8000 -i $< -o $@ -DORG='$$8000'

supermon64-C000.prg: supermon64.asm
	64tass -i $< -o $@ -DORG='$$C000'

relocate.prg: relocate.asm
	64tass -L relocate.lst -i $< -o $@

kimmon9000.ptp: supermon64.prg
	srec_cat supermon64.prg -binary -offset 0x9000 -o kimmon9000.ptp -MOS_Technologies

clean:
	rm -f relocate.prg
	rm -f supermon64-8000.prg
	rm -f supermon64-C000.prg
	rm -f supermon64.prg
	rm -f 8000
	rm -f relocate.lst
