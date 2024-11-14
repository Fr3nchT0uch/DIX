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

all:   main.b part1.b part2.b part3.b part4.b 

main.b: Sources/main.a
	cd Sources && $(ACME) ../main.b main.a 

part1.b: Sources/part1.a
	cd Sources && $(ACME) ../part1.b part1.a

part2.b: Sources/part2.a 
	cd Sources && $(ACME) ../part2.b part2.a

part3.b: Sources/part3.a 
	cd Sources && $(ACME) ../part3.b part3.a

part4.b: Sources/part4.a 
	cd Sources && $(ACME) ../part4.b part4.a

clean:
	rm -f *.b
	rm -f *.lz4
	rm -f lbl_*.txt
    