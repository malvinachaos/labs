#! /bin/bash

while [ -ne $1 ]
do

    case $1 in
        "--help")
            echo -ne "\
ni[B][B]a builder \n\
--help \t \t print this text\n\
--modules \t \t building modules\n\
--build \t \t build main program\n\
"
        ;;

        "--modules")
            cd src/
            pabcnetc aset.pas bset.pas cset.pas operations.pas
            cd ../
        ;;

        "--build")
            cd src/
            pabcnetc main.pas && mv main.exe ../files
            cd ../
        ;;

    esac
    shift
done
