# TIN Supporting Data

Technical datasets supporting the TIN proposal. All figures are derived from simulation models and published reference values — see the main proposal and `simulations/` folder for methodology and sources.

## Dataset Index

| File | Description | Key Metrics |
|------|-------------|-------------|
| `CombinedNetworkPerf.csv` | End-to-end network performance across orbital configurations | Throughput, availability, hop count by scenario |
| `GeometricCoverageAnalysis.csv` | Line-of-sight coverage during solar conjunction geometry | Coverage % vs. Sun-Earth-Mars angle |
| `LatencyAnalysis.csv` | One-way and round-trip latency for each relay path | 3–27 min one-way; worst-case relay penalty |
| `CommSuite.csv` | Communications payload specifications per satellite | Optical/RF bands, data rates, antenna specs |
| `SatBusDesign.csv` | Satellite bus design parameters | Mass, power, propulsion, design life |
| `Delta-VBudget.csv` | Delta-V requirements for each orbit insertion | Launch-to-station ΔV by relay position |
| `LaunchVehicleComp.csv` | Launch vehicle comparison for deployment | Falcon Heavy, Starship, Ariane 6 trade study |
| `DeployTimelines.csv` | Phased deployment schedule | Phase 0 (lunar) through full operational capability |
| `CostBreakdown.csv` | Per-element cost estimates | Satellite, launch, ops, ground segment |
| `TotalProgramCost.csv` | Aggregated program cost model | ~$2.5–3B total (realistic mid-range estimate) |

## Usage

These CSVs are provided as open data under the MIT license. They are intended to support independent review, simulation replication, and follow-on analysis. If you use this data in your own work, a citation or link back to this repo is appreciated.

## Questions?

Open an [issue](https://github.com/toxic2040/TIN-Heliocentric-Relays/issues) if you spot errors, want to discuss assumptions, or have alternative data to contribute.
