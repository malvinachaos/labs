#! /bin/bash

name="main.pas"
modules="types.pas methods.pas funcs.pas"
while [ -n "$1" ]
do
    case $1 in
        "-h"|"--help")
            echo -e "building pascal program
Usage build.sh [--help] [--modules] [--build] [--run] [--clean]

--help \t \t output this text
--modules \t \t compiling modules
--build \t \t compile main program
--clean \t \t cleaning program and all .o .ppu files in src
"
        ;;

        "--modules")
            cd src/
            fpc $modules
            cd ..
        ;;

        "--build")
            cd src/
            fpc $name -oprogram.exe && mv program.exe ../
            cd ../
        ;;

        "--run")
            echo -ne "\n\nЗапуск программы...\n\n"
            ./program.exe
            echo -ne "\n\n...программа завершена\n\n"
        ;;

        "--clean")
            rm -fv *.exe src/*.o src/*.ppu
        ;;
    esac
shift
done
