function rfs()
{
    mplayer -quiet -screenw 1366 -screenh 768 -fs $@ |& grep "^Playing" 2> /dev/null
}

function rall()
{
    function match()
    {
        grep --text -zi "$(echo -n $@ | sed 's/ /.*/g')"
    }

    tIFS=$IFS
    IFS=$'\0'

    rfs $(find -type f -print0 | match $@ | sort -z -R)

    IFS=$tIFS
}

function rvid()
{
    file=$(find -maxdepth 1 -iname "[^.][^_]*" -print0 | head -z -n 1)
    rfs $file

    mkdir __rvid_seen 2> /dev/null
    mv ./$file ./__rvid_seen 2> /dev/null
}

function rascii()
{
    mplayer -vo aa -monitorpixelaspect 0.5 -shuffle $@
}

function rloop()
{
    function match()
    {
        grep --text -zi "$(echo -n $@ | sed 's/ /.*/g')"
    }

    tIFS=$IFS
    IFS=$'\0'

    file=$(find -type f -print0 | match $@ | head -z -n 1)
    rfs $file

    IFS=$tIFS
}
