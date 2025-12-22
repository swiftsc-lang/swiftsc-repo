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
cat > release.conf <<EOF
APT::FTPArchive::Release::Origin "SwiftSC-Lang";
APT::FTPArchive::Release::Label "SwiftSC-Lang";
APT::FTPArchive::Release::Suite "stable";
APT::FTPArchive::Release::Codename "stable";
APT::FTPArchive::Release::Architectures "amd64";
APT::FTPArchive::Release::Components "main";
APT::FTPArchive::Release::Description "Official SwiftSC-Lang APT Repository";
EOF

# Move to the dists/stable directory to generate the release file relative to it
cd dists/stable
apt-ftparchive -c "$REPO_ROOT/release.conf" release . > Release
rm "$REPO_ROOT/release.conf"

echo "✅ Repository metadata updated successfully!"
echo "Next step: git add . && git commit -m 'Update repo' && git push"
