#! /bin/bash

# create random numbers:  echo $((1 + RANDOM % 10))
# echo -ne
file="a.txt"
name="three_arrays.pas"
while [ -n "$1" ]
do
    case $1 in
        "-h"|"--help")
            echo -e "building pascal program
Usage build.sh [-h|--help] [-c|--create] [-e|--edit] [-b|--build] [--run] [--show] [--remove]

-h --help \t \t output this text
-c --create \t \t create file with random integers
-e --edit \t \t edit .txt files
-b --build \t \t compile to program
-v --verbose \t \t compilt with additional information
-r --remove \t \t remove all .txt files and program
"
        ;;

       "-c"|"--create-test")
            for i in "a.txt" "b.txt" "c.txt"
            do
                for j in $(seq 1 100)
                do
                    echo -ne "$((1 + RANDOM % 100)) " >> $i
                done
                echo >> $i
            done
            echo "Файлы созданы"
        ;;

        "-e"|"--edit")
            vim -o3 a.txt b.txt c.txt
        ;;

        "-b"|"--build")
            fpc $name -othree_arrays.exe && rm -f *.o
        ;;

        "--run")
            echo -ne "\n\nЗапуск программы...\n\n"
            ./three_arrays.exe a.txt b.txt c.txt out.txt
        ;;

        "--show")
            echo -ne "\n\n-~~====[Содержимое файла out.txt]====~~-\n"
            cat out.txt
        ;;

        "--remove")
            rm -fv *.exe *.txt
        ;;
    esac
shift
done
