@echo off

cd src\
pabcnetc types.pas
pabcnetc funcs.pas
pabcnetc methods.pas
pabcnetc main.pas

move main.exe ..\
cd ..
rename main.exe methods.exe

echo "Done!"
