#! /bin/bash

name="approximate_calculation_methods.exe"

while [ -n "$1" ]
do

    case $1 in
        "--help")
            echo -ne "\
[B]o[B][B]i builder\n\
\n\
--help \t \t print this text\n\
--build \t build main program\n\
--full \t \t build full project\n\
--clean \t delete all files\n\
"
        ;;

        "--build")
            cd src/
            pabcnetc main.pas && mv main.exe ../$name
            cd ../
        ;;

        "--full")
            cd src/
            pabcnetc types.pas &&\
            pabcnetc io.pas &&\
            pabcnetc funcs.pas &&\
            pabcnetc methods.pas &&\
            pabcnetc main.pas && mv main.exe ../$name
            cd ../
        ;;

        "--clean")
            rm -rfv src/*.pcu src/main.exe.mdb $name The_Great_Gig_in_the_Sky.log src/*.log
        ;;

    esac
    shift
done
