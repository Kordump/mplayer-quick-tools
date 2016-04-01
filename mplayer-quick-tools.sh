function rfs()
{
    mplayer -really-quiet -screenw 1366 -screenh 768 -fixed-vo -fs $@
}

function rall()
{
    eval mplayerfs $(find -iname "*$1*" -exec zsh -c "printf %q '{}' ; printf %b '\\n'" \; | sort -R)
}

function rvid()
{
    cat =(lsq) | head -n 1 | xargs mplayer -fs
    mkdir __rvid_seen 2> /dev/null
    cat =(lsq) | head -n 1 | xargs mv -t ./__rvid_seen
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