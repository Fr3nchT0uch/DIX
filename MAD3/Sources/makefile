# DSK structure            		/ MEMORY  MAP / RAM TYPE / COMP
# boot0:    	T00/S00				$0800		 MAIN
# FLOAD:		T00/S01-T00/S05 	$FC00		RAMCARD
# MAIN:  		T01/S00-Txx/Sxx		$D000		RAMCARD
# MUSIC:		T04/S00-T04/S05 	$6000		 MAIN       * (->6000A)
# HIRES:		T05/S00-T06/SXX		$A000		 MAIN		* (->2000M)
# SUBROUTINE:	T07/S00-TXX/SXX		$6000		 MAIN	

player: boot.b fload.b sub.b main.b

boot.b: boot.a
    @echo "boot part"
    %A2SDK%\BIN\acme -f plain -o boot.b boot.a
    %A2SDK%\BIN\dw.py dsk\test.dsk boot.b 0 0 + p

fload.b: fload.a
    @echo "fload part"
    %A2SDK%\BIN\acme -f plain -o fload.b fload.a
    %A2SDK%\BIN\dw.py dsk\test.dsk fload.b 0 1 + p

sub.b: sub.a
    @echo "Subroutines part"
    %A2SDK%\BIN\acme -f plain -o sub.b sub.a
    %A2SDK%\BIN\dw.py dsk\test.dsk sub.b 7 0 + D

main.b: main.a sub.b "DATA\lores.bin.lz4" "DATA\timing.reg.lz4"
    @echo "main part"
    %A2SDK%\BIN\acme -f plain -o main.b main.a
    %A2SDK%\BIN\dw.py dsk\test.dsk main.b 1 0 + D

clean:
	@echo "cleaning..."
	del boot.b
	del fload.b
	del main.b
	del sub.b
	del lbl_sub.txt
    