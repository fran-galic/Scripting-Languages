if [ "$#" -ne 1 ]; then
    echo "potrebno je unjeti putanju do slika"
    echo "naredba se koristi kao: ./zadatak4.sh img_dict_path"
    exit 1
elif [ ! -d $1 ]; then
    echo "naredba se koristi kao: ./zadatak4.sh img_dict_path"
    exit 1
fi

radni_direktorij=$1
if [ ! -d "$radni_direktorij/solution" ]; then mkdir "$radni_direktorij/solution/"; fi
temp="$radni_direktorij/solution/temp.txt"

# pipe:
ls "$radni_direktorij" | grep -E ".*\.jpg" | 
sed -E 's/([0-9]{4})([0-9]{2})([0-9]{2})_([0-9]{2})([0-9]{2}).jpg$/\1-\2-\3-\4-\5.jpg/' | 
sort -t "-" -k 1,5 > "$temp"

# predpostavka: svi su iste godine jer je tkao zadano u zadatku i rekli su da sortirmao po mjesecima
for i in {1..12}; do
    if [ "$i" -ne 11 -a "$i" -ne 12 -a "$i" -ne 10 ]; then
        izdvojeni=$(grep -E ".*-0$i-.*-.*-.*" "$temp";)
    else
        izdvojeni=$(grep -E ".*-$i-.*-.*-.*" "$temp";)
    fi

    n=$(echo "$izdvojeni" | wc -l)
    prvi_element=$(echo "$izdvojeni" | head -n 1)
    echo "$(echo "$prvi_element" | sed -E 's/(.*)-(.*)-(.*)-(.*)-(.*).jpg/\2-\1 :/') "
    echo "----------"
    j=1
    echo "$izdvojeni" | while read slika; do
        echo "$slika" | sed -E "s/(.*)-(.*)-(.*)-(.*)-(.*).jpg/     $j.  \1\2\3_\4\5.jpg/"
        j=$(($j + 1))
    done
    echo "---- UKUPNO: $n slika -----"
    echo

done