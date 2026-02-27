Target: LSIC Spring Meeting, 28–30 April 2026 (Access-to-Space or Communications session)
Format: Clean professional template (blue/white lunar theme, one key visual per slide, 24–28 pt font)
Speaker notes included for timing
Slide 1: Title
Tolerant Interlunar Network (TIN) v0.3.5
Hybrid Polar + ELFO Architecture
Continuous South-Pole Coverage & Far-Side Extension for Artemis
J. Councilman (toxic2040)
19 February 2026
GitHub: https://github.com/toxic2040/TIN-v0.3.1
(Visual: TIN logo + small lunar globe with constellation)
Slide 2: The Artemis Communications Gap

South Pole (Artemis Base Camp): line-of-sight blackouts >10 % without dedicated relay
Far Side: 50–70 % daily outage for science & exploration
Existing assets (Lunar Gateway, single relays) insufficient for persistent tolerant connectivity
Requirement: >99 % South Pole + major far-side uplift, tolerant to outages

(Visual: Side-by-side coverage gap map)
(30 sec)
Slide 3: TIN – The Hybrid Solution

6–8 smallsats in 400 km circular 90° polar orbits
Primary DTN/AI routing hub: real Lunar Pathfinder ELFO (ESA/SSTL, frozen elliptical, perilune over South Pole, 2026 CLPS-class)
Store-and-forward DTN + AI-driven route optimization
No new spacecraft development – commercial rideshares only
Lunar proof-of-concept for full solar-system tolerant network

(Visual: Simple constellation diagram with ELFO highlighted)
(45 sec)
Slide 4: Architecture Details

Polar layer: 400 km altitude, 90° inclination, evenly spaced
ELFO: frozen elliptical orbit, perilune optimized for South Pole
Inter-satellite & surface links with DTN bundling
AI routing engine selects optimal paths in real time
Fully interoperable with SCaN and Artemis standards

(Visual: Layered architecture block diagram)
(45 sec)
Slide 5: Simulation Approach

28-day high-fidelity orbital simulation (tin_coverage_map.py v0.3.5)
Elevation mask >5°
Uses actual Lunar Pathfinder ELFO ephemeris
Outputs: coverage percentage, dwell time, outage maps
All raw data and four maps available in TINdata/ folder

(Visual: Simulation parameters table)
(45 sec)
Slide 6: South Pole Results
Hybrid 6 polar + ELFO → 99.9 % coverage
Hybrid 8 polar + ELFO → 100.0 % coverage
Continuous support for Artemis Base Camp achieved
Zero coverage gaps over full 28-day lunar cycle
(Visual: South Pole coverage heatmap – 100 % green)
(60 sec – key money slide)
Slide 7: Far-Side Results
Hybrid 6 polar + ELFO → 63.2 % coverage
Hybrid 8 polar + ELFO → 68.5 % coverage
Major uplift vs. single-relay baselines
Enables routine far-side science & rover operations
(Visual: Far-side coverage comparison – before/after maps)
(60 sec)
Slide 8: Cost, Feasibility & Timeline

Total constellation: low tens of millions USD (rideshare pricing)
Leverages manifested 2026 ELFO mission – zero additional launch cost for hub
8-satellite build & deploy: 18–24 months from go-ahead
Immediate path to flight: compatible with current LSIC/SCaN roadmaps

(Visual: Cost breakdown bar chart + timeline)
(45 sec)
Slide 9: Solar-System Scalability
Same DTN/AI core + polar constellation architecture
Direct plug-and-play to:
• Mars (areosynchronous relays)
• Venus, outer-planet moons, solar-polar missions
Lunar TIN = near-term demonstrator for tolerant interplanetary network
(Visual: Solar-system map with Mars/Venus callouts)
(60 sec – vision close)
Slide 10: Call to Action
Request:

10-minute presentation slot + poster at LSIC Spring Meeting
Inclusion in Communications & Moon-to-Mars working groups
Alignment discussion with NIAC/SCaN teams

Full technical memo, datasets, and maps delivered within 48 hours of acceptance.
Let’s build the tolerant network Artemis needs.
Thank you. Questions?
J. Councilman (toxic2040)
