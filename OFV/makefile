#
DISKNAME = A.dsk
DISKNAME800K = A.po

A2SDK=C:/retrodev

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

all: data.b.lz4 main.b.lz4

data.b.lz4: data.a MUSIC.bin HIRES.bin
	$(ACME) data.b data.a
	$(LZ4) data.b

main.b.lz4: main.a
	$(ACME) main.b main.a
	$(LZ4) main.b

clean:
	rm *.b
	rm lbl_*.txt
    