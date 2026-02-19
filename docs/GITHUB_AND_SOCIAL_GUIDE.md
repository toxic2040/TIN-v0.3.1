# TIN v0.3 — GitHub Cleanup & Social Media Guide

## Part 1: File Reorganization (Step by Step)

### Moving CSVs to data/

Since you already have a `data/` folder, here's how to do it in GitHub's web UI:

**Step A — Upload CSVs to data/**
1. Go to https://github.com/toxic2040/TIN-Heliocentric-Relays
2. Click into the `data/` folder
3. Click "Add file" → "Upload files"
4. Drag in ALL your CSVs from your local machine:
   - CombinedNetworkPerf.csv
   - CommSuite.csv
   - CostBreakdown.csv
   - Delta-VBudget.csv
   - DeployTimelines.csv
   - GeometricCoverageAnalysis.csv
   - LatencyAnalysis.csv
   - LaunchVehicleComp.csv
   - SatBusDesign.csv
   - TotalProgramCost.csv
5. Also upload the `data_README.md` file (from what I made you) — but **rename it to README.md** before uploading
6. Commit message: "Move datasets to data/ folder"

**Step B — Delete CSVs from root**
1. Go back to the repo root
2. Click on each CSV file, one at a time
3. Click the trash can icon (top right of the file view)
4. Commit each deletion
   (Yes, this is tedious. That's GitHub web UI for you.)

**Tip:** If this feels painful, download GitHub Desktop from https://desktop.github.com
— it lets you drag files between folders normally and push one single commit.

### Adding the new files
Upload these to the repo ROOT (not inside any folder):
- CHANGELOG.md
- CONTRIBUTING.md

### Archive old drafts (optional but recommended)
1. Create a folder called `archive/` (Add file → Create new file → type `archive/placeholder.txt`)
2. Move `TIN_v0.2_Draft.md` and `TINv0.2Audit` into it (same upload/delete process)
3. Or just leave them — less important than the other cleanup

### Create a GitHub Release
1. Go to https://github.com/toxic2040/TIN-Heliocentric-Relays/releases
2. Click "Create a new release"
3. Tag version: `v0.3`
4. Release title: `TIN v0.3 — Simulation & Validation`
5. Description (paste this):
   ```
   Third iteration of The Interplanetary Network proposal.

   What's new in v0.3:
   - Full simulation suite: coverage geometry, link budgets, delta-V, cost modeling
   - 10 supporting datasets in data/
   - Deployment timeline and launch vehicle trade study
   - Satellite bus and comms suite specifications
   - Interactive visualization deployed via GitHub Pages

   See CHANGELOG.md for full version history.
   ```
6. Click "Publish release"

### Add repo topics
1. On the main repo page, click the gear icon next to "About"
2. In the "Topics" field, add:
   mars, deep-space, interplanetary, relay-satellite, space-communications,
   conjunction, optical-communications, spacex, nasa, aerospace
3. Save

---

## Part 2: Social Media Post Improvements

### The Problem with Most Space-Tech GitHub Posts
People scroll fast. A bare GitHub link gets ignored. You need:
1. A visual (screenshot, diagram, or GIF)
2. A hook that states the PROBLEM, not the solution
3. A clear ask (feedback, RT, star the repo)

### For X (Twitter) — Suggested Repost

Take a screenshot of your interactive visualization showing the relay geometry,
or use a diagram. Then post something like:

---

When Starship lands humans on Mars, they'll lose ALL contact with Earth
for 2-8 weeks every 26 months.

The Sun literally blocks the signal.

I designed a 5-satellite fix: polar heliocentric relays that see around the Sun.

Cost: ~$2.5B. Adds only 6 min latency vs. weeks of silence.

Full open proposal + simulations + data:
[GitHub link]

Feedback from aerospace / orbital mechanics people especially welcome.

🧵 Thread below on how it works ↓

---

Then do a short thread (3-4 tweets):
- Tweet 2: "The core idea: 3 sats in polar orbits around the Sun (perpendicular
  to the ecliptic). They always have line-of-sight past the Sun to both Earth and Mars.
  2-3 more at Lagrange points act as AI hubs for autonomous ops during high-latency windows."
- Tweet 3: "Phase 0 starts with a lunar relay by ~2029 to prove the tech.
  Full network operational by ~2032. I've modeled coverage geometry, delta-V budgets,
  cost breakdowns, and link performance. All data is open on GitHub."
- Tweet 4: "This is NOT affiliated with SpaceX or NASA. Just an independent proposal.
  Looking for: orbital mechanics review, cost sanity checks, and anyone who wants to
  collaborate. Star the repo or open an issue. [link]"

### For Reddit — Better Subreddit Targeting

r/SpaceX has strict moderation — they may remove posts that aren't directly about SpaceX.
Try these instead (or in addition):

- r/spaceflight — General space community, good for proposals
- r/aerospace — More technical audience
- r/space — Huge audience (25M+), good for the "wow factor" pitch
- r/mars — Directly relevant
- r/astrodynamics — Small but perfect for technical feedback on orbits
- r/EngineeringStudents — Surprisingly engaged with space projects

### Reddit Post Template

Title: I designed a 5-satellite network to eliminate the 2-8 week Mars communications
blackout during solar conjunction. Full proposal + simulations on GitHub — looking for feedback.

Body:
Every 26 months, the Sun sits directly between Earth and Mars, cutting all communication
for 2-8 weeks. When humans are on Mars, that's unacceptable.

TIN (The Interplanetary Network) proposes 5-6 satellites:
- 3 in polar heliocentric orbits (perpendicular to the ecliptic — they "see around" the Sun)
- 2-3 at Sun-Earth Lagrange points as AI-driven autonomous operations hubs

Key specs:
- 99.9%+ availability (conjunction-proof)
- 1-10 Gbps optical links
- ~$2.5-3B total program cost
- Phase 0 lunar relay by ~2029, full network by ~2032

The repo includes the full proposal, 10 supporting datasets (coverage geometry, delta-V
budgets, cost model, link analysis), an interactive 3D orbital visualization, and a
technical audit.

GitHub: [link]
Interactive viz: [GitHub Pages link]

This is an independent, unfunded proposal under MIT license. I'm actively looking for:
- Orbital mechanics / astrodynamics review
- Cost model sanity checks
- Feedback on optical vs RF link assumptions
- General "what am I missing" critique

Happy to answer questions.
