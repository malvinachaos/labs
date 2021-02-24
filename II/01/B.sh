#! /bin/bash

while [ -n "$1" ]
do

    case $1 in
        "--help")
            echo -ne "\
ni[B][B]a builder \n\
Usage: ./B --help -a -b -c --modules --operations --build [name] --all [name] --clean\n\
--help \t \t print this text\n\
-a \n\
-b \n\
-c \n\
-operations \t \t building operations.pas\n\
-io \t \t building io.pas\n\
--modules \t \t building modules\n\
--build [name] \t \t build main program\n\
--all \t \t full project building\n\
--clean \t \t delete all files\n\
"
        ;;

        "-a")
            cd src/
            pabcnetc aset.pas 
            cd ../
        ;;

        "-b")
            cd src/
            pabcnetc bset.pas
            cd ../
        ;;

        "-c")
            cd src/
            pabcnetc cset.pas
            cd ../
        ;;

        "-operations")
            cd src/
            pabcnetc operations.pas
            cd ../
        ;;

        "-io")
            cd src/
            pabcnetc io.pas
            cd ../
        ;;

        "--modules")
            cd src/
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
            pabcnetc bset.pas
            pabcnetc cset.pas

            pabcnetc operations.pas
            pabcnetc io.pas

            pabcnetc main.pas && mv main.exe ../files/out_of_set.exe
            vim -o3 src/main.pas src/operations.pas src/io.pas
            pabcnetc main.pas && mv main.exe ../files/out_of_boolean.exe
            vim -o3 src/main.pas src/operations.pas src/io.pas
            pabcnetc main.pas && mv main.exe ../files/out_of_char.exe
        ;;

        "--clean")
            rm -rfv src/*.pcu src/main.exe.mdb files/*.exe files/out.txt files/out_of_earth.log
        ;;

    esac
    shift
done
