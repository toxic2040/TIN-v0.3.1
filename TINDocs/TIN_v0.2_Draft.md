# THE INTERPLANETARY NETWORK
### Starlink, but Heliocentric
#### A Deep Space Communications & AI Infrastructure Proposal
**Author:** toxic2040 | **Version:** 0.2 | **Date:** February 2026

*This v0.2 incorporates technical corrections and community feedback for improved accuracy.*

---

## Executive Summary

Every 26 months, the Sun blocks all communication between Earth and Mars for 2 to 8 weeks. For robots, this is an inconvenience. For crews, colonies, and the autonomous systems that will sustain them, it is an unacceptable risk. Current Mars relay infrastructure — NASA's MRO, MAVEN, and Odyssey — delivers a maximum of roughly 0.5–6 Mbps to Earth under ideal conditions [1]. These are aging science orbiters performing relay duties as a secondary function. No purpose-built interplanetary communications network exists.

This proposal presents **The Interplanetary Network (TIN)** — a dual-architecture deep space communications and AI processing infrastructure designed to deliver 24/7, conjunction-proof connectivity across the inner solar system.

**TIN eliminates multi-week blackouts with only a 6-minute latency penalty in the worst case.** Even during conjunction, a relay path adds just ~6 minutes to the ~21-minute worst-case direct signal — an asymmetrically favorable tradeoff.

The network combines two complementary systems:

- **Heliocentric Polar Relay Network:** 3 satellites in high-inclination (~90°) solar orbits at ~1 AU, phased 120° apart, ensuring at least one relay always maintains line-of-sight to both planets — even when the Sun is directly between them.

- **Lagrange Point AI Hubs:** 2–3 satellites stationed at Sun-Earth L4 and L5 Lagrange points (with an optional L3 node for redundancy), providing supplementary relay capability and serving as in-situ AI data processing centers for autonomous routing, compression, and decision support.

Together, these **5–6 satellites** achieve **99.9%+ communications availability** (based on orbital simulations with 120° phasing; see Geometric Coverage Analysis) with bandwidths of **1–10 Gbps per link** (optical laser) and one-way latencies of **3–27 light-minutes**. Estimated total deployment cost: **~$2.5–3 billion** — comparable to a single NASA flagship science mission, but providing permanent infrastructure serving all future lunar and Mars missions.

**The architecture is phased.** A lunar far-side relay pathfinder (Phase 0) can be operational by ~2029, delivering immediate value for lunar surface operations. The full Earth-Mars network (Phase 1) achieves initial operational capability by 2031 and full capability by 2032 — aligning with the projected timeline for human Mars missions in the early-to-mid 2030s.

---

## Strategic Rationale: Why Now

The Interplanetary Network has not been built before — not because it is infeasible, but because the conditions were not right. Four converging factors make 2026 the inflection point:

**1. Launch Cost Revolution.** Prior to reusable rocketry, deploying six interplanetary satellites would have cost $10B+ in launch fees alone. Starship reduces deployment costs by 50–80%, and its 9-meter fairing accommodates cluster deployment of multiple relay satellites per mission.

**2. Technology Maturity.** Three critical technologies reached flight-proven status in the 2020s:

- **Deep space optical laser comms:** NASA's LCRD demonstrated 1.2 Gbps at lunar distances in 2023. The DSOC experiment aboard Psyche achieved 267 Mbps at 19 million miles (Dec 2023) and sustained 6.25 Mbps at 240 million miles — Mars-comparable distances — exceeding all technical goals before concluding in September 2025 [2]. ESA established its first interoperable deep-space optical link with DSOC in July 2025 [3], and has proposed the ASSIGN programme for operational deep-space optical comms.
- **Radiation-hardened AI processors** for autonomous space operations (e.g., Qualcomm's Snapdragon Space, ESA's DAHLIA).
- **Delay/Disruption Tolerant Networking (DTN)** protocols, now operational on the ISS and tested across NASA's network.

**3. The Settlement Timeline.** SpaceX's February 2026 pivot to a lunar-first strategy — targeting a "self-growing city on the Moon" within the decade, with Mars settlement resuming in 5–7 years — creates a natural two-phase deployment cadence for TIN. A lunar pathfinder relay can serve Moon operations immediately. The full interplanetary network matures in parallel with the Mars timeline, ensuring communications infrastructure is in place before human arrival. NASA's Artemis program, ESA's lunar exploration plans, and commercial lunar ventures (Blue Origin, ispace, Intuitive Machines) all require communications infrastructure that does not yet exist at the required scale.

**4. No Existing Solution.** Despite decades of discussion, no dedicated interplanetary relay network exists. NASA's Deep Space Network (DSN) is oversubscribed, and Mars relay duties fall to science orbiters that are aging and will eventually be decommissioned. The window is open for purpose-built infrastructure — potentially as a commercial service supporting NASA, ESA, JAXA, ISRO, and commercial operators.

---

## The Problem: Deep Space Communication Blackouts

Current deep space communications rely on direct radio links between planetary assets and Earth's Deep Space Network (DSN). This architecture carries a fundamental vulnerability: **solar conjunction**.

Approximately every 26 months, Earth and Mars pass on opposite sides of the Sun. The Sun's corona creates a 3–7° angular exclusion zone that scatters, absorbs, and corrupts radio and optical signals. With optical links, the exclusion zone may extend outages to 10–15 weeks [4]. The result is a **complete communications blackout**.

For current robotic missions, conjunction protocols involve pre-uploading commands and placing spacecraft in safe modes. The rovers simply wait. But this is fundamentally incompatible with:

- **Crewed Missions (Lunar and Mars):** Astronauts cannot be left without emergency communications for weeks. Medical emergencies, habitat failures, or unforeseen events require continuous contact with Earth. Even lunar far-side operations face permanent Earth-occlusion without relay infrastructure.
- **Colony Operations:** Continuous data flow is essential for logistics, resource management, scientific data return, and governance.
- **Autonomous Systems:** AI-driven rovers, drones, and industrial systems require continuous uplinks for software updates, model synchronization, and oversight.

Beyond conjunctions, current Mars communications are severely bandwidth-constrained. NASA's MRO achieves a maximum of roughly 6 Mbps to Earth under ideal conditions, with rover relay rates of ~2 Mbps. MAVEN and Odyssey deliver similar or lower rates [1]. As mission density increases through the late 2020s and 2030s, this bottleneck becomes critical. TIN's 1–10 Gbps optical links represent a **1,000x+ improvement** over today's capabilities.

---

## Proposed Solution: The Interplanetary Network

### Phase 0: Lunar Pathfinder Relay (2027–2029)

Before deploying the full interplanetary network, a single relay satellite in a polar or halo lunar orbit serves as a technology demonstrator and immediately useful infrastructure node.

**Function:** Provides continuous communications coverage for lunar far-side operations (including Artemis surface missions, commercial landers, and future base construction), with 1–2 second latency to Earth. Validates optical terminal design, AI routing software, and DTN protocols in an operational environment with rapid iteration cycles (2-day transit vs. 6-month Mars transit).

**Heritage:** CNSA's Queqiao relay (launched 2018, supporting Chang'e-4/6 far-side operations) demonstrates the concept at smaller scale. TIN's lunar pathfinder scales up with optical comms and AI processing capabilities that feed directly into the interplanetary network design.

**Strategic value:** Aligns with SpaceX's lunar city initiative, NASA Artemis, and ESA lunar plans. Generates operational experience and potential early revenue from communications services before the larger capital commitment of the full network.

### Phase 1A: Heliocentric Polar Relay Network

**Configuration:** 3 relay satellites in high-inclination (~90° to the ecliptic) solar orbits at approximately 1 AU radius from the Sun, phased 120° apart in a shared orbital plane.

**Why Polar Orbits?** By orbiting over the Sun's poles rather than in the ecliptic plane, these relays maintain line-of-sight to both Earth and Mars even during conjunctions. The signal routes up and over the exclusion zone rather than trying to pass through it. This approach extends the Ulysses mission concept (launched 1990; achieved 80.2° solar inclination via Jupiter gravity assist [5]) to a communications application.

**Why Three?** One or two relays risk coverage gaps as planetary positions shift over the synodic cycle. Three provides overlapping coverage, handles orbital perturbations, and enables parallel links for increased aggregate bandwidth. Orbital simulations with 120° phasing show individual relay visibility availability of ~0.996, yielding combined network availability of 99.9%+ [6].

### Phase 1B: Lagrange Point AI Hubs

**Configuration:** 2 satellites, one each at Sun-Earth L4 and L5 Lagrange points (60° ahead of and behind Earth in its orbit), with an optional 3rd node at L3 (opposite Earth) for additional redundancy. L4 and L5 are gravitationally stable points requiring minimal station-keeping (~1–10 m/s/year) [7]. Note: L3 is unstable and would require higher station-keeping budgets (~50–100+ m/s/year); inclusion should be justified by redundancy requirements.

**Relay Function:** L4/L5 positions maintain near-perpetual line-of-sight to Earth and workable geometry to Mars for the vast majority of the synodic cycle. Research confirms that at any given time, a planet or its L4/L5 point is visible to any other inner solar system planet regardless of the Sun's position [8]. Combined with the polar network, system availability exceeds 99.9%.

**AI Processing Function:** Equipped with radiation-hardened GPU/TPU compute clusters, these hubs serve as autonomous AI processing nodes capable of:

- **Signal routing and adaptive path selection** across the network, dynamically selecting optimal relay chains based on geometry, link quality, and traffic load
- **Real-time data compression and prioritization** for bandwidth-efficient transmission
- **Anomaly detection and autonomous fault response** for network self-healing
- **Pre-processing of scientific data in transit**, reducing ground processing requirements
- **Autonomous decision support** for Mars-based systems during high-latency or degraded-link windows

---

## Combined Network Performance

| Parameter | Specification |
|---|---|
| Total Satellites | 5–6 (3 polar + 2–3 L-point: 1 at L4, 1 at L5, optional at L3) |
| Communications Availability | 99.9%+ (conjunction-proof; based on orbital sims with 120° phasing [6]) |
| Optical Bandwidth | 1–10 Gbps per link (scalable to 100s Gbps with phased arrays, per NASA DSOC roadmap [2]) |
| Radio Backup Bandwidth | 100–500 Mbps (Ka/X-band, primary RF); 1–100 Mbps (emergency backup) |
| Minimum Latency (one-way) | ~3 light-minutes (closest approach, direct) |
| Maximum Latency (one-way) | ~27 light-minutes (conjunction, via relay) |
| Design Life | 10+ years (with software upgrades) |
| Coverage | Earth, Moon, Mars (expandable to outer planets) |

---

## Technical Specifications

### Satellite Bus Design

Each relay satellite is a modular, upgradeable platform based on proven interplanetary heritage (NASA MRO, ESA SOHO, CNSA Queqiao), scaled up for planetary-class communications and AI processing.

| Subsystem | Specification |
|---|---|
| Dry Mass | 1,500–2,000 kg (including 20–30% margin) |
| Propellant Mass | 200–500 kg (hydrazine/ion fuel, 10-year life) |
| Total Launch Mass | 1,700–2,500 kg per satellite |
| Power (Average) | 7–10 kW (solar arrays, 20–30 m² BSR cells @ 29% eff., ~1,361 W/m² at 1 AU [9]; accounts for ~80% real-world factor for packing, angle losses, and degradation) |
| Power (Peak) | 10–15 kW during high-bandwidth bursts and AI processing |
| Batteries | 60–100 Ah Li-ion for eclipses |
| Dimensions (Stowed) | 2–3 m core bus (fits Starship 9 m fairing) |
| Dimensions (Deployed) | 10–15 m span (arrays + antennas) |
| Propulsion | Ion thrusters (0.1–0.5 N, Isp 3,000 s) |
| Attitude Control | Reaction wheels + star trackers (0.04° pointing) |

*Note: v0.1 listed average power as 2–3 kW, which was inconsistent with the array size and efficiency. At 1,361 W/m² × 29% efficiency × 80% real-world factor, 20–30 m² of arrays produce ~6.3–9.5 kW. The 7–10 kW figure is consistent and supports the higher power demands of optical communications and AI processing during simultaneous operation.*

### Communications Suite

| System | Radio (Ka/X-band) | Optical Laser |
|---|---|---|
| Antenna/Aperture | 4–5 m deployable mesh | 10–50 cm telescope |
| Transmitter Power | 100–500 W (TWTA amps) | 10–50 W input |
| Bandwidth | 100–500 Mbps (primary); 1–100 Mbps (emergency backup) | 1–10 Gbps per link (scalable to 100s Gbps with arrays) |
| Mass | 200–400 kg | 50–100 kg additional |
| Power Draw | 100–500 W | 200–600 W |
| Redundancy | Dual antennas (Earth-facing + Mars-facing) | SDR adaptive freq (2–60 GHz backup) |

*Optical bandwidth scaling context: NASA's DSOC achieved 267 Mbps at close range and 6.25–8.3 Mbps sustained at Mars-class distances with a first-generation system [2]. The 1–10 Gbps TIN specification assumes purpose-built, larger-aperture terminals with higher transmit power. Scaling to 100s Gbps is projected via phased optical arrays per NASA roadmaps [10]; Tbps-class rates will likely require breakthrough technologies not yet demonstrated at interplanetary distances.*

### AI Processing Hub (L-Point Satellites)

Each Lagrange point hub includes a dedicated AI compute module:

| Parameter | Specification |
|---|---|
| Mass | ~200–500 kg |
| Power Draw | ~500 W (nominal); ~1 kW (peak processing) |
| Development Cost | $50–100M per unit |
| Radiation Hardening | SEE-tolerant, TID >100 krad (Si) |
| Capabilities | Autonomous signal routing, adaptive compression, anomaly detection, decision support, scientific data pre-processing |
| Software | OTA-upgradeable; DTN-compliant protocol stack |

### Latency Analysis

All latencies are governed by the speed of light (~499 seconds per AU). Direct paths are used when available; relay paths are invoked during conjunctions.

| Scenario | Distance | Latency (1-way) | Notes |
|---|---|---|---|
| Closest Approach (direct) | 0.37 AU (55M km) | ~3.05 minutes | No relay needed |
| Farthest (unblocked) | 2.52 AU | ~21 minutes | Direct link still viable |
| Conjunction (via relay) | ~3.2 AU total path | ~27 minutes | Earth → polar relay → Mars |
| Lunar relay | ~384,400 km | ~1.3 seconds | Phase 0 pathfinder |

**Key insight:** Even the worst-case relay path (27 min) is only ~6 minutes longer than the worst-case direct path (21 min). The network trades a minor latency increase for the elimination of multi-week blackouts — an asymmetrically favorable tradeoff for any crewed mission.

---

## Geometric Coverage Analysis

The 99.9%+ availability claim is supported by orbital geometry analysis and published research on relay network topologies.

| Configuration | Coverage During Conjunction | Annual Availability | Source / Basis |
|---|---|---|---|
| 3 Polar Relays (120° phased, 90° inclination) | >99% LOS to both Earth and Mars | 99.9%+ | Visibility availability ~0.996 per relay; 3-relay overlap handles perturbations [6] |
| +2 L-Point Hubs (L4/L5) | 100% supplementary Earth LOS | 99.99% | Near-perpetual Earth visibility; ~99–100% with 3–4 total relay nodes [11] |
| Full Network (Polar + L-Point) | Conjunction-proof | 99.9%+ | Geometric analysis across full synodic cycle [6][8][11] |

Without any relay infrastructure, Earth-Mars link availability drops to roughly 96% over the synodic cycle due to conjunctions [12]. TIN closes this gap entirely.

---

## Orbital Mechanics & Deployment

### Delta-V Budget

Placing satellites in high-inclination heliocentric orbits is the primary challenge. A direct 90° plane change at 1 AU would require ~42 km/s [13] — clearly impractical with current propulsion. Instead, the mission design leverages gravity assists.

| Maneuver | Direct (Δv) | With Gravity Assist |
|---|---|---|
| LEO to Escape (C3=0) | ~3.2 km/s | ~3.2 km/s |
| Plane Change to ~90° | ~5–7 km/s (at optimal radius) | ~0 km/s propulsive (Jupiter GA [5]) |
| Orbit Insertion/Trim | ~0.1–0.5 km/s | ~0.1–0.5 km/s |
| **Total per Polar Satellite** | **~8.5–10.5 km/s** | **~3.5–7 km/s** |

**Preferred trajectory for polar relays:** VEEGA (Venus-Earth-Earth Gravity Assist) sequence to reach Jupiter, followed by Jupiter gravity assist for the ~90° plane change. This extends the approach used by two distinct heritage missions:

- **Ulysses (1990):** Launched direct to Jupiter via a single Earth-escape burn, then used Jupiter's gravity to achieve 80.2° solar inclination with ~0 km/s propulsive plane change [5].
- **Galileo (1989):** Used the VEEGA trajectory (Venus flyby → two Earth flybys) to reach Jupiter, acquiring ~18.3 km/s aggregate Δv from gravity assists over ~6 years [14].

TIN's polar relay trajectory combines these: VEEGA to reach Jupiter (reducing launch energy requirements), then Jupiter GA for the polar plane change (eliminating propulsive plane change costs). Total flight time to operational orbit: ~4–6 years. This is the primary schedule driver for the polar relay constellation.

**L-point satellites** require significantly less delta-v. Transfer from LEO to Sun-Earth L4/L5 requires ~3.5–4 km/s via direct transfer [15], comparable to lunar orbit insertion (~4 km/s). With optimized trajectories and lunar gravity assists, this can be reduced to ~3 km/s [16].

### Launch Vehicle Comparison

| Parameter | Starship (Preferred) | Falcon Heavy (Alternative) |
|---|---|---|
| Payload to Escape | 50–100+ t (with orbital refueling) | 16–20 t (expendable) |
| Sats per Launch | 3–4 (cluster deploy) | 1–2 |
| Total Launches Needed | 2–3 | 3–4 |
| Cost per Launch | ~$100–200M (incl. refueling) | ~$150–300M |
| Total Launch Cost | $250–450M | $500–800M |

Starship offers ~50–80% cost savings on deployment and enables cluster deployment of multiple satellites per mission. Its 9-meter fairing diameter accommodates the stowed satellite bus dimensions with ample margin.

---

## Deployment Timeline

Assuming a green light in mid-2026, the lunar pathfinder achieves operations by ~2029, the first polar relay reaches operational orbit by ~2031, and the full network is operational by 2032.

| Phase | Duration | Key Milestones | Cost Allocation |
|---|---|---|---|
| **Phase 0: Lunar Pathfinder** | 2026–2029 | Single relay satellite to lunar polar/halo orbit; validates optical terminal, AI routing, DTN stack; supports Artemis and commercial lunar ops | Included in Concept & Development |
| Concept & Design | 6–12 months (Q3 2026 – Q2 2027) | Requirements lock-in; partner selection (NASA SCaN, ESA, commercial); trajectory simulations via GMAT/STK | 5–10% ($125–300M) |
| Development & Prototyping | 2–3 years (2027–2029) | Build/test prototypes; qualify ion thrusters, rad-hardened AI compute; optical terminal integration; DTN software development | 50–60% ($1.25–1.8B) |
| Manufacturing & Integration | 1–2 years (2028–2030, overlapping with development) | Assemble 6+ satellites (with spares); factory testing; payload integration with launch vehicle | 20–25% ($500–750M) |
| Launch & Deployment | 6–12 months (2030–2031) | 2–3 Starship launches; cluster deploy; gravity assist sequences begin; in-orbit commissioning | 10–15% ($250–450M) |
| Operations Ramp-Up | Ongoing (2031+) | First polar relay operational ~2031; full 24/7 network by ~2032; software upgrades; 10-year prime mission life | 10–15% ($250–450M) |

*Note: Development and Manufacturing phases overlap intentionally — satellite integration begins as subsystem prototyping completes. Polar relay satellites require ~4–6 years of cruise (VEEGA + Jupiter GA) after launch, making early deployment critical.*

---

## Cost Analysis

All costs estimated in FY2026 USD, benchmarked against NASA MRO (~$720M total), ACE, SOHO, CNSA Queqiao, and LCRD, adjusted for SpaceX-style manufacturing efficiencies and Starship launch economics.

### Cost Breakdown by System

| Phase | Polar Network (3–4 Sats) | L-Point Hubs (2–3 Sats) | Combined |
|---|---|---|---|
| Development & Manufacturing | $900M – $1.2B | $600M – $900M | $1.5B – $2.1B |
| Launch & Deployment | $200M – $300M | $150M – $250M | $350M – $550M |
| Operations (5 yr prime) | $150M – $250M | $100M – $200M | $250M – $450M |

### Total Program Cost

| Scenario | Total Cost | Assumptions |
|---|---|---|
| Optimistic | ~$2.1 Billion | Minimal spares, no overruns, Starship mature |
| **Realistic Mid-Range** | **~$2.5 – $3.0 Billion** | **20% contingency, full redundancy** |
| Pessimistic | ~$3.5 – $4.0 Billion | Delays, extended testing, cost overruns |

For context: this is comparable to a single NASA flagship science mission (e.g., Mars 2020/Perseverance at ~$2.7B), yet it provides **permanent infrastructure** serving all future lunar and Mars missions across all agencies and commercial operators.

### Potential Cost Offsets

- **Multi-agency cost sharing:** NASA SCaN, ESA ASSIGN, JAXA, ISRO all have deep space communications requirements. TIN could serve as shared infrastructure.
- **Commercial service revenue:** Per-mission communications service fees for government and commercial users.
- **Technology development co-funding:** AI processing, optical terminal, and DTN development have broad applicability beyond TIN.

---

## Risk Mitigations

| Risk | Severity | Mitigation |
|---|---|---|
| Radiation damage to AI processors at L-points | High | Rad-hardened design (TID >100 krad); modular compute with hot spares; OTA software updates for degraded-mode operation |
| Optical link disruption (pointing errors, solar interference) | Medium | Dual-mode comms (optical primary, Ka-band backup); SDR adaptive frequency selection; autonomous re-acquisition |
| Gravity assist trajectory failure | High | Redundant satellites (spares on ground or in parking orbits); alternative trajectory options (direct injection with extended ion propulsion) |
| Starship unavailability at launch window | Medium | Falcon Heavy as fallback (1–2 sats per launch); phased deployment tolerates partial constellation |
| Funding shortfall or schedule overrun | Medium | Phased deployment (lunar pathfinder first, then incremental polar/L-point deployment); multi-agency partnership reduces single-entity risk |
| DSN competition for ground station time | Low | Dedicated ground optical terminals (Palomar-class); leverage ESA ground stations (as demonstrated in DSOC/ESA interop [3]) |

---

## Scalability & Future Expansion

The Earth-Moon-Mars architecture is the first phase of an expandable solar system communications backbone:

**Near-term (2029–2035):**
- **Lunar far-side relay** operational as Phase 0 pathfinder, supporting Artemis and commercial lunar surface operations.
- **Full Earth-Mars conjunction-proof network** operational by 2032.
- **Bandwidth upgrades** via modular optical array additions to existing satellites.

**Medium-term (2035–2045):**
- **Sun-Mars L4/L5 relay nodes** extending coverage to Jupiter/Saturn mission support, with RTG or advanced solar power beyond ~3 AU.
- **Additional polar relay planes** for outer solar system coverage.

**Long-term (2045+):**
- **Bandwidth scaling** to 100s Gbps / Tbps-class as colony data traffic grows.
- **Network densification** with smaller, mass-produced relay nodes in key orbital slots.
- **Commercial backbone** providing comms services to government agencies (NASA, ESA, JAXA, ISRO, CNSA), commercial Mars/lunar ventures, scientific missions, and deep space probes.

---

## The Bottom Line

$2.5 billion. Six satellites. Two Starship launches. Permanent Earth-Mars communications. No more silent Mars. No more blind lunar far side.

Infrastructure precedes settlement. Roads before cities. TIN before colonies.

*Starlink, but heliocentric.*

---

## References

[1] NASA Mars Relay Network; Wikipedia: Mars Reconnaissance Orbiter. MRO maximum downlink ~6 Mbps to Earth; rover relay ~2 Mbps. MAVEN relay ~2 Mbps.

[2] NASA JPL: "NASA's Deep Space Communications Demo Exceeds Project Expectations," Sept 2025. DSOC achieved 267 Mbps at 19M miles, sustained 6.25 Mbps (peak 8.3 Mbps) at 240M miles, and completed 65 passes over 2 years. Concluded Sept 2, 2025. Total downlink: 13.6 terabits.

[3] ESA: "Europe's first deep-space optical communication link," July 2025. ESA established interoperable optical link with DSOC/Psyche at 265M km using ground stations in Greece.

[4] Ars Technica: "Deep Space Dial-Up," 2019. Notes optical link conjunction outages may extend to 10–15 weeks.

[5] Wikipedia: Ulysses (spacecraft); ESA/JPL mission documentation. Launched 1990, achieved 80.2° solar inclination via Jupiter gravity assist with ~0 km/s propulsive plane change.

[6] NSS: "Continuous Inter-Planetary Communications," 2007. Solar polar orbiting satellite relay visibility availability of 0.996 per relay.

[7] Wikipedia: Orbital Station-Keeping; Purdue: Orbit Maintenance Strategies, 2017. L4/L5 station-keeping ~1–10 m/s/year.

[8] NASA NTRS: "Lagrange-Based Relay Options," 2020. "At any given point in time, a planet or either its L4 or L5 point is visible to any other planet in the solar system, regardless of the position of the sun."

[9] Wikipedia: Solar Constant. WMO value 1,361 W/m² at 1 AU.

[10] NASA NTRS: "Optical Communications for Science," 2024. Projects 10 Gbps from the Moon and 100 Mbps from Mars as near-term achievable; DSOC on Psyche demonstrated 267 Mbps at 1.6 AU.

[11] ScienceDirect: "Assessment of Relay Topologies," 2023. Deep space relays achieve up to continuous visibility with 3–4 relay satellites.

[12] Georgia Tech: "Inner Solar System Infrastructure," 2020. Baseline without relays provides only ~96% coverage across synodic cycle.

[13] Stack Exchange: "Could Modern Launch Vehicle Put Ulysses in Polar Heliocentric?" 2020. Direct polar insertion at 1 AU ~42 km/s equivalent.

[14] NASA NTRS: Galileo Trajectory Design, 1992. VEEGA trajectory acquired ~18.3 km/s aggregate Δv from gravity assists. Total flight time ~6 years.

[15] Wikipedia: Delta-v Budget. LEO to Sun-Earth L1/L2 ~7.4 km/s; L4/L5 via direct transfer ~3.5–4 km/s.

[16] UPCommons: "Study and Optimization of Transfer Orbits," 2025; ScienceDirect: "Alternative Transfer to Earth-Moon L4/L5," 2014. Optimized L4/L5 transfers ~3 km/s with assists.

---

**toxic2040** | February 2026 | v0.2

*This proposal is offered in the public interest. Feedback, technical critique, and collaboration inquiries welcome.*
