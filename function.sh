!#/usr/bin/env bash
recall() {
    echo "First call : $1"
    echo "First call : $2"
}

recall 1 2

recall 100 1000000

add() {
    x= $1
    y= $2
    z= $((x + y))
    echo $z

}

add 102 205
output=$(add 102 205)
echo  output


add $output $output
