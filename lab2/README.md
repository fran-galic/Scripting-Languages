# Lab 2 — Shell Automation and Text/Log Processing (Advanced)

**Goal.** Build on Lab 1 with larger, multi-step shell scripts that combine `grep/sed/awk/find`, date/time and filename parsing, and careful argument/edge-case handling. I continued to submit via Ferko with required filenames and invocation styles.

## Contents
- Pattern search at scale — recursive searches with anchored token boundaries and mixed include/exclude filters
- Time-window file queries — list files modified in a given relative window (e.g., “7–14 days ago”) with detailed attributes
- Batch reporting — aggregate per-day/per-action counts from logs and sort by frequency
- Filename-encoded metadata — parse timestamps from photo filenames, group, order, and summarize
- Tree-wide metrics — walk a directory tree and compute text metrics (e.g., total lines by glob)
- Dry-run synchronization — simulate a symmetric sync plan between two flat folders with newer/missing detection

## Skills exercised
Composing multi-tool pipelines, stable sorting and formatting, quoting/escaping, error messages and usage hints, and ensuring the scripts behave well on different machines.
