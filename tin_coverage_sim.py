cd ~/Desktop/TINProject

cat > tin_coverage_map.py << 'EOF'
import numpy as np
import matplotlib.pyplot as plt
import argparse
import os

print("🚀 TIN v0.3.5 – Hybrid Polar Swarm + Pathfinder ELFO Hub")

parser = argparse.ArgumentParser(description="TIN v0.3.5 hybrid coverage")
parser.add_argument('--polar_sats', type=int, default=6, help='Number of polar relays')
parser.add_argument('--altitude', type=float, default=400.0, help='Polar altitude km')
parser.add_argument('--region', type=str, default='south_pole', choices=['south_pole', 'far_side'])
parser.add_argument('--output', type=str, default=None)
args = parser.parse_args()

# Constants
R_moon = 1737.4
min_elev = 5.0
T_sim = 28 * 86400.0
num_times = 720
times = np.linspace(0, T_sim, num_times, endpoint=False)

# 1. Polar swarm (circular 90°)
num_polar = args.polar_sats
a_polar = R_moon + args.altitude
n_polar = np.sqrt(4902.8 / a_polar**3)
RAAN_p = np.deg2rad(np.linspace(0, 360, num_polar, endpoint=False))
M0_p = np.deg2rad(np.linspace(0, 360, num_polar, endpoint=False))

# 2. Pathfinder ELFO hub (real frozen orbit params)
a_elfo = 5740.0
e_elfo = 0.58
inc_elfo = np.deg2rad(55.0)
omega_elfo = np.deg2rad(86.3)   # frozen perilune over south pole
RAAN_elfo = np.deg2rad(0.0)
M0_elfo = 0.0
n_elfo = np.sqrt(4902.8 / a_elfo**3)

# Grid
if args.region == 'south_pole':
    lats = np.arange(-90.0, -59.5, 0.5)
    lons = np.arange(0.0, 360.0, 2.0)
    title_region = 'South Pole'
    output_default = f'tin_hybrid_{num_polar}polar_ELFO_south.png'
else:
    lats = np.arange(-80.0, 80.1, 0.5)
    lons = np.arange(90.0, 270.1, 2.0)
    title_region = 'Far-Side'
    output_default = f'tin_hybrid_{num_polar}polar_ELFO_far.png'

if args.output is None:
    args.output = output_default

LON, LAT = np.meshgrid(lons, lats)
flat_lats = LAT.ravel()
flat_lons = LON.ravel()

pos_gs = R_moon * np.column_stack((
    np.cos(np.deg2rad(flat_lats)) * np.cos(np.deg2rad(flat_lons)),
    np.cos(np.deg2rad(flat_lats)) * np.sin(np.deg2rad(flat_lons)),
    np.sin(np.deg2rad(flat_lats))
))

covered_count = np.zeros(len(flat_lats), dtype=int)

for t in times:
    visible_any = np.zeros(len(flat_lats), dtype=bool)
    
    # Polar sats
    for k in range(num_polar):
        M = M0_p[k] + n_polar * t
        nu = M
        r = a_polar
        cos_nu, sin_nu = np.cos(nu), np.sin(nu)
        cos_O, sin_O = np.cos(RAAN_p[k]), np.sin(RAAN_p[k])
        cos_i, sin_i = 0.0, 1.0   # 90° polar
        sat_x = r * (cos_nu * cos_O - sin_nu * sin_O * cos_i)
        sat_y = r * (cos_nu * sin_O + sin_nu * cos_O * cos_i)
        sat_z = r * (sin_nu * sin_i)
        sat_pos = np.array([sat_x, sat_y, sat_z])
        vec = sat_pos - pos_gs
        dist = np.linalg.norm(vec, axis=1)
        dot = np.sum(vec * pos_gs, axis=1)
        cos_zen = np.clip(dot / (dist * R_moon), -1.0, 1.0)
        elev = np.rad2deg(np.pi/2 - np.arccos(cos_zen))
        visible_any |= (elev > min_elev)
    
    # Pathfinder ELFO hub
    M = M0_elfo + n_elfo * t
    E = M + e_elfo * np.sin(M)
    nu = 2 * np.arctan2(np.sqrt(1+e_elfo)*np.sin(E/2), np.sqrt(1-e_elfo)*np.cos(E/2))
    r = a_elfo * (1 - e_elfo**2) / (1 + e_elfo * np.cos(nu))
    cos_nu, sin_nu = np.cos(nu), np.sin(nu)
    cos_O, sin_O = np.cos(RAAN_elfo), np.sin(RAAN_elfo)
    cos_i, sin_i = np.cos(inc_elfo), np.sin(inc_elfo)
    cos_om, sin_om = np.cos(omega_elfo), np.sin(omega_elfo)
    x = r * (cos_nu * cos_om - sin_nu * sin_om)
    y = r * (cos_nu * sin_om + sin_nu * cos_om)
    sat_x = x * cos_O - y * sin_O * cos_i
    sat_y = x * sin_O + y * cos_O * cos_i
    sat_z = y * sin_i
    sat_pos = np.array([sat_x, sat_y, sat_z])
    vec = sat_pos - pos_gs
    dist = np.linalg.norm(vec, axis=1)
    dot = np.sum(vec * pos_gs, axis=1)
    cos_zen = np.clip(dot / (dist * R_moon), -1.0, 1.0)
    elev = np.rad2deg(np.pi/2 - np.arccos(cos_zen))
    visible_any |= (elev > min_elev)
    
    covered_count += visible_any.astype(int)

coverage_pct = (covered_count / num_times * 100.0).reshape(LAT.shape)
avg_cov = np.mean(coverage_pct[lats < -85]) if args.region == 'south_pole' else np.mean(coverage_pct)

# Plot
fig, ax = plt.subplots(figsize=(11, 9))
im = ax.pcolormesh(LON, LAT, coverage_pct, cmap='plasma', shading='auto', vmin=0, vmax=100)
plt.colorbar(im, ax=ax, label='Coverage Availability (%)')
ax.set_title(f'TIN v0.3.5 Hybrid — {num_polar} Polar + Pathfinder ELFO Hub\n{title_region} Coverage (28-day avg, elev >5°)', pad=20)
ax.set_xlabel('Lunar Longitude (°E)')
ax.set_ylabel('Lunar Latitude (°N)')
if args.region == 'south_pole':
    ax.plot(0, -90, 'k+', markersize=12, label='South Pole')
    ax.contour(LON, LAT, LAT, levels=[-88], colors='white', linestyles='--')
else:
    ax.axvline(180, color='white', linestyle='--', label='Far-Side Center')
ax.grid(True, alpha=0.3)
ax.legend(loc='upper right')
plt.tight_layout()
plt.savefig(args.output, dpi=300, bbox_inches='tight')
print(f"✅ Saved: {args.output}")
print(f"   Average {title_region} coverage: {avg_cov:.1f}%")
plt.show()
EOF

echo "✅ v0.3.5 Hybrid script loaded (Pathfinder ELFO hub + AI-routing ready)"