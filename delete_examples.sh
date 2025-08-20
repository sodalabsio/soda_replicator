#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the current working directory
CURRENT_DIR="$(pwd)"

# Change into the template directory, if the script is run from elsewhere
if [ "$SCRIPT_DIR" != "$CURRENT_DIR" ]; then
  cd "$SCRIPT_DIR"
fi

# Delete files in code directory
rm -r code/renv
rm code/analysis/*
rm -r code/dataprep/*
find code -maxdepth 1 -type f ! -name ".gitignore" ! -name "checklist.md" -delete 2>/dev/null || true

# Delete files in data directory
rm data/analysis/*
rm data/interim/*
rm -r data/raw/*

# Delete files in paper directory
# Nothing to delete yet
# Update in case we add example files here
