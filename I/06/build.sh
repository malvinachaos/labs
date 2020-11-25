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
-r --remove \t \t remove all .txt files and 'program'
"
        shift
        ;;

       "-c"|"--create-test")
            if [ -n "$3" ] 
            then
                file=$3
            fi
            for i in $(seq 1 50)
            do
                echo -ne "$(($((1+ RANDOM % $2))*$((-1**$((1 + RANDOM % 4)))))) " >> $file
            done
        shift
        ;;

        "-b"|"--build")
            fpc $name -oprogram && rm -f *.o
        shift
        ;;

        "-v"|"--verbose")
            fpc -ved $name -oprogram && rm -f *.o
        shift
        ;;

        "-r"|"--remove")
            rm -fv program *.txt
        shift
        ;;
    esac
shift
done
