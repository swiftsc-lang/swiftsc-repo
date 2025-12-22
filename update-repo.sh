#!/bin/bash
# Update SwiftSC-Lang APT Repository Metadata
set -e

REPO_ROOT=$(pwd)

echo "🔄 Updating SwiftSC-Lang APT Repository Metadata..."

# 1. Generate Packages file
echo "📦 Scanning pool for packages..."
dpkg-scanpackages --multiversion pool/ > dists/stable/main/binary-amd64/Packages
gzip -k -f dists/stable/main/binary-amd64/Packages

# 2. Create Release file
echo "📄 Generating Release file..."
cd dists/stable
# Note: In a production repo, you would sign this with GPG
apt-ftparchive release . > Release

echo "✅ Repository metadata updated successfully!"
echo "Next step: git add . && git commit -m 'Update repo' && git push"
