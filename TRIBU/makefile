

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


# DSK structure            		/ MEMORY  MAP / RAM  TYPE
# boot0:    	T00/S00				$0800		 MAIN
# FLOAD:		T00/S01-T00/S05 	$FC00		RAMCARD
# MAIN:  		T01/S00-T01/S0F		$D000		RAMCARD
# PLAYERTS+PT3: T02/S00-T05/SXX		$8000		 MAIN
# HGRs:			T06/S00-T09/S0F		$2000		 MAIN
# SUBROUTINE:	T0A/S00-T0A/SXX		$6000		 MAIN	

all: pts.b.lz4 sub.b.lz4 hgr.b.lz4 main.b

pts.b.lz4: Sources/pts.a
	cd Sources && $(ACME) ../pts.b pts.a
	$(LZ4) pts.b

sub.b.lz4: Sources/sub.a
	cd Sources && $(ACME) ../sub.b sub.a
	$(LZ4) sub.b

main.b: Sources/main.a pts.b.lz4 sub.b.lz4 Sources/lores.bin hgr.b.lz4
	cd Sources && $(ACME) ../main.b main.a

hgr.b.lz4: Sources/HGR/hgr.a
	cd Sources/HGR && $(ACME) ../../hgr.b hgr.a
	$(LZ4) hgr.b

clean:
	rm -f Sources/lbl_*
	rm -f *.b
	rm -f *.lz4

	