# 📦 SwiftSC Repository

The official APT repository and binary registry for the SwiftSC smart contract language ecosystem.

## 🚀 Usage

### ⚙️ Install via APT (Linux)

To stay updated with the latest v1.0.3 toolchain, add our official repository:

```bash
# 1. Add the repository to your sources
echo "deb [trusted=yes arch=amd64] https://swiftsc-lang.github.io/swiftsc-repo stable main" | sudo tee /etc/apt/sources.list.d/swiftsc.list

# 2. Update and Install
sudo apt update
sudo apt install swiftsc
```

### 📦 Manual Installation

You can also download `.deb` packages directly from the [pool/](pool/) directory or the [GitHub Releases](https://github.com/swiftsc-lang/swiftsc-repo/releases) page.

```bash
sudo dpkg -i swiftsc_1.0.3_amd64.deb
```

## 🛠️ Repository Structure

- **[pool/](pool/)**: Contains the source `.deb` binary packages.
- **[dists/](dists/)**: Contains the APT repository metadata (Packages, Release files).
- **[update-repo.sh](update-repo.sh)**: Script used to regenerate APT metadata.

## 🤖 Automation (CI/CD)

This repository is equipped with several automated workflows to ensure safety and transparency:

1.  **Package Validation**: Every push to the `pool/` directory triggers a CI check that verifies the integrity and naming convention of all `.deb` files using `dpkg-deb`.
2.  **Auto-Release**: When a Pull Request containing a new package is merged into `main`, a GitHub Release is automatically created. The release notes are populated from the PR description, and the `.deb` file is attached as an asset.

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for specialized guidelines on how to submit new packages or improve repository infrastructure.

## 📄 License

Apache 2.0
