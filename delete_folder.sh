#!/bin/bash

# Function to recursively delete a directory
delete_dir() {
  local dir="$1"
  if [[ -d "${dir}" ]]; then
    rm -rf "${dir}"
    echo "Deleted: ${dir}"
  fi
}

# Get the starting directory
start_dir="$PWD"

# Call the function to delete the "dist" folder
delete_dir "${start_dir}/dist"

# Recursively delete "dist" folders in subdirectories
for subdir in "${start_dir}"/*; do
  if [[ -d "${subdir}" ]]; then
    delete_dir "${subdir}/dist"
  fi
done
