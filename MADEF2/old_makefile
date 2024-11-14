# DSK/MEMORY structure     / MEMORY  MAP / RAM  TYPE  Comp.  Decomp.
# boot0:     T00/S00			$0800		 MAIN
# FLOAD:	 T00/S01-T00/S05 	$FC00		RAMCARD
# TITLE PIC: T01/S00-T02/S0F	$2000        MAIN
# MAIN:  	 T03/S00-T04/S0B	$D000		RAMCARD
# MUSIC:	 T05/S00-T05/S0B    $4000        MAIN       *    $6000(A)
# HIRES:	 T06/S00-			$1000		 AUX        *    $2000+(M)

player: boot.b fload.b main.b

boot.b: boot.a
    @echo "boot part"
    %A2SDK%\BIN\acme -f plain -o boot.b boot.a
    %A2SDK%\BIN\dw.py dsk\test.dsk boot.b 0 0 + p

fload.b: fload.a
    @echo "fload part"
    %A2SDK%\BIN\acme -f plain -o fload.b fload.a
    %A2SDK%\BIN\dw.py dsk\test.dsk fload.b 0 1 + p

main.b: main.a
    @echo "main part"
    %A2SDK%\BIN\acme -f plain -o main.b main.a
    %A2SDK%\BIN\dw.py dsk\test.dsk main.b 3 0 + D

clean:
	@echo "cleaning..."
	del boot.b
	del fload.b
	del main.b

    