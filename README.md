# mplayer-quick-tools
Tools to use mplayer in everyday life:

 - `rfs <filename>` : Play a file.
 - `rall <pattern>` : Play all file matching `<pattern>`, including subdirectories.
 - `rloop <pattern1> <pattern2> <pattern3>` : Loop the first file matching.
 - `rvid` : Play the next episode of the season, then move it to `./__rvid_seen`.
 - `rascii <filename>` : Play a file in ascii, no X server needed.
 - `findfile` : Find files.

Some use case, admit that I have a directory named `~/mkv` :
 - `rfs ~/mkv/primer_2004.mkv` will play my favourite movie.
 - `cd ~/mkv/music ; rall` will shuffle and play my favourite music.
 - `cd ~/mkv/music ; rall scatman` will shuffle and play the tracks form Scatman John.
 - `cd ~/mkv/music ; rall "hotline*miami*wrong*number" will shuffle and play the tracks from my favourite game.
 - `rloop music` will pick the first listed music and will loop it for ever.
 - `rloop nyan hour version` will find and play tons of nyan cat.
 - `cd ~/mkv/rick_and_morty/s1 ; rvid` will play the first episode of the season.
 - `cd ~/mkv/rick_and_morty/s2 ; rvid` will play the second one.
 - `cd ~/mkv/rick_and_morty/s3 ; rvid` will play the third.

