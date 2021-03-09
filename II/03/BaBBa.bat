@echo off

erase approximate_calculation_methods.exe

cd src\
pabcnetc types.pas
pabcnetc funcs.pas
pabcnetc methods.pas
pabcnetc main.pas

move main.exe ..\
cd ..
rename main.exe approximate_calculation_methods.exe

echo "Done!"
