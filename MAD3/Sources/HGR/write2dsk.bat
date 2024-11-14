::: concat
copy /b 1.bin+2.bin decomp.bin
::: compress
%A2SDK%\BIN\LZ4.exe -2 decomp.bin comp.bin
::: write to dsk
%A2SDK%\BIN\insertBIN.py ..\DSK\test.dsk 5 0 2000 comp.bin >log.txt