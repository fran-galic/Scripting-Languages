if [ "$#" -ne 2 ]; then
    echo "potrebno je unjeti 2 argumenta"
    echo "program se koristi kao: ./zadatak6.sh prvi_direktorij drugi_direktorij"
    exit 1;
elif [ ! -d "$1" ]; then
    echo "prvi direktorij ne posotji"
    echo "program se koristi kao: ./zadatak6.sh prvi_direktorij drugi_direktorij"
    exit 1;
elif [ ! -d "$2" ]; then
    echo "drugi direktorij ne posotji"
    echo "program se koristi kao: ./zadatak6.sh prvi_direktorij drugi_direktorij"
    exit 1;
fi

# NAPOMENA: svjestan sam da moze biti vise optimalno

dir1="$1"
dir2="$2"

# Dohvaćanje popisa datoteka bez putanja
files1=$(find "$dir1" -maxdepth 1 -type f -exec basename {} \; | sort)
files2=$(find "$dir2" -maxdepth 1 -type f -exec basename {} \; | sort)

# Sinkronizacija iz dir1 u dir2
for file in $files1; do
    if ! echo "$files2" | grep -q "^$file$"; then
        echo "$dir1/$file --> $dir2"
    elif [ "$dir1/$file" -nt "$dir2/$file" ]; then
        echo "$dir1/$file --> $dir2 (novija verzija)"
    fi
done

# Sinkronizacija iz dir2 u dir1
for file in $files2; do
    if ! echo "$files1" | grep -q "^$file$"; then
        echo "$dir2/$file --> $dir1"
    elif [ "$dir2/$file" -nt "$dir1/$file" ]; then
        echo "$dir2/$file --> $dir1 (novija verzija)"
    fi
done
