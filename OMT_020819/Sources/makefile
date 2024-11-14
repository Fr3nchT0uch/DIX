# DSK structure            / MEMORY  MAP / RAM  TYPE
# boot0:    T00/S00				$0800		 MAIN
# FLOAD:	T00/S01-T00/S05 	$FB00		RAMCARD
# MAIN:  	T01/S00-T01/S0F		$D000		RAMCARD
# PT3(p+m): T02/S00-T03/S05		$8000		 MAIN	
# DATA:		T04/S00-TXX/SXX		$0C00		 AUX
#

player: boot.b fload.b main.b ppt3.b data.b

boot.b: boot.a
	@echo "boot part"
    %A2SDK%\BIN\acme -f plain -o boot.b boot.a
    %A2SDK%\BIN\dw.py dsk\test.dsk boot.b 0 0 + p

fload.b: fload.a
	@echo "fload part"
	%A2SDK%\BIN\acme -f plain -o fload.b fload.a
    %A2SDK%\BIN\dw.py dsk\test.dsk fload.b 0 1 + p

main.b: main.a data.b
    @echo "main part"
    %A2SDK%\BIN\acme -f plain -o main.b main.a
    %A2SDK%\BIN\dw.py dsk\test.dsk main.b 1 0 + D
    
ppt3.b: ppt3.a
    @echo "ppt3 part"
    %A2SDK%\BIN\acme -f plain -o ppt3.b ppt3.a
    %A2SDK%\BIN\dw.py dsk\test.dsk ppt3.b 2 0 + D

data.b: data.a
	@echo "DATA part"
    %A2SDK%\BIN\acme -f plain -o data.b data.a
    %A2SDK%\BIN\dw.py dsk\test.dsk data.b 4 0 + D

clean:
	@echo "cleaning..."
	del boot.b
	del fload.b
	del main.b
	del ppt3.b
	del data.b

    