#### 6.2 Delay/Disruption Tolerant Networking (DTN) — The Backbone of TIN

TIN operates in the most challenging communications environment in the Solar System: intermittent optical links with minutes-to-hours of one-way latency, pointing jitter, radiation upsets, and highly asymmetric bandwidth. Traditional TCP/IP collapses here — it requires round-trip acknowledgment for every packet, and a single Earth–Mars round trip can take 6–44 minutes. DTN was literally invented for this use case.

##### Core Protocol Stack (CCSDS / IETF Standards)

| Protocol | Standard | Role in TIN |
|----------|----------|-------------|
| **Bundle Protocol v7 (BPv7)** | RFC 9171 (2022) | Store-carry-forward message bundles with custody transfer. Fragments automatically, supports priority classes (emergency > science > ops > housekeeping). |
| **Licklider Transmission Protocol (LTP)** | RFC 5326 | Reliable convergence layer optimized for long-delay, high-BER optical and RF links. Handles asymmetric channels natively. |
| **Contact Graph Routing (CGR)** | RFC 9172 (2022) | Deterministic route computation using predicted contact windows from known orbital elements. Zero discovery overhead — every future link opportunity is pre-computed. |
| **Bundle Security Protocol (BPSec)** | RFC 9173 (2022) | End-to-end encryption and integrity verification. Mandatory for TIN — bundles traverse multiple hops and custodians. |

##### Why Not Just Use TCP/IP?

TCP requires a continuous end-to-end connection and round-trip acknowledgment. At Mars distances (3–22 light-minutes one way), a single TCP handshake takes 6–44 minutes. Any interruption — relay handoff, pointing loss, plasma scintillation — kills the session and forces restart. DTN's store-and-forward model eliminates this entirely: each node takes custody of the data and guarantees delivery to the next hop, even if that hop isn't available for hours.

##### Flight Heritage (Proven 2010–2026)

**This is not experimental technology. DTN is flying today.**

- **ION (JPL Interplanetary Overlay Network)**: 15+ years of continuous operation on ISS (since 2010). Also flew on EPOXI, Deep Impact, and MESSENGER. Handles 1–10 Mbps with >99.99% delivery reliability. ION is the reference implementation of BPv7.
- **HDTN (NASA Glenn High-rate DTN)**: Won the 2024 R&D 100 Award. Demonstrated 900+ Mbps throughput over optical testbeds in 2025 using FPGA acceleration. This is the baseline architecture for scaling DTN to multi-Gbps deep-space optical — exactly what TIN needs. ISS/Orion flight validation planned for 2025–2026.
- **PACE (2024) and Artemis DTN demos**: Proved DTN data relay through lunar-distance architecture.
- **Commercial & International**: DTN is advancing in commercial cislunar/lunar relay services (NASA LunaNet frameworks) and planned for deep-space extensions of Starlink-like architectures — notably SpaceX's [Marslink proposal to NASA (Nov 2024)](https://www.pcmag.com/news/spacex-pitches-nasa-on-marslink-a-version-of-starlink-for-the-red-planet), which envisions a Starlink-derived relay constellation in Mars orbit. China's Queqiao-2 lunar far-side relay explicitly uses store-and-forward techniques aligned with DTN principles. Broader industry momentum toward a Solar System-scale internet architecture using DTN and megaconstellations is covered in [The Space Review (Feb 2026)](https://www.thespacereview.com/article/5154/1). Starlink's expanding optical inter-satellite link capability — already operational in the LEO constellation — provides a direct technology pathway for longer-range deep-space optical terminals.

##### TIN-Specific Implementation

**Polar Relays (3 satellites, 65° inclination baseline)**

Each relay runs a lightweight ION or HDTN instance on a rad-hard single-board computer (candidate: NASA HPSC — High-Performance Spaceflight Computing processor, or equivalent). The operational concept:

1. Receive optical burst from Mars-side asset (orbiter or surface station)
2. Store bundle in local custody (solid-state storage, radiation-hardened)
3. Compute next available contact window via CGR (pre-loaded orbital elements)
4. Forward bundle to L-point hub or directly to Earth when geometry permits (>5.5° solar exclusion angle)
5. Hold custody until downstream node confirms receipt
6. Delete bundle after confirmed delivery

During periods when only one relay has Mars visibility, bundles queue locally and forward when the geometry opens. The 120° phasing of the three relays ensures at least one always has favorable geometry.

**L-Point AI Hubs (2–3 nodes at Sun-Earth L1/L4/L5)**

These are the "smart" nodes in the network — persistent data custodians with onboard intelligence. Hardware: full HDTN stack + lightweight ML inference engine (TensorFlow Lite or ONNX runtime on rad-hard CPU). Capabilities:

- **Predictive CGR extension**: ML model forecasts traffic patterns and pre-positions data routing decisions. Standard CGR is deterministic (based on orbital mechanics); the AI layer adds traffic-awareness — predicting when large science dumps will arrive and pre-allocating relay bandwidth.
- **Autonomous science prioritization**: On-board classification of incoming data bundles. During high-traffic windows (e.g., multiple Mars missions transmitting simultaneously), the hub can prioritize emergency comms and high-value science over routine telemetry without waiting for ground commands.
- **On-board compression**: Lossless and lossy compression of Mars science data reduces volume by an estimated 40–60% before Earth-bound transmission. This effectively multiplies the usable bandwidth of the optical links.
- **Anomaly detection and auto-retransmit**: If bundle integrity checks fail or a relay goes silent, the hub autonomously reroutes traffic to the remaining N-1 relays with zero ground intervention.
- **Dynamic rerouting**: If one polar relay fails, the hub recalculates all contact graphs and redistributes traffic across the surviving relays. Coverage degrades gracefully (2 relays at 65° still provide >99.9% geometric coverage).

**End-to-End Data Flow**

```
Mars surface/orbiter
    → optical burst to nearest polar relay
        → relay stores bundle (takes custody)
            → opportunistic forward to L-hub when contact window opens
                → L-hub AI routes to Earth ground station via best available path
                    → ground station confirms receipt
                        → bundle deletion cascade (hub → relay → Mars source)
```

Every hop is custody-managed. Data is never deleted until the next node confirms receipt. If any link breaks, the upstream node simply holds the bundle and retries on the next contact window.

##### Performance (Modeled Against TIN Simulation Geometry)

| Metric | Value | Notes |
|--------|-------|-------|
| Sustained throughput | 1–10 Gbps | Optical burst mode (see `data/CommSuite.csv`) |
| Bundle delivery reliability | 99.99%+ | Over full 780-day synodic cycle |
| Worst-case latency | ~6 minutes | Relay hop penalty vs. direct link |
| Conjunction blackout | 0 days | vs. 14–17 days without TIN |
| Graceful degradation | N-1 relay failure | >99.9% coverage maintained |

##### What's New vs. What's Proven

| Component | TRL Today | New for TIN? |
|-----------|-----------|-------------|
| BPv7 / ION | TRL 9 (flying on ISS) | No — direct reuse |
| HDTN at Gbps rates | TRL 5-6 (lab demo) | Scaling to flight — moderate risk |
| CGR | TRL 9 (flying) | No — direct reuse |
| On-board ML inference | TRL 4-5 | New integration — low-moderate risk |
| Optical terminal + DTN | TRL 4-5 | Integration needed — moderate risk |

##### Phase 0 Lunar Pathfinder (2029)

The lunar relay will flight-qualify the exact same DTN stack — BPv7, HDTN, CGR, and the AI routing engine — at lunar distances (~1.3 light-seconds) before committing to the full heliocentric deployment. Zero new protocol development required for the deep-space network. The only scaling factors are link distance (affecting signal margin) and contact duration (affecting bundle queue depth).

##### Key References

- RFC 9171: Bundle Protocol Version 7 (2022)
- RFC 9172: Contact Graph Routing (2022)
- RFC 9173: Bundle Protocol Security (BPSec) (2022)
- RFC 5326: Licklider Transmission Protocol (2008)
- Burleigh, S. et al. "Interplanetary Overlay Network" — JPL, continuous development since 2007
- NASA Glenn: "HDTN: High-rate Delay Tolerant Networking" — R&D 100 Award, 2024
- NASA PACE mission DTN relay demonstrations, 2024
- SpaceX Marslink proposal to NASA — [PCMag, Nov 7 2024](https://www.pcmag.com/news/spacex-pitches-nasa-on-marslink-a-version-of-starlink-for-the-red-planet)
- Solar System Internet architecture via megaconstellations + DTN — [The Space Review, Feb 2026](https://www.thespacereview.com/article/5154/1)
