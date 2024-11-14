#
DISKNAME = A.dsk
DISKNAME800K = A.po

#A2SDK=C:/retrodev

PYTHON = python3.exe
PYTHON27 = python.exe
JAVA = java.exe -jar
ACME = acme.exe -f plain -o
AC = $(JAVA) $(A2SDK)/bin/ac.jar 
LZ4 = lz4new -f -9 --no-frame-crc
ZPACK = zpacker.exe
DIRECTWRITE = $(PYTHON) $(A2SDK)/bin/dw.py
DIRECTWRITE800K = $(PYTHON) $(A2SDK)/bin/dw800k.py
INSERTBIN = $(PYTHON27) $(A2SDK)/bin/InsertBIN.py
TRANSAIR = $(PYTHON) $(A2SDK)/bin/transair3.py
GENDSK = $(PYTHON) $(A2SDK)/bin/genDSK3.py
GENPO = $(PYTHON) $(A2SDK)/bin/genPO800k.py
COPYFILES = $(PYTHON27) $(A2SDK)/bin/InsertZIC.py
APPLEWIN = $(APPLEWINPATH)/Applewin.exe -d1

EMULATOR = $(APPLEWIN)

all: routines.b.lz4 main.b.lz4 part1.b.lz4 part2.b.lz4 part3.b.lz4 part2C.b.lz4 hgr1.lz4 hgr2.lz4 hgr3.lz4

main.b.lz4: CRAZY_CYCLES_IIc/main.b
	$(LZ4) CRAZY_CYCLES_IIc/main.b main.b.lz4

routines.b.lz4: CRAZY_CYCLES_IIc/routines.b
	$(LZ4) CRAZY_CYCLES_IIc/routines.b routines.b.lz4

part1.b.lz4: CRAZY_CYCLES_IIc/part1.b
	$(LZ4) CRAZY_CYCLES_IIc/part1.b part1.b.lz4

part2.b.lz4: CRAZY_CYCLES/part2.b
	$(LZ4) CRAZY_CYCLES/part2.b part2.b.lz4

part2C.b.lz4: CRAZY_CYCLES_IIc/part2C.b
	$(LZ4) CRAZY_CYCLES_IIc/part2C.b part2C.b.lz4

part3.b.lz4: CRAZY_CYCLES_IIc/part3.b
	$(LZ4) CRAZY_CYCLES_IIc/part3.b part3.b.lz4

CRAZY_CYCLES_IIc/main.b: CRAZY_CYCLES_IIc/main.a
	cd CRAZY_CYCLES_IIc && $(ACME) main.b main.a 
	cd ..

CRAZY_CYCLES_IIc/routines.b: CRAZY_CYCLES_IIc/routines.a
	cd CRAZY_CYCLES_IIc && $(ACME) routines.b routines.a 
	cd ..

CRAZY_CYCLES_IIc/part1.b: CRAZY_CYCLES_IIc/part1.a
	cd CRAZY_CYCLES_IIc && $(ACME) part1.b part1.a 
	cd ..

CRAZY_CYCLES_IIc/part2C.b: CRAZY_CYCLES_IIc/part2.a
	cd CRAZY_CYCLES_IIc && $(ACME) part2C.b part2.a 
	cd ..

CRAZY_CYCLES/part2.b: CRAZY_CYCLES/part2.a
	cd CRAZY_CYCLES && $(ACME) part2.b part2.a 
	cd ..

CRAZY_CYCLES_IIc/part3.b: CRAZY_CYCLES_IIc/part3.a
	cd CRAZY_CYCLES_IIc && $(ACME) part3.b part3.a 
	cd ..

hgr1.lz4: CRAZY_CYCLES_IIc/hgr-part1/HGRS
	$(LZ4) CRAZY_CYCLES_IIc/hgr-part1/HGRS hgr1.lz4 

hgr2.lz4: CRAZY_CYCLES_IIc/hgr-part2/hgr
	$(LZ4) CRAZY_CYCLES_IIc/hgr-part2/hgr hgr1.lz4 

hgr3.lz4: CRAZY_CYCLES_IIc/hgr-end/hgr
	$(LZ4) CRAZY_CYCLES_IIc/hgr-end/hgr hgr1.lz4 


clean:
	rm *.b CRAZY_CYCLES_IIc/*.b CRAZY_CYCLES/*.b
	rm *.lz4
	rm lbl_*.txt
    