@echo off

erase files\*.exe

cd src
pabcnetc io.pas

pabcnetc uchr.pas
pabcnetc main.pas
move main.exe ..\files
rename ..\files\main.exe Hchr.exe

echo Please, rewrite one line in main.pas and
pause

pabcnetc udef.pas
pabcnetc main.pas
move main.exe ..\files
rename ..\files\main.exe Hdef.exe

cd ..\files

echo Test!!!