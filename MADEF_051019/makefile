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

# DSK/MEMORY structure     / MEMORY  MAP / RAM  TYPE / DeComp.
# boot0:     T00/S00			$0800		 MAIN
# FLOAD:	 T00/S01-T00/S05 	$FC00		RAMCARD
# TITLE PIC: T01/S00-T02/S0F	$2000        MAIN
# MAIN:  	 T03/S00-T0X/SXX	$D000		RAMCARD
# ROUTINE:   T05/S00-T06/SXX	$4000(c)	 MAIN	   $6000(M) 
# LORES:     T07/S00-TXX/SXX    $1000(c)      AUX      LO:PAGE1/PAGE2(M)
# HIRES:	 T08/S00-TXX/SXX	$2000(c)      AUX	   HI:PAGE1/PAGE2(M)

all: lores.b hires.b main.b routine.b

main.b: Sources/main.a Sources/chp7.a Sources/player_CHIPNSFX.a routine.b
	cd Sources && $(ACME) ../main.b main.a

routine.b: Sources/routine.a
	cd Sources && $(ACME) ../routine.b routine.a
#	Sources/LORES/LZ4.exe routine.b
	$(LZ4) routine.b

lores.b: Sources/lores.a
	cd Sources && $(ACME) ../lores.b lores.a

hires.b: Sources/hires.a
	cd Sources && $(ACME) ../hires.b hires.a

clean:
	rm -f *.b
	rm -f *.lz4
