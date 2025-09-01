# Lab 1 — Unix Tools, Regular Expressions, and Bash Basics

**Goal.** Solidify core shell skills: variables, expansions, pipelines, regex search, file traversal, and simple automation. I prepared small datasets to demo each script and submitted solutions via Ferko with the required naming and CLI interface.

## Contents
- `zadatak1.sh` — Shell variables and expansions  
  I set and printed variables, used filename and arithmetic expansion, counted words across `*.txt`, and used tilde expansion to print my home directory.

- `zadatak2.sh` — grep + regex + find + loops  
  I wrote case-insensitive regex searches (e.g., finding fruit names), inverse matches, recursive searches for an ID pattern (3 uppercase letters + 6 digits as a token), file listing by modification time, and compact `for` loops using brace/`seq` ranges with a variable end.

- `zadatak3.sh` — Daily web-server logs (February)  
  Given a logs directory, I validated input, iterated relevant files, and produced a per-day action frequency table (sorted descending by count). Focus: robust parsing, sorting, and formatting.

- `zadatak4.sh` — Photo grouping by month  
  From filenames `YYYYMMDD_HHMM.jpg`, I grouped photos by `MM-YYYY`, sorted by time, numbered entries, and printed a per-group total. I validated the input directory.

- `zadatak5.sh` — Recursive line counter  
  From a start directory and a filename pattern (e.g., `*.c`), I traversed subdirectories and printed the total number of lines across matches. I echoed the received arguments for traceability.

- `zadatak6.sh` — Two-way directory “sync” (dry-run)  
  I compared two directories and printed copy directions for newer/missing files on either side (no subdirectories, no actual copying). I used `test -nt` and validated arguments.

## Skills exercised
Pipelines and redirection, robust CLI argument handling, defensive checks, regex crafting, sorting/uniqueness, and reproducible outputs suitable for grading.
