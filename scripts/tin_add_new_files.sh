#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# TIN — Add New Files Script
# Run AFTER tin_cleanup.sh
# ═══════════════════════════════════════════════════════════════
#
# BEFORE RUNNING:
#   1. Download these files and put them
#      in your repo folder (same folder as README.md):
#        - CHANGELOG.md
#        - CONTRIBUTING.md
#        - data_README.md  (this one goes inside data/)
#
#   2. Then run:
#        bash tin_add_new_files.sh
# ═══════════════════════════════════════════════════════════════

set -e

echo ""
echo "╔═══════════════════════════════════════╗"
echo "║   TIN — Adding new files             ║"
echo "╚═══════════════════════════════════════╝"
echo ""

if [ ! -d ".git" ]; then
    echo "❌ Not in a git repo. cd into your TIN folder first."
    exit 1
fi

# Check what we have
FOUND=0

if [ -f "CHANGELOG.md" ]; then
    echo "✅ Found CHANGELOG.md"
    FOUND=$((FOUND + 1))
else
    echo "⚠️  CHANGELOG.md not found in repo root — download it first"
fi

if [ -f "CONTRIBUTING.md" ]; then
    echo "✅ Found CONTRIBUTING.md"
    FOUND=$((FOUND + 1))
else
    echo "⚠️  CONTRIBUTING.md not found in repo root — download it first"
fi

# Handle data/README.md — check both locations
if [ -f "data_README.md" ]; then
    echo "✅ Found data_README.md — moving to data/README.md"
    # If data/ already has a README, back it up
    if [ -f "data/README.md" ]; then
        mv data/README.md data/README_old.md
        echo "   (backed up existing data/README.md → data/README_old.md)"
    fi
    mv data_README.md data/README.md
    FOUND=$((FOUND + 1))
elif [ -f "data/README.md" ]; then
    echo "✅ data/README.md already exists"
    FOUND=$((FOUND + 1))
else
    echo "⚠️  data_README.md not found — download it first"
fi

echo ""

if [ $FOUND -eq 0 ]; then
    echo "❌ No new files found. Download them first."
    echo "   They should be in your Downloads folder — copy them here:"
    echo "     cp ~/Downloads/CHANGELOG.md ~/Downloads/CONTRIBUTING.md ~/Downloads/data_README.md ."
    exit 1
fi

# Stage and commit
echo "💾 Staging and committing..."
git add -A
git commit -m "v0.3: Add CHANGELOG, CONTRIBUTING, and data README

- CHANGELOG.md: version history from v0.1 to v0.3
- CONTRIBUTING.md: guidelines for feedback and collaboration
- data/README.md: dataset index with descriptions"
echo ""

echo "🚀 Pushing to GitHub..."
git push origin main
echo ""

echo "╔═══════════════════════════════════════╗"
echo "║          ✅ FILES ADDED!              ║"
echo "╚═══════════════════════════════════════╝"
echo ""
echo "Your repo now has:"
echo "  ✓ Clean root (no stray CSVs)"
echo "  ✓ data/ folder with all datasets + README"
echo "  ✓ archive/ folder with old drafts"
echo "  ✓ CHANGELOG.md"
echo "  ✓ CONTRIBUTING.md"
echo "  ✓ simulations/ (untouched)"
echo ""
echo "REMAINING MANUAL STEPS:"
echo "  1. Go to https://github.com/toxic2040/TIN-Heliocentric-Relays/releases/new"
echo "     Tag: v0.3 | Title: TIN v0.3 — Simulation & Validation"
echo "  2. Go to repo Settings → About (gear icon) → add Topics:"
echo "     mars, deep-space, interplanetary, relay-satellite, space-communications"
echo "  3. Open 3-5 Issues using the SEED_ISSUES.txt file"
echo ""
