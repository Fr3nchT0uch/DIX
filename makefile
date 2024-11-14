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
MAKE = make

EMULATOR = $(APPLEWIN)

all: clean all_parts unidisk

all_parts: decomplz4.b loader.b
	$(MAKE) -C MENU
	$(MAKE) -C Bobs
	$(MAKE) -C SCROLL
	$(MAKE) -C CC_2015
	$(MAKE) -C AQOF_2015
	$(MAKE) -C PLS_2015
	$(MAKE) -C RB_2015
	$(MAKE) -C CCII_2016
	$(MAKE) -C OMT_020819
	$(MAKE) -C MADEF_051019
#	$(MAKE) -C MADEF2
	$(MAKE) -C MAD3
	$(MAKE) -C DIGIDREAM
	$(MAKE) -C OFV
	$(MAKE) -C DD2
	$(MAKE) -C TRIBU

unidisk: all_parts $(DISKNAME800K)

$(DISKNAME): boot.b
# boot T0 S0
	$(DIRECTWRITE) $(DISKNAME) boot.b 0 0 + p
# fload T0 S2
	$(DIRECTWRITE) $(DISKNAME) fload.b 0 2 + p
# main_.b (?) T1 S0 > $6000
	$(DIRECTWRITE) $(DISKNAME) decomp.b 1 0 + D

# 	EMULATOR
	copy lbl_main.txt $(APPLEWINPATH)\A2_USER1.SYM
	$(EMULATOR) $(DISKNAME)
#	$(TRANSAIR) $(DISKNAME)


$(DISKNAME800K): boot_unidisk.b loader.b write

write:
	$(GENPO) $(DISKNAME800K)
# block 0
	$(DIRECTWRITE800K) $(DISKNAME800K) boot_unidisk.b 0
	$(DIRECTWRITE800K) $(DISKNAME800K) loader.b 1 		# 7 blocks
# MENU
	$(DIRECTWRITE800K) $(DISKNAME800K) MENU/main.b 		10	# 9 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MENU/music.lz4		19	# 12 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MENU/player_fym6.b	31	# 7 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MENU/logo.lz4		38	# 4 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MENU/starfield.b	42	# 16 block
	$(DIRECTWRITE800K) $(DISKNAME800K) MENU/intro.mai		58	# 2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MENU/intro.aux		60	# 2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MENU/dixascii.b	62	# 2 blocks
# bobs
	$(DIRECTWRITE800K) $(DISKNAME800K) Bobs/move/move.b 	100	# 16 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) Bobs/main/bobs.b 	116	#  5 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) Bobs/hgr/hgr 		121	# 32 blocks
# SCROLL SCROLL SCROLL
	$(DIRECTWRITE800K) $(DISKNAME800K) SCROLL/Sources/main.b 	153       #  5 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) SCROLL/Sources/routines.b 158	# 31 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) SCROLL/Sources/hgr/hgr	189	# 16 blocks
# CRAZY CYCLES / Note: this part also load files
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES_IIc/main.b      	205    #  4 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES_IIc/routines.b  	209    #  13 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES_IIc/hgr-part1/hgrs	222    #  32 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES_IIc/part1.b		254    #  4 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES_IIc/hgr-part2/hgr	258   #  16 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES/part2.b		274    #  20 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES_IIc/part2C.b		294    #  20 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES_IIc/hgr-end/hgr	314    #  16 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CC_2015/CRAZY_CYCLES_IIc/part3.b		330    #  6 blocks
# A QUESTION OF FRAMES / Note: this part also load files
	$(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/main.b		336    #  3 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/tload.b		339    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/routineA.b		341    #  12 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/routineM.b		353    #  12 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/frameA.b		365    #  80 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/frameM.b		445    #  85 blocks
# $(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/main.b		10    #  3 blocks
# $(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/tload.b		13    #  2 blocks
# $(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/routineA.b		15    #  12 blocks
# $(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/routineM.b		27    #  12 blocks
# $(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/frameA.b		39    #  80 blocks
# $(DIRECTWRITE800K) $(DISKNAME800K) AQOF_2015/frameM.b		119    #  85 blocks
# PLASMAGORIA
	$(DIRECTWRITE800K) $(DISKNAME800K) PLS_2015/main.b  	  530    #  4 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) PLS_2015/routines.b  	  534    #  22 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) PLS_2015/Sources/tune/ZIC  556    #  4 blocks
#RASTER BARS	
	$(DIRECTWRITE800K) $(DISKNAME800K) RB_2015/main.b  	  	560    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) RB_2015/Sources/tune/ZIC		562    #  5 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) RB_2015/tables.b  	  	567    #  9 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) RB_2015/hgr.b		  	576    #  16 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) RB_2015/routines.b	  	592    #  27 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) RB_2015/maskhgr.b	  	619    #  16 blocks
# CRAZY CYCLES II
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/main.b	  		635    #  5 blocks
# -- Part1
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P1_LORES/part1b.mai  	640    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P1_LORES/part1b.aux  	642    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P1_TUNE/ZIC	  	644    #  4 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P1_HGR/HGRS	  	648    #  32 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/part1.b		  	680    #  23 blocks
# -- Part 2
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P2_LORES/part2b.mai  	703    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P2_LORES/part2b.aux  	705    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P2_TUNE/ZIC	  	707    #  4 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P2_HGR/PI.TEST8#064000  	711    #  16 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/part2.b		  	727    #  13 blocks
# -- Part 3
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P3_LORES/part3b.mai  	740    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P3_LORES/part3b.aux  	742    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P3_TUNE/ZIC	  	744    #  3 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P3_HGR/HGRS  		747    #  32 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/part3.b		  	779    #  10 blocks
# -- Part 4
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P4_LORES/part4b.mai  	789    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P4_LORES/part4b.aux  	791    #  2 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P4_TUNE/ZIC	  	793    #  4 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/Sources/P4_HGR/HGRS  		797    #  32 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) CCII_2016/part4.b		  	829    #  7 blocks
# ONE MORE THING
	$(DIRECTWRITE800K) $(DISKNAME800K) OMT_020819/data.b		  	836    #  90 blocks (AUX)
	$(DIRECTWRITE800K) $(DISKNAME800K) OMT_020819/main.b		  	926    #  8 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) OMT_020819/ppt3.b  			934    #  11 blocks
# MAD EFFECT 1
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF_051019/Sources/TITLE/title.bin	945    #  16 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF_051019/lores.b			961    #  6 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF_051019/hires.b			967    #  33 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF_051019/main.b		  	1000   #  7 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF_051019/routine.b.lz4		1007   #  11 blocks
# MAD EFFECT 2
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF2/main.b				1018   #  9 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF2/hires.b				1027   #  28 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF2/TITLE/title.bin.lz4		1055   #  7 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MADEF2/MUSIC/ZICDECOMP.lz4  		1062   #  7 blocks
# UNREAL TRIBUTE
	$(DIRECTWRITE800K) $(DISKNAME800K) TRIBU/pts.b.lz4		1069    #  13 blocks 
	$(DIRECTWRITE800K) $(DISKNAME800K) TRIBU/main.b			1082    #  3 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) TRIBU/hgr.b.lz4		1085    #  9 blocks 
	$(DIRECTWRITE800K) $(DISKNAME800K) TRIBU/sub.b.lz4		1094    #  3 blocks
# MAD EFFECT 3
	$(DIRECTWRITE800K) $(DISKNAME800K) MAD3/ZIC.lz4		1097    #  3 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MAD3/sub.b.lz4		1100    #  15 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MAD3/TITLE.lz4		1115    #  7 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) MAD3/main.b		1122    #  10 blocks
# DIGIDREAM
	$(DIRECTWRITE800K) $(DISKNAME800K) DIGIDREAM/drum.b.lz4		1132    #  3 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) DIGIDREAM/ZICDECOMP.lz4		1135    #  9 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) DIGIDREAM/GFX.BIN.lz4		1144    #  8 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) DIGIDREAM/main.b		1152    #  4 blocks
# OLDSKOOL FORT ET VERT
	$(DIRECTWRITE800K) $(DISKNAME800K) OFV/data.b.lz4		1156    #  10 blocks 
	$(DIRECTWRITE800K) $(DISKNAME800K) OFV/main.b.lz4		1166    #  7 blocks 
# DIGIDREAM2
	$(DIRECTWRITE800K) $(DISKNAME800K) DD2/MUSIC/ZIC.lz4		1173    #  24 blocks 
	$(DIRECTWRITE800K) $(DISKNAME800K) DD2/main.b			1197    #  6 blocks
	$(DIRECTWRITE800K) $(DISKNAME800K) DD2/effect.b.lz4		1203    #  7 blocks 
	$(DIRECTWRITE800K) $(DISKNAME800K) DD2/HGR.lz4			1210    #  7 blocks 
	$(DIRECTWRITE800K) $(DISKNAME800K) DD2/DGR.b			1217    #  3 blocks 



adtpro:
	cp $(DISKNAME800K) "/s/Emulateurs/Apple II/ADTPro-2.0.2/disks/"


# Bobs/move/move.b: $6000 16 blocks
# Bobs/main/bobs.b: $F100 5 blocks
# Bobs/main/hgr/hgr: $2000 32 blocks

decomplz4.b: decomplz4.a
	$(ACME) decomplz4.b decomplz4.a

fload.b: fload.a
	$(ACME) fload.b fload.a

boot.b: boot.a
	$(ACME) boot.b boot.a

boot_unidisk.b: boot_unidisk.a
	$(ACME) boot_unidisk.b boot_unidisk.a

loader.b: loader.a
	$(ACME) loader.b loader.a

Bobs:
	$(MAKE) -C Bobs

SCROLL:
	$(MAKE) -C SCROLL

CRAZYCYCLES:
	$(MAKE) -C CC_2015

AQOF:
	$(MAKE) -C AQOF_2015

PLS:
	$(MAKE) -C PLS_2015

RB:
	$(MAKE) -C RB_2015

CCII:
	$(MAKE) -C CCII_2016

OMT:
	$(MAKE) -C OMT_020819

MADEF:
	$(MAKE) -C MADEF_051019

MADEF2:
	$(MAKE) -C MADEF2

MAD3:
	$(MAKE) -C MAD3

clean:
	rm -f *.b
	rm -f lbl_*.txt
    