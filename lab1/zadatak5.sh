if [ "$#" -ne 2 ]; then
    echo "pogresan broj elementata"
    echo "naredba se koristi kao: ime_programa ime_direktorija regex_trazene_datoteke"
    exit 1;
elif [ ! -d "$!"]; then 
    echo "naredba se koristi kao: ime_programa ime_direktorija regex_trazene_datoteke"
    exit 1;
fi

echo "Skripta je pozvana s elementima:"
echo "direktorij: $1"
echo "regex: $2"
echo

echo "svaki $2 file sa brojem redaka u njemu i ukupnim brojem redaka"
find "$1" -name "$2" -exec wc -l {} +