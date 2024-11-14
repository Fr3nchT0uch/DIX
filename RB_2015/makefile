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

all:   tables.b hgr.b maskhgr.b routines.b main.b

main.b: Sources/main.a
	cd Sources && $(ACME) ../main.b main.a 

routines.b: Sources/routines.a Sources/tables.a
	cd Sources && $(ACME) ../routines.b routines.a

tables.b: Sources/tables.a 
	cd Sources && $(ACME) ../tables.b tables.a

hgr.b: Sources/hgr/hgr.a 
	cd Sources/hgr && $(ACME) ../../hgr.b hgr.a

maskhgr.b: Sources/maskhgr/maskhgr.a 
	cd Sources/maskhgr && $(ACME) ../../maskhgr.b maskhgr.a

clean:
	rm *.b
	rm *.lz4
	rm lbl_*.txt
    