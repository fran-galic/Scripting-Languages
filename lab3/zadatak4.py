import sys
import urllib.request
import re
from urllib.parse import urlparse

def ucitaj(url):
    try:
        s = urllib.request.urlopen(url)
        return s.read().decode("utf8")
    except:
        print("Nešto ne valja s URL-om.")
        sys.exit(1)

def linkovi(html):
    return re.findall(r'href=["\']?(.*?)["\'>]', html)

def hostovi(lk):
    r = {}
    for l in lk:
        h = urlparse(l).netloc
        if h == "":
            continue
        if h not in r:
            r[h] = 1
        else:
            r[h] += 1
    return r

def mailovi(txt):
    return re.findall(r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}', txt, re.I)

def slike(h):
    return len(re.findall(r'<img[^>]*src=["\'](.*?)["\']', h))

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Daj mi URL kao argument.")
        sys.exit(1)

    u = sys.argv[1].strip()
    kod = ucitaj(u)

    print("\n--- HTML ---")
    print(kod[:400] + "..." if len(kod) > 400 else kod)

    lnk = linkovi(kod)
    print("\n--- LINKOVI ---")
    for l in lnk:
        print(l)

    print("\n--- HOSTOVI ---")
    hdict = hostovi(lnk)
    for h in hdict:
        print(h, hdict[h])

    print("\n--- EMAILOVI ---")
    for m in set(mailovi(kod)):
        print(m)

    print("\n--- BROJ SLIKA ---")
    print(slike(kod))
