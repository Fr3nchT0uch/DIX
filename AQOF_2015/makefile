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

#clean mandatory due to cross use of some labels
all: clean tload.b frameM.b frameA.b.lz4 main.b routineA.b routineM.b 

main.b: Sources/main.a 
	cd Sources && $(ACME) ../main.b main.a 

routineA.b: Sources/routineA.a 
	cd Sources && $(ACME) ../routineA.b routineA.a

routineM.b: Sources/routineM.a
	cd Sources && $(ACME) ../routineM.b routineM.a 

tload.b: Sources/tload.a
	cd Sources && $(ACME) ../tload.b tload.a 

frameA.b.lz4: frameA.b
	$(LZ4) frameA.b

frameM.b: Sources/frameM/frameM.a
	cd Sources/frameM && $(ACME) ../../frameM.b frameM.a 

frameA.b: Sources/frameA/frameA.a
	cd Sources/frameA && $(ACME) ../../frameA.b frameA.a 

clean:
	rm -f *.b
	rm -f *.lz4
	rm -f lbl_*.txt
    