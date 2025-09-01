import sys
import os

def ucitaj_studente(put):
    s = {}
    try:
        with open(put, encoding='utf-8') as f:
            for lin in f:
                d = lin.strip().split()
                if len(d) >= 3:
                    jmbag = d[0].strip()
                    p = d[1].rstrip(',')
                    i = " ".join(d[2:])
                    s[jmbag] = f"{p}, {i}"
    except:
        print("Ne mogu čitat studente iz", put)
        sys.exit(1)
    return s

def bodovi_iz_laboratorija(datoteke, sdict):
    b = {k: {} for k in sdict}
    vj = set()

    for dat in datoteke:
        ime = os.path.basename(dat) 
        if not ime.startswith("Lab_") or not ime.endswith(".txt"):
            continue
        dij = ime.split('_')
        if len(dij) < 3:
            continue
        v = dij[1].lstrip("0") or "0"  

        try:
            with open(dat, encoding='utf-8') as f:
                for l in f:
                    p = l.strip().split()
                    if len(p) != 2:
                        continue
                    j = p[0].strip()
                    val = p[1].strip()

                    if j not in sdict:
                        print(f"UPOZORENJE: Nepoznat student {j} u {ime}")
                        continue

                    if v in b[j]:
                        print("Dupli unos za", j, "vježbu", v)
                    b[j][v] = float(val)
            vj.add(v)
        except Exception as e:
            print("Problem s datotekom:", dat, "-", e)

    return b, sorted(vj, key=int)

def ispis(s, b, v):
    jmbag_width = 11
    ime_width = 25
    bod_width = 6

    zaglavlje = (
        "JMBAG".ljust(jmbag_width) +
        "Ime".ljust(ime_width) +
        "".join([f"L{lab}".rjust(bod_width) for lab in v])
    )
    print(zaglavlje)

    for j in sorted(s):
        red = j.ljust(jmbag_width) + s[j].ljust(ime_width)
        for lab in v:
            val = f"{b[j][lab]:.1f}" if lab in b[j] else "-"
            red += val.rjust(bod_width)
        print(red)

def main():
    if len(sys.argv) != 2:
        print("Koristi: python skripta.py direktorij")
        return

    d = sys.argv[1]
    try:
        fajlovi = [os.path.join(d, f) for f in os.listdir(d)]
    except:
        print("Ne mogu otvorit mapu:", d)
        return

    stud_f = os.path.join(d, "studenti.txt")
    s = ucitaj_studente(stud_f)
    b, v = bodovi_iz_laboratorija(fajlovi, s)
    ispis(s, b, v)

if __name__ == "__main__":
    main()