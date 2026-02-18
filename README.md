# TIN v0.3.5 — Tolerant Interlunar Network
**Hybrid Polar Relay Constellation + Lunar Pathfinder ELFO DTN/AI Routing Hub**  
*Low-cost, high-reliability comms for Artemis South Pole & Lunar Far-Side (NIAC 2027 Phase I prep)*

### v0.3.5 Hybrid Baseline (Feb 2026)
- 6–8 smallsats in **400 km circular 90° polar orbits**  
- **Lunar Pathfinder ELFO** (frozen elliptical: a=5740 km, e=0.58, i=55°, frozen arg peri ~86°, perilune over south pole) as primary intelligent DTN/AI hub

**28-day simulation results (elev >5°)**

| Configuration                    | South Pole (%) | Far-Side (%) |
|----------------------------------|----------------|--------------|
| Pure Polar 6 sats @ 400 km       | 99.6           | 46.4         |
| Pure Polar 8 sats @ 400 km       | 100.0          | 54.4         |
| **Hybrid 6 polar + Pathfinder**  | **99.9**       | **63.2**     |
| **Hybrid 8 polar + Pathfinder**  | **100.0**      | **68.5**     |

**Download full table:** [Quick_Summary_Table_tin_hybrid_polar.csv](Quick_Summary_Table_tin_hybrid_polar.csv)

### Hybrid Coverage Maps (28-day avg, elev >5°)

**South Pole – Hybrid 6 Polar + ELFO**  
![TIN v0.3.5 Hybrid — 6 Polar Sats + Pathfinder ELFO: South Pole Coverage. Near-perfect availability (99.9 %) across entire south-polar region below –85° latitude.](tin_hybrid_6polar_ELFO_south.png)

**Far-Side – Hybrid 6 Polar + ELFO**  
![TIN v0.3.5 Hybrid — 6 Polar Sats + Pathfinder ELFO: Far-Side Coverage. Clear boost from ELFO perilune passes (63.2 % availability).](tin_hybrid_6polar_ELFO_far.png)

**Far-Side – Hybrid 8 Polar + ELFO**  
![TIN v0.3.5 Hybrid — 8 Polar Sats + Pathfinder ELFO: Far-Side Coverage. Highest performance achieved (68.5 % availability).](tin_hybrid_8polar_ELFO_far.png)

*ELFO perilune passes provide the critical far-side visibility boost while the polar constellation guarantees near-continuous south-pole service.*

### Try it yourself
```bash
source venv_tin/bin/activate
python tin_coverage_map.py --polar_sats 8 --region farside --include_elfo --output my_map.png
