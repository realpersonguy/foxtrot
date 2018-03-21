findpattern_nocase () {

    find "$1" -type f -exec grep -in "$2" "{}" /dev/null \;

}

