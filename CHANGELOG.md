# Changelog — TIN Heliocentric Relays

All notable changes to this project will be documented in this file.
Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [0.3.1] — 2026-02-17

### Changed
- Updated version header from 0.1 to 0.3.1 across all documents.
- Fixed section numbering gaps (4.2 → 5.4 → 6.2 renumbered to sequential 4.1, 4.2, 4.3, 5.1).
- Corrected Exec Summary and Architecture sections: replaced legacy ~90° separation baseline with current 65° baseline.
- Promoted DTN section from orphaned subsection (6.2) to standalone "Networking Architecture" section (5).
- Relocated "Remaining Open Questions" from inside the DTN section to a dedicated section near end of document; expanded with new items (pointing budget, radiation environment, parametric link model).
- Added transition paragraphs between Orbital Mechanics, Simulation Methodology, and Networking Architecture sections.

### Added
- **Prior Art survey** covering: Lagrange-relay topologies (NASA TM-20205007788, Martín-Neira 2023), MarsSat co-orbital concept (Gangale 2008), ESA/Strathclyde non-Keplerian hovering relays (2009), Linear-Circular Commutating Chain architecture, synodic-resonant waypoints (Turner 2024), NASA DSOC flight results, and MTO revival (July 2025) / Blue Origin Blue Ring proposal (Aug 2025).
- **Link Budget Overview** with worked reference cases for optical backbone (1550 nm, DSOC-heritage parameters) and Ka-band RF access links (MRO-heritage scaled), plus link margin summary table.
- Architecture 1 description now cross-references Section 4.1 trade study.

---

## [0.3.0] — 2026-02-XX

### Added
- DTN (Delay-Tolerant Networking) integration section with Bundle Protocol discussion.
- AI hub concept for onboard autonomous decision-making during conjunction blackouts.
- Interactive 3D orbit visualization (`interplanetary_network_viz.html`).

---

## [0.2.0] — 2026-XX-XX

### Added
- Polar relay orbit concept replacing equatorial baseline.
- Conjunction-proof coverage analysis.
- Initial architecture diagrams.

---

## [0.1.0] — 2026-XX-XX

### Added
- Initial proposal draft: problem statement, motivation, and high-level architecture.
- README and MIT license.
