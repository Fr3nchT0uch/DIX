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

# DSK structure            / MEMORY  MAP / RAM  TYPE
# boot0:    T00/S00				$0800		 MAIN
# FLOAD:	T00/S01-T00/S05 	$FB00		RAMCARD
# MAIN:  	T01/S00-T01/S0F		$D000		RAMCARD
# PT3(p+m): T02/S00-T03/S05		$8000		 MAIN	
# DATA:		T04/S00-TXX/SXX		$0C00		 AUX
#

all:   ppt3.b data.b main.b 

main.b: Sources/main.a
	cd Sources && $(ACME) ../main.b main.a 

ppt3.b: Sources/ppt3.a
	cd Sources && $(ACME) ../ppt3.b ppt3.a

data.b: Sources/data.a
	cd Sources && $(ACME) ../data.b data.a
	$(LZ4) data.b

clean:
	rm *.b
	rm *.lz4
	rm Sources/lbl_*.txt



    