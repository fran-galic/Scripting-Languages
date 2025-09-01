# Lab 3 — Python 3: Files, Parsing, Aggregation, Networking

**Goal.** Implement small, self-contained Python 3 programs that read/write files, parse structured/unstructured text, compute summaries, and do minimal HTTP fetching. Everything runs on Python 3.12+ and uses only the standard library.

## Scripts
- `zadatak1.py` — Sparse matrix I/O and multiplication  
  I read two sparse matrices from a text file (header: rows/cols; then “row col value” lines; blank line as separator), validated shapes, expanded to dense for display, computed `A*B`, printed the dense result, and saved the product back in sparse form.

- `zadatak2.py` — Quantile-based HD score per hypothesis  
  Given a file where each line is a numeric sequence for one hypothesis, I computed a partial directed Hausdorff proxy by sorting each sequence and taking quantiles at 10% steps (Q10–Q90). I printed a compact table with hypothesis index and the nine quantile values.

- `zadatak3.py` — Student lab scoreboard aggregator  
  From a folder containing `studenti.txt` (JMBAG, Surname, Name) and multiple `Lab_XX_gYY.txt` files (JMBAG + points), I merged all data into one table: `JMBAG Surname, Name L1 L2 L3`. Missing entries render as `-`. I used dictionaries, validated duplicates for the same lab, and warned when needed.

- `zadatak4.py` — Simple web page scan (urllib + re)  
  I fetched a given URL, printed raw content, then extracted:
  - all `href="..."` links,
  - the set of unique hosts and their reference counts,
  - any email addresses,
  - and the number of `<img src="...">` occurrences.  
  I used only `urllib.request` and `re`, decoding bytes to UTF-8 before searching.

## Skills exercised
Standard-library file I/O, argument parsing, simple parsing without third-party libs, input validation and helpful errors, and clean tabular output suitable for grading.
