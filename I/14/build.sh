#! /bin/bash

name="main.pas"
modules="types.pas methods.pas funcs.pas"
while [ -n "$1" ]
do
    case $1 in
        "-h"|"--help")
            echo -e "building pascal program
Usage build.sh [--help] [--modules] [--build] [--run] [--clean] [--draw]

--help \t \t output this text
--modules \t \t compiling modules
--build \t \t compile main program
--clean \t \t cleaning program and all .o .ppu files in src
--draw \t \t compile and start drawing function
"
        ;;

        "--modules")
            cd src/
            pabcnetc types.pas
            pabcnetc methods.pas
            pabcnetc funcs.pas
            cd ..
        ;;

        "--build")
            cd src/
            pabcnetc $name && mv main.exe ../
            cd ../
        ;;

        "--run")
            echo -ne "\n\nЗапуск программы...\n\n"
            LC_ALL=ru_RU.UTF-8 ./main.exe
            echo -ne "\n\n...программа завершена\n\n"
        ;;

        "--clean")
            rm -fv *.exe src/*.pcu src/*.mdb
        ;;

        "--draw")
            cd src/
            pabcnetc drawfunc.pas && mv drawfunc.exe ../ && ../drawfunc.exe
            cd ../
        ;;
    esac
shift
done
