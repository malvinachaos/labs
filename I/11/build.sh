#! /bin/bash

# create random numbers:  echo $((1 + RANDOM % 10))
# echo -ne
file="a.txt"
name=$(ls *.pas)
while [ -n "$1" ]
do
    case $1 in
        "-h"|"--help")
            echo -e "building pascal program
Usage build.sh [-h] [-n] [-c N [name]] [-b] [-v] [-r]

-h --help \t \t output this text
-c --create N [name] \t create file with random integers(N is range, like 10, 100, 1000, etc.)
-b --build \t \t compile to program, named 'program'
-v --verbose \t \t compilt with additional information
--run \t \t \t start program with default parametres
-s --show \t \t shows file 'out.txt'
--remove \t \t remove all .txt files and 'program'
"
        shift
        ;;

       "-c"|"--create-test")
        for i in $(seq 1 3)
        do
            if [ -n "$3" ] 
            then
                file=$3
            fi
            for i in $(seq 1 50)
            do
                echo -ne "$((1 + RANDOM % 10)) " >> $file
            done
            echo >> $file
            shift
        done
        echo -e "Файлы созданы\n\n"
        ;;

        "-b"|"--build")
            fpc $name -oprogram && rm -f *.o
        ;;

        "-v"|"--verbose")
            fpc -ved $name -oprogram && rm -f *.o
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
