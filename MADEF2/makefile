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

# DSK/MEMORY structure     / MEMORY  MAP / RAM  TYPE  Comp.  Decomp.
# TITLE PIC: T01/S00-T02/S0F	$2000        MAIN
# MAIN:  	 T03/S00-T04/S0B	$D000	  RAMCARD
# MUSIC:	 T05/S00-T05/S0B    $4000        MAIN       *    $6000(A)
# HIRES:	 T06/S00-		$1000	   AUX        *    $2000+(M)


all: hires.b main.b

main.b: hires.b main.a
	$(ACME) main.b main.a

hires.b: hires.a
	$(ACME) hires.b hires.a

clean:
	rm -f *.b
	rm -f *.lz4



