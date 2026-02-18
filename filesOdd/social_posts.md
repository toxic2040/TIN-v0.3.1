# TIN v0.3.1 — Social Media Drafts

---

## Reddit Post (r/SpaceXLounge, r/Mars, r/SpacePolicy, r/amateurradio)

**Title:** TIN v0.3.1 — open-source proposal for conjunction-proof Earth-Mars comms (65° baseline, link budget, prior art survey) [feedback wanted]

**Body:**

Hey all — I've been working on an open proposal for a purpose-built interplanetary relay network called **The Interplanetary Network (TIN)**. The core idea: 3 relay satellites in 65° heliocentric orbits + 2–3 AI hubs at Sun-Earth Lagrange points = zero conjunction blackouts for crewed Mars missions.

**What's new in v0.3.1:**

- **65° inclination is the new baseline** (was 90°). Full trade study shows 100% geometric coverage with 3 relays at 2.5–5 km/s delta-V via VEEGA+Jupiter gravity assist. Way more achievable than a pure polar orbit.
- **Link budget section** grounded in NASA DSOC flight data (267 Mbps @ 19 Mm, link closed at 307 Mm — farther than Mars max distance). Optical backbone + Ka-band RF backup.
- **Prior art survey** covering Lagrange relays, MarsSat, ESA hovering relays, LC3, synodic-resonant waypoints, and the recently revived MTO program.
- **DTN networking stack** is all flight-proven (BPv7, HDTN, CGR) — this isn't vaporware protocol design.
- Cleaned up the doc structure (fixed numbering, removed stale 90° references, better section flow).

The whole thing is open-source and I'm actively looking for feedback, especially from folks with:
- Trajectory design experience (GMAT/STK — need to nail down the VEEGA sequence)
- Deep space RF/optical link budget expertise
- DTN implementation experience

**Repo:** https://github.com/toxic2040/TIN-Heliocentric-Relays

Not claiming this is ready for a PDR — it's a living proposal doc. But the physics checks out and the tech is either flying or TRL 5+. Happy to discuss any aspect of it.

---

## X/Twitter Thread

**Post 1 (main):**
TIN v0.3.1 is live 🛰️

The Interplanetary Network — an open proposal for conjunction-proof Earth-Mars comms.

3 relays at 65° heliocentric inclination + AI hubs at Lagrange points = zero blackouts for crewed Mars missions.

New in 0.3.1: link budget, prior art survey, cleaned-up architecture.

🔗 github.com/toxic2040/TIN-Heliocentric-Relays

**Post 2:**
Key finding: you don't need 90° polar orbits. 65° gives 100% geometric coverage with just 3 relays, and delta-V drops to 2.5–5 km/s via Jupiter gravity assist.

Same trick as Ulysses, just less extreme.

**Post 3:**
Link budget is now grounded in real flight data:
- NASA DSOC hit 267 Mbps from 19M miles
- Closed a link from 307M miles — farther than Mars max
- DSOC delivered 13.6 Tb over 2 years

TIN's optical backbone uses the same physics, scaled to relay-class hardware.

**Post 4:**
The networking stack is all flight-proven:
- Bundle Protocol v7 (RFC 9171) — flying on ISS since 2010
- HDTN — 900+ Mbps in lab, R&D 100 Award 2024
- Contact Graph Routing — deterministic, zero discovery overhead

No new protocols needed. Just integration.

**Post 5:**
Looking for collaborators:
→ Trajectory designers (GMAT/STK for VEEGA optimization)
→ RF/optical link budget engineers
→ DTN implementers

Full proposal + sim code is open source. PRs and issues welcome.

#Mars #SpaceX #DeepSpace #InterplanetaryInternet
