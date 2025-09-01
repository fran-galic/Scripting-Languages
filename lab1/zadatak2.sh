
# 1. podzadatak:
echo "podzadatak 1:"
echo "$(grep -i -E 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt)"

# 2. podzadatak:
echo
echo "podzadatak 2:"
echo "$(grep -i -v -E 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt)"

# 3. podzadatak:
echo 
echo "podzadatak 3:"
echo "$(grep -r -E '\b[A-Z]{3}[1-9]{6}\b' ~/projekti)"

# 4. podzadatak:
echo
echo "podzadatak 4:"
naredba=$(find . -type f -mtime +7 -mtime -14 -exec ls -l {} \;)
echo "$naredba"
echo "naredba radi samo ovdje nema nista sto je tako modificirano prije tjedan do 7 dana, bar za sad"

# 5. podzadatak:
echo
echo "podzadatak 5:"
for i in {1..15}; do echo $i; done

# 6. podzadatak:
echo
echo "podzadatak 6:"
kraj=20
for i in $(seq 1 $kraj); do echo $i; done