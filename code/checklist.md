# Replication Checklist
[Note: This is a sample template. Review and adapt to the specific context of your project.]

Claude, check only elements selected with `[x]`.

## Data Management
- [x] Code reads all input data from subdirectories of `../data`
- [x] Data cleaning steps do not modify raw data files
- [x] Interim data files are written to `../data/interim/` or subdirectories thereof
- [x] Final analysis datasets are stored in `../data/analysis/`
- [x] All data file paths use relative paths (e.g., `../data/...`)

## Code Organization
- [x] Data preparation scripts are in `dataprep/` subdirectories by data source
- [x] Analysis scripts are in `analysis/` directory
- [x] Scripts have descriptive names indicating their purpose
- [ ] Main replication script exists that runs all steps in sequence

## Reproducibility
- [x] Virtual environment is configured (renv.lock, requirements.txt, or conda.yml)
- [x] All package/library versions are locked
- [x] Random seeds are set where applicable
- [x] No absolute file paths are used
- [x] No manual file operations are required between scripts

## Code Quality
- [x] Variable names are descriptive and meaningful
- [x] Functions and scripts have clear, single purposes
- [x] Code includes comments explaining non-obvious operations
- [x] Long scripts are broken into logical sections or separate files
- [x] Consistent style/formatting is used throughout

## Data Verification
- [ ] Checksums or data integrity checks are implemented where applicable
- [ ] Missing values is documented and justified
- [ ] Data merges specify join keys and handle unmatched observations
- [ ] Sample restrictions are clearly documented
- [ ] Outlier treatment is documented and justified

## Statistical Analysis
- [ ] Standard errors are clustered/robust as appropriate
- [ ] Sample weights are applied if necessary
- [ ] Results are exported to `../paper/results/tables/` or `../paper/results/figures/`

## Documentation
- [ ] Each script has a header comment describing its purpose
- [ ] Complex transformations are explained in comments
- [ ] Variable construction is documented
- [ ] README explains overall pipeline and execution order
- [ ] Computational requirements (time, memory) are documented

## Output Generation
- [ ] Table/figure output files have clear, consistent naming
- [ ] Figures have labels, titles, and formatting

## Version Control
- [ ] Git repository is initialized with meaningful commits
- [ ] Large data files are excluded via .gitignore
- [ ] Sensitive information (API keys, passwords) is not committed
- [ ] Commit messages describe changes clearly
- [ ] Code is in a separate repository from paper

## Final Package Preparation
- [ ] All data sources are documented with citations
- [ ] Data availability statement is prepared
- [ ] Instructions for running replication are complete
- [ ] Computational requirements are documented
- [ ] Expected runtime is documented
- [ ] Master script runs without errors on clean environment
