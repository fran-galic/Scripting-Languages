import sys

def ucitaj_putanju(file_path):
    rezultat = []
    try:
        with open(file_path) as f:
            for linija in f:
                if linija.strip() != "":
                    clanovi = linija.strip().split()
                    clanovi = [float(x) for x in clanovi]
                    rezultat.append(clanovi)
    except:
        print("Nešto ne valja s datotekom:", file_path)
        sys.exit(1)
    return rezultat

def kvantilni_izracun(lista, kvs):
    lista.sort()
    d = len(lista)
    r = []
    for k in kvs:
        idx = int(k * d)
        if idx >= d:
            idx = d - 1
        r.append(lista[idx])
    return r

def tablica(hip):
    kvs = [0.1 * x for x in range(1, 10)]
    print("Hyp#" + "#".join([f"Q{int(k*100)}" for k in kvs]))
    br = 1
    for red in hip:
        kv = kvantilni_izracun(red, kvs)
        lin = [f"{br:03}"] + [f"{x:.1f}" for x in kv]
        print("#".join(lin))
        br += 1

def main():
    if len(sys.argv) != 2:
        print("Upotreba: python skripta.py ulaz.txt")
        return

    put = sys.argv[1]
    sve = ucitaj_putanju(put)
    tablica(sve)

if __name__ == "__main__":
    main()
