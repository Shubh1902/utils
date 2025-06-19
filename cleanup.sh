#!/bin/bash

set -e  # Exit on error

echo "🔄 Removing all node_modules..."
find . -name "node_modules" -type d -prune -exec rm -rf '{}' +

echo "🧹 Removing all dist folders..."
find . -name "dist" -type d -prune -exec rm -rf '{}' +

echo "🧨 Removing all package-lock.json files..."
find . -name "package-lock.json" -type f -exec rm -f '{}' +

echo "🧨 Removing all yarn.lock files..."
find . -name "yarn.lock" -type f -exec rm -f '{}' +

echo "📦 Installing dependencies with yarn..."
yarn

echo "🏗️ Building the project with yarn..."
yarn build

echo "✅ Cleanup and build complete."
