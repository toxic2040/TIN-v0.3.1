import numpy as np
import matplotlib.pyplot as plt
import argparse
import os

print("🚀 TIN v0.3.3 – Polar Relay Coverage Map CLI (true polar + ELFO)")

parser = argparse.ArgumentParser(description="TIN v0.3.3 south-pole coverage")
parser.add_argument('--altitude', type=float, default=400.0)
parser.add_argument('--num_sats', type=int, default=6)
parser.add_argument('--inclination', type=float, default=90.0)
parser.add_argument('--eccentricity', type=float, default=0.0)
parser.add_argument('--min_elev', type=float, default=5.0)
parser.add_argument('--sim_days', type=int, default=28)
parser.add_argument('--output', type=str, default='tin_v0.3.3_south_pole.png')
args = parser.parse_args()

# Constants
R_moon = 1737.4
a = R_moon + args.altitude
mu = 4902.8
n = np.sqrt(mu / a**3)
inc = np.deg2rad(args.inclination)
e = args.eccentricity
min_elev = args.min_elev

num_sats = args.num_sats
RAANs = np.deg2rad(np.linspace(0, 360, num_sats, endpoint=False))
M0s = np.deg2rad(np.linspace(0, 360, num_sats, endpoint=False))

# Grid
lats = np.arange(-90.0, -59.5, 0.5)
lons = np.arange(0.0, 360.0, 2.0)
LON, LAT = np.meshgrid(lons, lats)
flat_lats = LAT.ravel()
flat_lons = LON.ravel()

pos_gs = R_moon * np.column_stack((
    np.cos(np.deg2rad(flat_lats)) * np.cos(np.deg2rad(flat_lons)),
    np.cos(np.deg2rad(flat_lats)) * np.sin(np.deg2rad(flat_lons)),
    np.sin(np.deg2rad(flat_lats))
))

T_sim = args.sim_days * 86400.0
num_times = 720
times = np.linspace(0, T_sim, num_times, endpoint=False)

covered_count = np.zeros(len(flat_lats), dtype=int)
for t in times:
    visible_any = np.zeros(len(flat_lats), dtype=bool)
    for k in range(num_sats):
        M = M0s[k] + n * t
        E = M + e * np.sin(M)
        nu = 2 * np.arctan2(np.sqrt(1+e)*np.sin(E/2), np.sqrt(1-e)*np.cos(E/2))
        r = a * (1 - e**2) / (1 + e * np.cos(nu))
        
        cos_nu, sin_nu = np.cos(nu), np.sin(nu)
        cos_O, sin_O = np.cos(RAANs[k]), np.sin(RAANs[k])
        cos_i, sin_i = np.cos(inc), np.sin(inc)
        
        sat_x = r * (cos_nu * cos_O - sin_nu * sin_O * cos_i)
        sat_y = r * (cos_nu * sin_O + sin_nu * cos_O * cos_i)
        sat_z = r * (sin_nu * sin_i)
        sat_pos = np.array([sat_x, sat_y, sat_z])
        
        vec = sat_pos - pos_gs
        dist = np.linalg.norm(vec, axis=1)
        dot_prod = np.sum(vec * pos_gs, axis=1)
        cos_zen = np.clip(dot_prod / (dist * R_moon), -1.0, 1.0)
        zen_ang = np.arccos(cos_zen)
        elev = np.rad2deg(np.pi/2 - zen_ang)
        
        visible_any |= (elev > min_elev)
    covered_count += visible_any.astype(int)

coverage_pct = (covered_count / num_times * 100.0).reshape(LAT.shape)
south_avg = np.mean(coverage_pct[lats < -85])

# Plot
fig, ax = plt.subplots(figsize=(11, 9))
im = ax.pcolormesh(LON, LAT, coverage_pct, cmap='plasma', shading='auto', vmin=0, vmax=100)
plt.colorbar(im, ax=ax, label='Coverage Availability (%)')
ax.set_xlabel('Lunar Longitude (°E)')
ax.set_ylabel('Lunar Latitude (°N)')
title = f'TIN v0.3.3 — {num_sats}× {args.inclination:.1f}° Relays @ {args.altitude} km'
if args.eccentricity > 0:
    title += f' (e={args.eccentricity:.2f})'
ax.set_title(title + f'\nSouth Pole (28-day avg, elev >{min_elev}°, staggered)', pad=20)

ax.plot(0, -90, 'k+', markersize=12, label='South Pole')
ax.contour(LON, LAT, LAT, levels=[-88], colors='white', linestyles='--', linewidths=1.5)
ax.text(5, -89.5, 'Shackleton PSR', color='white', fontsize=10, fontweight='bold')
ax.grid(True, alpha=0.3)
ax.legend(loc='upper right')
plt.tight_layout()

save_path = args.output
plt.savefig(save_path, dpi=300, bbox_inches='tight')
print(f"✅ Saved: {save_path}")
print(f"   South-pole average (lat < -85°): {south_avg:.1f}%")
plt.show()
