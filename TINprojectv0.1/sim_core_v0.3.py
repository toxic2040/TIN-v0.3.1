# ====================== NICE COVERAGE PLOT (v0.3) ======================
import matplotlib.pyplot as plt
import os

os.makedirs('simulation/output', exist_ok=True)

plt.style.use('dark_background')

fig, ax = plt.subplots(figsize=(12, 6))

dates = t.datetime
ax.plot(dates, direct_clear * 100, label='Direct Earth–Mars only', color='#ff4444', linestyle='--', alpha=0.85)
ax.plot(dates, total_clear * 100, label='TIN with 3 polar relays + L-hubs', color='#00ff88', linewidth=3)

# Shade the real Jan 2026 conjunction window
ax.axvspan(Time('2026-01-10').datetime, Time('2026-01-25').datetime, color='yellow', alpha=0.18, label='Jan 2026 Solar Conjunction blackout')

ax.set_ylabel('Coverage (%)', fontsize=12)
ax.set_xlabel('Date', fontsize=12)
ax.set_title('TIN v0.3 Coverage Simulation — Full Earth-Mars Synodic Cycle\n'
             'Dec 2025 – Feb 2027\n'
             'Direct: 94.36%   →   TIN: 100.00%', fontsize=14, pad=20)

ax.legend(facecolor='#1a1a1a', edgecolor='#ffffff', fontsize=11)
ax.grid(True, alpha=0.3)
plt.xticks(rotation=45)
plt.tight_layout()

plt.savefig('simulation/output/coverage_timeline_v0.3.png', dpi=300, bbox_inches='tight', facecolor='black')
print("✅ Beautiful plot saved: simulation/output/coverage_timeline_v0.3.png")
plt.show()   # remove this line if you don't want it popping up