#!/bin/bash

# Define the files to be deleted
files_to_delete=("dist" "babel.config.json" "CHANGELOG.md" "package.json" "rollup.config.js" "tsconfig.json")

# Function to recursively delete files in a directory
delete_files() {
  local dir="$1"
  for file in "${files_to_delete[@]}"; do
    local file_path="${dir}/${file}"
    if [[ -f "${file_path}" ]]; then
      rm -rf "${file_path}"
      echo "Deleted: ${file_path}"
    fi
  done

  # Recursively traverse subdirectories
  for subdir in "${dir}"/*; do
    if [[ -d "${subdir}" ]]; then
      delete_files "${subdir}"
    fi
  done
}

# Get the starting directory
start_dir="$PWD"

# Call the recursive function
delete_files "${start_dir}"
