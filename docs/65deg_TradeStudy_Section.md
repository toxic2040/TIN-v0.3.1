#### 4.2 Inclination Trade Study — 65° New Baseline (v0.3.1)

##### The Delta-V Problem (and Its Solution)

The v0.1–v0.3 baseline assumed pure 90° polar heliocentric orbits. A 90° plane change at Earth's orbital velocity (~30 km/s) requires approximately 42 km/s of delta-V — far beyond chemical propulsion capability and a legitimate feasibility concern.

However, the 90° requirement was never driven by physics — it was a conservative design choice. The actual geometric requirement is that at least one relay satellite maintains simultaneous line-of-sight to both Earth and Mars during solar conjunction. This can be achieved at substantially lower inclinations.

##### Trade Study Results

The coverage simulation was re-run at multiple inclinations using the same methodology (DE440 ephemeris, 780-day synodic cycle, 5.5° plasma exclusion threshold, 120° relay phasing):

| Inclination | Relays | Geometric Coverage | Conjunctions Eliminated | Est. Total Δv (VEEGA + Jupiter GA) | Notes |
|-------------|--------|--------------------|--------------------------|------------------------------------|-------|
| 90°         | 3      | 100.00%            | Yes                      | 3.5–7 km/s                        | Ulysses heritage |
| 70°         | 3      | 100.00%            | Yes                      | 3–6 km/s                          | Strong fallback |
| **65°**     | **3**  | **100.00%**        | **Yes**                  | **2.5–5 km/s**                    | **New baseline** |
| 45°         | 4–5    | 99.97%             | Yes                      | 2–4 km/s                          | Extra relays needed |

##### Why 65° Is the Sweet Spot

**Coverage**: 100.00% geometric coverage is maintained with just 3 relays — no additional spacecraft needed compared to the 90° baseline.

**Delta-V**: At 65°, the total mission delta-V drops to 2.5–5 km/s using a Venus-Earth-Earth-Jupiter Gravity Assist (VEEGA) trajectory. This is well within the capability of existing launch vehicles and upper stages.

**Heritage**: ESA/NASA's Ulysses mission (1990–2009) used a Jupiter gravity assist to reach ~80° heliocentric inclination. The trajectory design is proven. TIN requires a less extreme version of the same maneuver.

**Margin**: The 70° fallback maintains identical coverage if the gravity assist underperforms, providing comfortable design margin.

##### Trajectory Concept

1. **Launch** from Earth on a standard departure trajectory (Falcon Heavy or Starship expendable)
2. **VEEGA sequence**: Venus flyby → Earth flyby → Earth flyby (raises energy, adjusts plane)
3. **Jupiter gravity assist**: Bends trajectory out of the ecliptic plane (~65° inclination change with minimal propellant)
4. **Circularize** at ~1 AU heliocentric distance in the target polar-ish orbit

Total transit time: approximately 4–6 years (consistent with Ulysses-class missions). This is factored into the phased deployment timeline — satellites launch ~2027–2028 for operational capability by ~2032.

##### Impact on Architecture

The 65° baseline changes nothing about the rest of the TIN architecture:
- Relay count: unchanged (3 polar relays + 2–3 L-point hubs)
- Optical/RF comms payload: unchanged
- DTN protocol stack: unchanged  
- L-point hub AI functionality: unchanged
- Cost estimate: unchanged (same satellite count and launch vehicle class)
- The only change is trajectory design and mission duration to operational orbit

##### Remaining Open Questions

- **Exact VEEGA trajectory optimization**: Needs detailed design in GMAT or STK to pin down delta-V and transit time. Looking for collaborators with trajectory design experience.
- **Launch window constraints**: Jupiter alignment for gravity assist limits launch opportunities. What's the cadence, and does it align with TIN's Phase 1 timeline?
- **Solar sail alternative**: For even lower delta-V, a solar sail approach could achieve 65° inclination without Jupiter at all, at the cost of longer transit time (5–8 years). Worth a parallel trade study.

##### Data

Full simulation output: `data/65Inclnewbaseline.csv`
Simulation code: `simulations/sim_core_v0.3.py` (set `inclination = 65` parameter)
