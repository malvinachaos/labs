#! /bin/bash

while [ -n "$1" ]
do

    case $1 in
        "--help")
            echo -ne "\
ni[B][B]a builder \n\
--help \t \t print this text\n\
--modules \t \t building modules\n\
--build [name] \t \t build main program\n\
--all \t \t full project building\n\
"
        ;;

        "--modules")
            cd src/
            pabcnetc aset.pas 
            #pabcnetc bset.pas
            #pabcnetc cset.pas
            pabcnetc operations.pas 
            pabcnetc io.pas
            cd ../
        ;;

        "--build")
            cd src/
            pabcnetc main.pas && mv main.exe ../files/$2
            cd ../
        ;;

        "--all")
            cd src/
            pabcnetc aset.pas 
            #pabcnetc bset.pas
            #pabcnetc cset.pas
            pabcnetc operations.pas 
            pabcnetc io.pas
            pabcnetc main.pas && mv main.exe ../files/$2
            cd ../
        ;;

    esac
    shift
done
