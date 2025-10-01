# Create summary statistics

# Import packages
import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv('../data/analysis/baseline.csv')

# Compute summary statistics
summary_stats = df[['precipitation', 'temperature', 'population']].agg(['mean', 'std', 'min', 'max'])

# Create LaTeX table
latex_table = """
\\begin{table}[H]
\\centering
\\caption{Summary Statistics}
\\label{tab:summary_statistics}
\\begin{tabularx}{\\textwidth}{Xccc}
\\toprule \\toprule
Statistic & Precipitation & Temperature & Population \\\\
\\midrule
"""

# Add data rows
for stat in ['mean', 'std', 'min', 'max']:
  stat_name = stat.capitalize()
  if stat == 'std':
    stat_name = 'Standard Deviation'
  
  latex_table += f"{stat_name} & "
  latex_table += f"{summary_stats.loc[stat, 'precipitation']:.2f} & "
  latex_table += f"{summary_stats.loc[stat, 'temperature']:.2f} & "
  latex_table += f"{summary_stats.loc[stat, 'population']:.2f} \\\\\n"

# Close table
latex_table += """\\bottomrule
\\end{tabularx}
\\end{table}
"""

# Save to file
with open('../paper/results/tables/summary_statistics.tex', 'w') as f:
  f.write(latex_table)

# Create plots
# Temperature vs Population
plt.figure(figsize = (10, 6))
plt.scatter(df['temperature'], df['population'], alpha = 0.5)
plt.xlabel('Temperature')
plt.ylabel('Population')
plt.gca().spines['top'].set_visible(False)
plt.gca().spines['right'].set_visible(False)
plt.tight_layout()
plt.savefig('../paper/results/figures/temperature_population.png', dpi = 300)
plt.close()

# Precipitation vs Population
plt.figure(figsize = (10, 6))
plt.scatter(df['precipitation'], df['population'], alpha = 0.5)
plt.xlabel('Precipitation')
plt.ylabel('Population')
plt.gca().spines['top'].set_visible(False)
plt.gca().spines['right'].set_visible(False)
plt.tight_layout()
plt.savefig('../paper/results/figures/precipitation_population.png', dpi = 300)
plt.close()
