
# Empirical Research Project **Replication Checklist**

For each task, tick the box (`✔`) or mark **NA** if not applicable, and record the completion date.

---

## 1&nbsp;·&nbsp;Repository Setup & Collaboration

| Task | ✔ / NA | Date |
|---|---|---|
| Clone or download the GitHub repository; record the commit hash used | | |
| Invite co‑authors or supervisor as collaborators with appropriate permissions | | |
| Set up issue labels and a project board (optional but recommended) | | |

## 2&nbsp;·&nbsp;Understand & Customise Folder Structure

| Task | ✔ / NA | Date |
|---|---|---|
| Read top‑level `README.md`   | | |
| Confirm standard directory structure (`data/raw`, `data/intermediate`, `data/processed`, `scripts`, `output`, `paper`, etc.) | | |
| Add any missing subfolders (e.g. `data/external`, `logs`, `notebooks`) | | |
| Add paths to dropbox/figshare paths in scripts  for large raw data | | |
| Search/replace hard‑coded file paths in all scripts & configs | | |
| Delete or archive template scripts/files you will not use | | |

## 3&nbsp;·&nbsp;Data Preparation & Cleaning

| Task | ✔ / NA | Date |
|---|---|---|
| Create and document ALL data prep steps in `logs/cleaning.log` | | |
| Import each raw source; store unaltered copies in `data/raw/` | | |
| Verify row/column counts match source documentation | | |
| Run missing‑value summary & document patterns | | |
| Check variable types (numeric / string / date); convert if needed | | |
| Generate descriptive stats (mean, SD, min–max) & frequency tables | | |
| Visualise distributions (histograms, boxplots, density plots); flag outliers | | |
| **Before merging**: confirm merge keys are unique (`duplicates report id`) | | |
| **During merge**: inspect merge status codes (`_merge`); investigate unmatched rows; ensure total obs = master + using – unmatched | | |
| **After merge**: cross‑check shared variables for equality; rerun descriptive stats on merged file | | |
| Save cleaned dataset to `data/intermediate/`; log steps in `logs/cleaning.log` | | |

## 4&nbsp;·&nbsp;Data Analysis

| Task | ✔ / NA | Date |
|---|---|---|
| Re‑check descriptive statistics on analysis sample | | |
| Ensure N drops between specifications are logical (added FE, dropped missing covariates, etc.) | | |
| Code includes export of results for tables in `.tex` `output/tables/` | | |
| Code includes export of results for figures in `.png` (or equivalent) `output/figures/` | | |

## 5&nbsp;·&nbsp;Paper Preparation & Reproducible Outputs

| Task | ✔ / NA | Date |
|---|---|---|
| Automate export of tables (`esttab`, `outreg2`, `modelsummary`, etc.) to `paper/tables/` | | |
| Save figures to `paper/figures/` with descriptive filenames | | |
| Update LaTeX paths (`\input{tables/...}` & `\includegraphics{figures/...}`) | | |
| Compile `main.tex`; resolve citation or package errors | | |


## 6&nbsp;·&nbsp;Automated & AI‑Assisted Checks

| Task | ✔ / NA | Date |
|---|---|---|
| Use an LLM to review code for clarity & potential bugs | | |
| Use an LLM to proof‑read or summarise the manuscript | | |
| Generate AI‑based data‑quality report (outliers, duplicates, schema checks) | | |

---

### Notes

* Tick off tasks directly in this file or via GitHub's web UI to keep a transparent record.  
* Add rows or entire sections if your project requires specialised steps (e.g. GIS processing, survey weighting, lab experiments, or confidential‑data protocols).
