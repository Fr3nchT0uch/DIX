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

all: starfield.b player_fym6.b music.lz4 logo.lz4 main.b dixascii.b

music.lz4: music/10years.fym
	$(LZ4) music/10years.fym music.lz4

music2.lz4: apple2-intro-test1.vgm
	$(LZ4) apple2-intro-test1.vgm music2.lz4

logo.lz4: logo1.hgr
	$(LZ4) logo1.hgr logo.lz4

main.b: main.a
	$(ACME) main.b main.a

dixascii.b: dixascii.a
	$(ACME) dixascii.b dixascii.a

starfield.b: starfield.a starfield_data.a
	$(ACME) starfield.b starfield.a

player_fym.b: player_fym.a
	$(ACME) player_fym.b player_fym.a

player_fym6.b: player_fym6.a
	$(ACME) player_fym6.b player_fym6.a

player_vgm.b: player_vgm.a
	$(ACME) player_vgm.b player_vgm.a

clean:
	rm -f *.b *.lz4
	rm -f lbl_*.txt

    