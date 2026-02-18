#!/bin/bash
# TIN v0.3.6 Repo Cleanup
# This removes files from git tracking only — your local files are NOT deleted
# Run from: ~/Desktop/TINProject/

# --- STEP 1: Remove venv and build artifacts from tracking ---
git rm -r --cached venv_tin
git rm -r --cached filesOdd
git rm -r --cached TINprojectv0.1
git rm -r --cached TINDocs
git rm -r --cached TINFiles

# --- STEP 2: Remove old version files ---
git rm --cached TIN_TechMemo_v0.3.3.aux
git rm --cached TIN_TechMemo_v0.3.3.log
git rm --cached TIN_TechMemo_v0.3.3.out
git rm --cached TIN_TechMemo_v0.3.3.pdf
git rm --cached TIN_TechMemo_v0.3.3.tex
git rm --cached TIN_TechMemo_v0.3.3_backup.tex
git rm --cached TIN_TechMemo_v0.3.5.aux
git rm --cached TIN_TechMemo_v0.3.5.log
git rm --cached TIN_LSIC_LOI_v0.3.5.md
git rm --cached TIN_LSIC_LOI_v0.3.5.pdf
git rm --cached tin_coverage_map.py.v0.3.3.backup

# --- STEP 3: Remove working notes and utility scripts ---
git rm --cached 65Inclnewbaseline.csv
git rm --cached 65deg_TradeStudy_Section.md
git rm --cached DE440_Upgrade_Section.md
git rm --cached DE440heading+code.py
git rm --cached DTNDeepDive.md
git rm --cached DTN_DeepDive_Polished.md
git rm --cached GITHUB_AND_SOCIAL_GUIDE.md
git rm --cached GIT_CHEATSHEET.sh
git rm --cached SEED_ISSUES.txt
git rm --cached run_tin.sh
git rm --cached tin_add_new_files.sh
git rm --cached tin_cleanup.sh
git rm --cached tin_coverage_simulation.png
git rm --cached data_README.md
git rm --cached v0.3.6_checkpoint.md

# --- STEP 4: Remove extensionless whitepaper duplicates (if they exist) ---
git rm --cached TIN_Helio_Whitepaper_v0.3.6 2>/dev/null
git rm --cached TIN_Lunar_Whitepaper_v0.3.6 2>/dev/null
git rm --cached TIN_Mars_Whitepaper_v0.3.6 2>/dev/null

# --- STEP 5: Update .gitignore ---
cat > .gitignore << 'GITIGNORE'
# Python
venv_tin/
__pycache__/
*.pyc

# LaTeX build artifacts
*.aux
*.log
*.out

# Old versions and working files
TINDocs/
TINFiles/
TINprojectv0.1/
TIN-Heliocentric-Relays/
filesOdd/
*.backup
GITIGNORE

# --- STEP 6: Stage and commit ---
git add .gitignore
git add -A
git commit -m "Clean repo: remove venv, old versions, and working files. v0.3.6 release files only."
git push origin main

echo ""
echo "=== CLEANUP COMPLETE ==="
echo "Your local files are untouched."
echo "Only git tracking was changed."
echo ""
