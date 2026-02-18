═══════════════════════════════════════
X (TWITTER) BIO — pick one or mix and match
═══════════════════════════════════════

Option A (concise):
Building TIN — The Interplanetary Network. Conjunction-proof Earth-Mars comms.
Open-source proposal: github.com/toxic2040/TIN-Heliocentric-Relays
Futurist. Tinkerer. The cat did it.

Option B (more personality):
Designing a 5-satellite network so humans on Mars never lose contact with Earth.
No aerospace degree. Just a sim that works and an open GitHub repo.
Bitcoin hobbyist. Futurist. I blame the cat.

Option C (minimal):
TIN — The Interplanetary Network | Starlink, but heliocentric
Open proposal: github.com/toxic2040/TIN-Heliocentric-Relays


═══════════════════════════════════════
REDDIT — WHERE TO POST (in priority order)
═══════════════════════════════════════

1. r/space (25M+ members)
   - Huge audience, loves visuals
   - Lead with the viz screenshot
   - Flair: probably "Spaceflight" or "Discussion"

2. r/spaceflight (~150K members)
   - More technical than r/space, very receptive to proposals
   - Your current post text works here almost as-is

3. r/Mars (~80K members)
   - Directly relevant audience
   - Frame it around "what Mars crews actually need"

4. r/aerospace (~100K members)
   - Most technical audience — these people will actually check your math
   - Tone down the "idea guy" angle slightly, emphasize the sim and data

5. r/SpaceXLounge (~600K members)
   - This is the relaxed SpaceX community (vs the heavily moderated r/SpaceX)
   - SpaceX-adjacent content is welcome here
   - Your original post would work great here

6. r/Futurology (~20M members)
   - Huge audience, loves big-picture concepts
   - Lead with the human angle: "Imagine being on Mars and losing contact with Earth for 2 weeks"


═══════════════════════════════════════
REDDIT POST — REVISED (use for r/space, r/spaceflight, r/SpaceXLounge)
═══════════════════════════════════════

Title:
I built a simulation proving 5 satellites can eliminate the Mars solar conjunction blackout forever — full proposal and interactive 3D viz (open-source)

Body:
Every ~26 months the Sun blocks all communication between Earth and Mars for up to two weeks. It's called solar conjunction. Rovers survive it with pre-loaded commands. A permanent human base on Mars cannot operate that way.

I spent the last few months designing TIN — The Interplanetary Network. No aerospace background, just stubbornness and a geometry simulation.

**The concept:**
- 3 small relays in heliocentric polar orbits (~1 AU, 120° phased) — they see *around* the Sun
- 2–3 AI routing hubs at Sun-Earth Lagrange points
- Optical laser comms targeting 1–10 Gbps with radio fallback
- Worst-case added latency: ~6 minutes instead of weeks of silence

**What the simulation shows:**
I ran a real ephemeris model (Astropy DE430 kernel, 780-day synodic cycle, 5.5° plasma exclusion threshold):
- Direct Earth-Mars link only: **94.36% coverage**
- With TIN relays: **100.00% coverage** (zero blackouts detected)

**The hard problems (honestly stated):**
- 90° polar orbit insertion requires ~42 km/s delta-V — not feasible with chemical propulsion alone. Relaxed inclinations (60-75°) with additional relays are being explored.
- Deep-space optical terminals at 1-2 AU need flight qualification beyond current demos (LCRD, Psyche).
- Cost model (~$2.5-3B) is spreadsheet-level, not mission-level.

**Try it yourself:**
- Interactive 3D visualization: https://toxic2040.github.io/TIN-Heliocentric-Relays/interplanetary_network_viz.html
- Full proposal + simulation code + all data (MIT licensed): https://github.com/toxic2040/TIN-Heliocentric-Relays

I'm not selling anything. This is an open proposal designed to be improved. Looking for feedback from anyone with orbital mechanics, deep-space comms, or mission costing experience. Issues are open on GitHub.


═══════════════════════════════════════
REDDIT POST — SHORT VERSION (use for r/Mars, r/Futurology)
═══════════════════════════════════════

Title:
Every 26 months, Mars loses contact with Earth for up to 2 weeks. I designed and simulated a 5-satellite fix.

Body:
Solar conjunction is when the Sun sits directly between Earth and Mars, blocking all communication. Rovers handle it with pre-loaded commands. Humans on Mars won't have that luxury.

TIN (The Interplanetary Network) is my open-source proposal for fixing this with just 5-6 satellites in polar heliocentric orbits and Lagrange points. My simulation shows it eliminates the blackout entirely — 100% geometric coverage across the full synodic cycle.

Interactive 3D visualization where you can watch the conjunction geometry: https://toxic2040.github.io/TIN-Heliocentric-Relays/interplanetary_network_viz.html

Full proposal and all data on GitHub: https://github.com/toxic2040/TIN-Heliocentric-Relays

No aerospace background — just someone who thinks this problem needs solving before we send crews. All feedback welcome, especially from people who actually know orbital mechanics.
