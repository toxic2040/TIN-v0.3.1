# Git Survival Guide for Pop!_OS
# Keep this open in a tab. You'll be fine.

# ═══════════════════════════════════════════════════════
# FIRST TIME SETUP (only do this once, ever)
# ═══════════════════════════════════════════════════════

# Install git (probably already installed on Pop!_OS)
sudo apt install git

# Tell git who you are
git config --global user.name "toxic2040"
git config --global user.email "YOUR_EMAIL@whatever.com"

# Clone your repo (downloads it to your computer)
git clone https://github.com/toxic2040/TIN-Heliocentric-Relays.git

# Go into the folder
cd TIN-Heliocentric-Relays


# ═══════════════════════════════════════════════════════
# DAILY USE — The only 4 commands you actually need
# ═══════════════════════════════════════════════════════

# 1. SEE WHAT CHANGED
git status

# 2. STAGE EVERYTHING (tells git "I want to save these changes")
git add -A

# 3. COMMIT (saves a snapshot with a message)
git commit -m "describe what you changed"

# 4. PUSH (sends it to GitHub)
git push origin main

# That's it. That's 90% of git.


# ═══════════════════════════════════════════════════════
# MOVING FILES (this is what you need for the cleanup)
# ═══════════════════════════════════════════════════════

# Move a file into a folder (git tracks the move)
git mv filename.csv data/

# Move multiple CSVs at once
git mv *.csv data/

# Move a file to archive
git mv OldDraft.md archive/

# After moving, commit + push as usual
git add -A
git commit -m "Moved files around"
git push origin main


# ═══════════════════════════════════════════════════════
# ADDING NEW FILES
# ═══════════════════════════════════════════════════════

# Just copy/save files into the repo folder using your file manager
# Then:
git add -A
git commit -m "Added new files"
git push origin main


# ═══════════════════════════════════════════════════════
# OH NO SOMETHING WENT WRONG
# ═══════════════════════════════════════════════════════

# Undo everything since last commit (nuclear option)
git checkout -- .

# I committed but haven't pushed — undo the commit but keep files
git reset --soft HEAD~1

# Git says "your branch is behind" — pull first
git pull origin main

# Git says "merge conflict" — don't panic
# Open the file it mentions, look for <<<< ==== >>>> markers
# Delete the markers, keep the version you want, then:
git add -A
git commit -m "Fixed merge conflict"
git push origin main

# Git asks for username/password and it doesn't work
# GitHub stopped allowing passwords. You need a token:
# Go to: https://github.com/settings/tokens
# Generate a "classic" token with "repo" permission
# Use that token AS your password when git asks

# OR set up SSH (better long-term):
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh


# ═══════════════════════════════════════════════════════
# CREATING A RELEASE (do this on the website, not terminal)
# ═══════════════════════════════════════════════════════
# But you CAN create the tag from terminal:

git tag -a v0.3 -m "TIN v0.3 — Simulation & Validation"
git push origin v0.3

# Then go to GitHub → Releases → "Draft new release" → pick the v0.3 tag


# ═══════════════════════════════════════════════════════
# NICE TO KNOW (but not required)
# ═══════════════════════════════════════════════════════

# See commit history
git log --oneline

# See what's different before committing
git diff

# Create a new branch (for experiments)
git checkout -b experiment-branch

# Switch back to main
git checkout main
