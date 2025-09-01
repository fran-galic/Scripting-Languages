import sys

def ucitaj(dat):
    # Preskoči prazne redove prije zaglavlja
    while True:
        glava = dat.readline()
        if glava == '':
            return None  # kraj datoteke
        if glava.strip():
            break

    try:
        r, s = map(int, glava.strip().split())
    except:
        raise ValueError("Krivo zaglavlje")

    el = {}

    for linija in dat:
        if not linija.strip():
            break  # prazan redak označava kraj matrice
        dij = linija.strip().split()
        if len(dij) != 3:
            continue
        try:
            a, b, c = int(dij[0]), int(dij[1]), float(dij[2])
            el[(a, b)] = c
        except:
            continue

    return r, s, el

def prikaz(m, naslov):
    print(f"\n--- {naslov} ---")
    r, s, el = m
    for i in range(r):
        red = []
        for j in range(s):
            red.append(f"{el.get((i, j), 0):.2f}")
        print(" ".join(red))

def mnozi(m1, m2):
    r1, s1, e1 = m1
    r2, s2, e2 = m2
    if s1 != r2:
        raise ValueError("Ne pase dimenzija")

    rez = {}
    for (i, k), v1 in e1.items():
        for j in range(s2):
            v2 = e2.get((k, j))
            if v2 is not None:
                rez[(i, j)] = rez.get((i, j), 0) + v1 * v2

    return r1, s2, rez

def spremi(m, dat):
    r, s, el = m
    dat.write(f"{r} {s}\n")
    for (i, j), v in el.items():
        if abs(v) > 1e-9:
            dat.write(f"{i} {j} {v:.2f}\n")

def main():
    if len(sys.argv) != 3:
        print("Koristi: python skripta.py ulaz.txt izlaz.txt")
        return

    ulaz, izlaz = sys.argv[1], sys.argv[2]

    print(f"Starting... Ulaz: {ulaz}, Izlaz: {izlaz}")

    try:
        with open(ulaz) as f:
            print("Učitavam Matricu A...")
            a = ucitaj(f)
            if a is None:
                raise ValueError("Fali prva matrica")

            print("Učitavam Matricu B...")
            b = ucitaj(f)
            if b is None:
                raise ValueError("Fali druga matrica")
    except Exception as e:
        print("Greška kod čitanja:", e)
        return

    prikaz(a, "Matrica A (puni prikaz)")
    prikaz(b, "Matrica B (puni prikaz)")

    print("\nMnožim matrice A i B...")

    try:
        c = mnozi(a, b)
    except Exception as e:
        print("Ne valja množenje:", e)
        return

    prikaz(c, "Rezultat (A * B) (puni prikaz)")

    try:
        with open(izlaz, "w") as f:
            spremi(c, f)
        print(f"\nRezultat spremljen u {izlaz}!")
    except:
        print("Ne mogu spremit rezultat")

if __name__ == "__main__":
    main()
