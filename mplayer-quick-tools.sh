function rfs()
{
    mplayer -really-quiet -screenw 1366 -screenh 768 -fixed-vo -fs $@
}

function rall()
{
    tIFS=$IFS
    IFS=$'\0'

    rfs $(find -iname "*$1*" -print0 | sort -z -R)

    IFS=$tIFS
}

function rvid()
{
    file=$(find -maxdepth 1 -iname "[^.][^_]*" -print0 | head -z -n 1)

    echo "$file"
    rfs $file

    mkdir __rvid_seen 2> /dev/null
    mv ./$file ./__rvid_seen 2> /dev/null
}

function rascii()
{
    mplayer -vo aa -monitorpixelaspect 0.5 -shuffle $@
}

function findfile()
{
    find -type f -exec zsh -c "printf %q \"{}\" ; printf %b \"\\\\n\"" \; 2> /dev/null | sed -e 's:/\..*$::g' | sed -e 's:^.*__/.*::g' | cat
}

function rloop()
{
    a=${1:-.}
    b=${2:-.}
    c=${3:-.}
    eval "mplayerfs -loop 0 $(findfile | grep -i $a | grep -i $b | grep -i $c | head -n 1)"
}
