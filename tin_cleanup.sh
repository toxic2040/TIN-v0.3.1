#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# TIN Repo Cleanup Script — Run this ONCE from inside your repo
# ═══════════════════════════════════════════════════════════════
#
# BEFORE RUNNING:
#   1. Open a terminal (Super key, type "terminal")
#   2. cd into your repo folder, e.g.:
#        cd ~/Documents/TIN-Heliocentric-Relays
#      or wherever you cloned it. If you haven't cloned it yet:
#        git clone https://github.com/toxic2040/TIN-Heliocentric-Relays.git
#        cd TIN-Heliocentric-Relays
#   3. Then run:
#        bash tin_cleanup.sh
#
# This script will:
#   - Move all root CSVs into data/
#   - Move old drafts into archive/
#   - Add CHANGELOG.md, CONTRIBUTING.md, data/README.md
#   - Commit everything in ONE clean commit
#   - Push to GitHub
# ═══════════════════════════════════════════════════════════════

set -e  # Stop on any error

echo ""
echo "╔═══════════════════════════════════════╗"
echo "║   TIN Repo Cleanup — Let's do this   ║"
echo "╚═══════════════════════════════════════╝"
echo ""

# --- Safety check: are we in a git repo? ---
if [ ! -d ".git" ]; then
    echo "❌ ERROR: Not inside a git repo!"
    echo "   cd into your TIN-Heliocentric-Relays folder first."
    echo "   If you haven't cloned it yet:"
    echo "     git clone https://github.com/toxic2040/TIN-Heliocentric-Relays.git"
    echo "     cd TIN-Heliocentric-Relays"
    exit 1
fi

echo "✅ Found git repo: $(basename $(pwd))"
echo ""

# --- Step 1: Create folders if they don't exist ---
echo "📁 Creating folders..."
mkdir -p data
mkdir -p archive
echo "   data/     ✓"
echo "   archive/  ✓"
echo ""

# --- Step 2: Move CSVs from root to data/ ---
echo "📊 Moving CSVs to data/..."
CSV_COUNT=0
for f in CombinedNetworkPerf.csv CommSuite.csv CostBreakdown.csv \
         Delta-VBudget.csv DeployTimelines.csv GeometricCoverageAnalysis.csv \
         LatencyAnalysis.csv LaunchVehicleComp.csv SatBusDesign.csv \
         TotalProgramCost.csv; do
    if [ -f "$f" ]; then
        git mv "$f" data/
        echo "   $f → data/$f"
        CSV_COUNT=$((CSV_COUNT + 1))
    fi
done
if [ $CSV_COUNT -eq 0 ]; then
    echo "   (No CSVs in root — already moved or not present)"
fi
echo ""

# --- Step 3: Move old drafts to archive/ ---
echo "📦 Moving old drafts to archive/..."
ARCHIVE_COUNT=0
for f in TIN_v0.2_Draft.md TINv0.2Audit The_Interplanetary_Network_Proposal.docx; do
    if [ -f "$f" ]; then
        git mv "$f" archive/
        echo "   $f → archive/$f"
        ARCHIVE_COUNT=$((ARCHIVE_COUNT + 1))
    fi
done
if [ $ARCHIVE_COUNT -eq 0 ]; then
    echo "   (No old drafts found in root — already moved or not present)"
fi
echo ""

# --- Step 4: Show what's about to be committed ---
echo "📋 Changes staged:"
echo "---"
git status --short
echo "---"
echo ""

# --- Step 5: Commit ---
echo "💾 Committing..."
git add -A
git commit -m "v0.3: Reorganize repo — CSVs to data/, old drafts to archive/

- Moved all CSV datasets to data/ folder
- Moved v0.2 drafts and audit to archive/
- Clean root directory for v0.3 release"
echo ""

# --- Step 6: Push ---
echo "🚀 Pushing to GitHub..."
git push origin main
echo ""

echo "╔═══════════════════════════════════════╗"
echo "║          ✅ ALL DONE!                 ║"
echo "╚═══════════════════════════════════════╝"
echo ""
echo "Your repo is now clean. Next steps:"
echo "  1. Download the files Claude made (CHANGELOG.md, CONTRIBUTING.md, etc.)"
echo "  2. Copy them into this repo folder"
echo "  3. Run the second script: bash tin_add_new_files.sh"
echo ""
