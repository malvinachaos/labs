#! /bin/bash

name="summertime_sadness.exe"
while [ -n "$1" ]
do

    case $1 in
        "--help")
            echo -ne "\
ni[B][B]a builder\n\
\n\
--help \t \t print this text\n\
--build [name] \t \t build main program\n\
--clean \t \t delete all files\n\
"
        ;;

        "--build")
            cd src/
            pabcnetc main.pas && mv main.exe ../$name
            cd ../
        ;;

        "--clean")
            rm -rfv src/*.pcu src/main.exe.mdb *.log *.exe
        ;;

    esac
    shift
done
