#! /bin/bash

while [ -n "$1" ]
do

    case $1 in
        "--help")
            echo -ne "\
ni[B][B]a builder \n\
Usage: ./B --help -a -b -c --modules --build [name] --all [name] --full --clean\n\
--help \t \t print this text\n\
-a \n\
-b \n\
-c \n\
--modules \t \t building modules\n\
--build [name] \t \t build main program\n\
--all [name] \t \t build operations and main \n\
--full \t \t build full project
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
            cd src
            pabcnetc operations.pas && pabcnetc main.pas &&\
            mv main.exe ../files/$2
        ;;

        "--full")
            cd src/
            pabcnetc aset.pas
            pabcnetc bset.pas
            pabcnetc cset.pas
            pabcnetc io.pas

            pabcnetc operations.pas && pabcnetc main.pas \
                && mv main.exe ../files/out_of_set.exe
            vim -o3 src/main.pas src/operations.pas src/io.pas

            pabcnetc operations.pas && pabcnetc main.pas \
                && mv main.exe ../files/out_of_set.exe
            vim -o3 src/main.pas src/operations.pas src/io.pas

            pabcnetc operations.pas && pabcnetc main.pas \
                && mv main.exe ../files/out_of_set.exe
        ;;

        "--clean")
            rm -rfv src/*.pcu src/main.exe.mdb files/*.exe files/Out_Of_Earth.log
        ;;

    esac
    shift
done
