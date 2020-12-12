#! /bin/bash

name="main.pas"
modules="Matrix_IO.pas Types.pas Matrix_Operations.pas"
while [ -n "$1" ]
do
    case $1 in
        "-h"|"--help")
            echo -e "building pascal program
Usage build.sh [-h|--help] [-c|--create] [-e|--edit] [--modules] [-b|--build] [--run] [--show] [--remove] [--clean]

-h --help \t \t output this text
-c --create \t \t create three text files with random integers
-e --edit \t \t edit .txt files
--modules \t \t compiling modules
-b --build \t \t compile main program
--remove \t \t remove all .txt files and program
--clean \t \t cleaning all .o .ppu files in src
"
        ;;

       "-c"|"--create")
           echo -ne > a.txt
           echo -ne > b.txt
           echo -ne > c.txt
            for file in "a.txt" "b.txt" "c.txt"
            do
                for i in $(seq 1 100)
                do
                    for j in $(seq 1 100)
                    do
                        if [ $((1 + RANDOM % 3)) -eq 3 ]
                        then
                            echo -ne "-$((1 + RANDOM % 100)) " >> $file
                        else echo -ne "$((1 + RANDOM % 100)) " >> $file
                        fi
                    done
                    echo >> $file
                done
                echo >> $i
            done
            echo "Файлы созданы"
        ;;

        "-e"|"--edit")
            vim -o3 a.txt b.txt c.txt
        ;;

        "--modules")
            cd src/
            fpc $modules
            cd ..
        ;;

        "-b"|"--build")
            cd src/
            fpc $name -oprogram.exe && mv program.exe ../
            cd ../
        ;;

        "--run")
            echo -ne "\n\nЗапуск программы...\n\n"
            ./program.exe a.txt b.txt c.txt out.txt
            echo -ne "\n\n...программа завершена\n\n"
        ;;

        "--show")
            echo -ne "\n\n-~~====[Содержимое файла out.txt]====~~-\n\n"
            cat out.txt
        ;;

        "--remove")
            rm -fv *.txt
        ;;

    "--clean")
            rm -fv *.exe src/*.o src/*.ppu
        ;;
    esac
shift
done
