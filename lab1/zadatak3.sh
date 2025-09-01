# provjera parametara
if [ "$#" -ne 1 ]; then
    echo "Potrebno je unjeti putanju do datoteke s logovima"
    echo "Primjer korištenja: ./zadatak3.sh file_path"
    exit 1
elif [ ! -d "$1" ]; then
    echo "Primjer korištenja: ./zadatak3.sh file_path"
    exit 1
fi

radni_direktorij="$1"
izabrani_mjesec="02"
for file in $(find "$radni_direktorij" -type f | grep -E ".*\.[0-9]{4}-$izabrani_mjesec-[0-9]{2}.txt"); 
do
    datum=$(echo $file | sed -E 's/.*\.([0-9]{4}-[0-9]{2}-[0-9]{2}).*/\1/')
    echo
    echo "datum: $datum"
    echo "-----------------------------------------------------------"

    # obradivanje datoteke:
    sed -E 's/.* "(.*)" .*/\1/' "$file" | sort | uniq -d -c | sort -n -r
done