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

# DSK structure            		/ MEMORY  MAP / RAM TYPE / COMP
# MAIN:  		T01/S00-Txx/Sxx	$E000		RAMCARD
# MUSIC:		T04/S00-T04/S05 	$6000		 MAIN       * (->6000A)
# HIRES:		T05/S00-T06/SXX	$A000		 MAIN		* (->2000M)
# SUBROUTINE:	T07/S00-TXX/SXX	$6000		 MAIN	

all: ZIC.lz4 TITLE.lz4 sub.b main.b

main.b: Sources/DATA/lores.bin.lz4 Sources/DATA/timing.reg.lz4 Sources/main.a
	cd Sources && $(ACME) ../main.b main.a

sub.b: Sources/sub.a
	cd Sources && $(ACME) ../sub.b sub.a

ZIC.lz4: Sources/MUSIC/ZICDECOMP
	$(LZ4) Sources/MUSIC/ZICDECOMP ZIC.lz4

TITLE.lz4: Sources/HGR/2.bin
	cd Sources/HGR && cat 1.bin 2.bin > 2hgr.bin
	$(LZ4) Sources/HGR/2hgr.bin TITLE.lz4

Sources/DATA/lores.bin.lz4: Sources/DATA/lores.bin
	$(LZ4) Sources/DATA/lores.bin Sources/DATA/lores.bin.lz4

Sources/DATA/timing.reg.lz4: Sources/DATA/timing.reg
	$(LZ4) Sources/DATA/timing.reg Sources/DATA/timing.reg.lz4

lores.b: Sources/lores.a
	cd Sources && $(ACME) ../lores.b lores.a

hires.b: Sources/hires.a
	cd Sources && $(ACME) ../hires.b hires.a

clean:
	rm -f *.b
	rm -f *.lz4
