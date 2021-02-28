#! /bin/bash

while [ -n "$1" ]
do

    case $1 in
        "--help")
            echo -ne "\
ni[B][B]a builder\n\
\n\
--help \t \t print this text\n\
--ustr \t \t build all type modules\n\
--io \t \t build io.pas\n\
--build [name] \t \t build main program\n\
--full \t \t build all modules\n\
--clean \t \t delete all files\n\
"
        ;;

        "--ustr")
            cd src
            pabcnetc udef.pas && pabcnetc uchr.pas
            cd ../
        ;;

        "--build")
            cd src/
            pabcnetc main.pas && mv main.exe ../files/$2
            cd ../
        ;;

        "--full")
            cd src
            pabcnetc udef.pas && pabcnetc uchr.pas && io.pas
            pabcnetc main.pas && mv main.exe ../files/H_def.exe
            vim main.pas
            pabcnetc main.pas && mv main.exe ../files/H_chr.exe
            cd ..
        ;;

        "--clean")
            rm -rfv src/*.pcu src/main.exe.mdb files/*.exe files/*.log
        ;;

    esac
    shift
done
