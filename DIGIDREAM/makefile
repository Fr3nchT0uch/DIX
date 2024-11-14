# 		DSK structure	MEMORY MAP / RAM TYPE / COMP / DEST
# boot0:    	T00/S00		$0800	MAIN
# FLOAD:		T00/S01-T00/S0x 	$FC00	RAMCARD
# MAIN:		T01/S00-Txx/Sxx	$D000	RAMCARD		
# DRUM:		T04/S00-T04/S00	$8000	AUX	*	(->$1000A)		 
# MUSIC:		T05/S00-T06/SXX	$8000	AUX	*	(->$2000A)
# GFX:		T07/S00-T0A/S0F	$2000	MAIN

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
MAKE = make

all: drum.b main.b ZICDECOMP.lz4 GFX.bin.lz4

boot.b: include.a boot.a
	$(ACME) boot.b boot.a

fload.b: include.a fload.a
	$(ACME) fload.b fload.a

drum.b: drum.a
	$(ACME) drum.b drum.a
	$(LZ4) drum.b

main.b: include.a drum.a main.a
	$(ACME) main.b main.a

ZICDECOMP.lz4: MUSIC/ZICDECOMP
	$(LZ4) MUSIC/ZICDECOMP ZICDECOMP.lz4

GFX.bin.lz4: gfx/PI.1 gfx/PI.2 GFX.a
	$(ACME) GFX.bin GFX.a
	$(LZ4) GFX.bin GFX.bin.lz4

clean:
	@echo "cleaning..."
	rm *.b

	