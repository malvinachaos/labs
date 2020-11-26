#! /bin/bash

# create random numbers:  echo $((1 + RANDOM % 10))
# echo -ne
file="a.txt"
name=creating_array.pas
while [ -n "$1" ]
do
    case $1 in
        "-h"|"--help")
            echo -e "building pascal program
Usage build.sh [-h --help] [-c --create] [-e --edit-tests] [-b --build] [--run] [-s --show] [--remove]

-h --help \t \t output this text
-c --create \t \t create files with random integers
-e --edit-tests \t open all testing files
-b --build \t \t compile to program, named 'program'
--run \t \t \t start program with default parametres
-s --show \t \t shows file 'out.txt'
--remove \t \t remove all .txt files and 'program'
"
        shift
        ;;

       "-c"|"--create-test")
        for i in "a.txt" "b.txt" "c.txt"
        do
            for j in $(seq 1 50)
            do
                echo -ne "$((1 + RANDOM % 100)) " >> $i
            done
            echo >> $i
            shift
        done
        echo -e "Файлы созданы\n\n"
        ;;

        "-e"|"--edit-tests")
            vim -o3 a.txt b.txt c.txt
        shift
        ;;

        "-b"|"--build")
            fpc $name -oprogram && rm -f *.o
        ;;

        "--run")
            echo -e "\nЗапуск программы...\n"
            ./program a.txt b.txt c.txt out.txt
        ;;
        
        "-s"|"--show")
            echo -e "\n==========[Содержимое файла out.txt]==========\n"
            cat out.txt
            echo -e "\n==============================================\n"
        ;;

        "--remove")
            rm -fv program *.txt
        ;;
    esac
shift
done
