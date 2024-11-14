# MAIN:  		T01/S00-T01/Sxx		$D000	RAMCARD		
# MUSIC:		T02/S00-T04/SXX		$1000	MAIN      *   -> $1000 (AUX)
# HGR		T05/S00-T06/S31		$2000	MAIN
# DGR		T07/S00-T07/S31 		$800	M/A
# EFFECT		T08/S00-TXX/SXX 		$6000	MAIN

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

all: HGR.lz4 DGR.b ZIC.lz4 effect.b.lz4 main.b

effect.b.lz4: effect.a
	$(ACME) effect.b effect.a
	$(LZ4) effect.b

main.b: main.a effect.a
	$(ACME) main.b main.a

ZIC.lz4: MUSIC/ZIC
	$(LZ4) MUSIC/ZIC ZIC.lz4

HGR.lz4: HGR/PI.STEP21
	$(LZ4) HGR/PI.STEP21 HGR.lz4

DGR.b: DGR/1.aux DGR/1.main
	$(LZ4) DGR/1.aux DGR/1.aux.lz4
	$(ACME) DGR.b DGR.a
	

clean:
	rm lbl_*
	rm *.b

	