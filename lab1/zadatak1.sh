proba="Ovo je proba"
echo "$proba"

# lista svih datotetka tekuceg kazala i ispis:
lista_datoteka=$(find . -maxdepth 1 -type f)
echo "lista svih datoteka u tekućem kazalu: $lista_datoteka"
# ili kako se zapravo ocekivalo sa sirenjem imena datoteka:
lista_datoteka=(*)
echo "${lista_datoteka[@]}"

proba3="$proba. $proba. $proba. "
echo "$proba3"

a=4
b=3
c=7
d=$(( ($a + 4) * $b % $c ))
echo $a
echo $b
echo $c 
echo $d

# ukupan broj rjeci u svim txt datotekama tekuceg kazala:
broj_rjeci=0
for file in $(find . -maxdepth 1 -type f -regex ".*\.txt")   # ili -name "*.txt"
do 
    echo $file
    broj_rjeci=$(($broj_rjeci + $(wc -w  < "$file")))
done

echo "Broj rjeci u svim tekstim filovima je: $broj_rjeci"


# sadrzaj maticnog kazala:
echo "$(ls ~)"