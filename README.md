# SwiftSC-Lang APT Repository

This repository hosts the official Debian packages for SwiftSC-Lang.

## How to use this repository

### 1. Add the repository to your system
Run the following command to add this repository to your APT sources:

```bash
echo "deb [trusted=yes arch=amd64] https://swiftsc-lang.github.io/swiftsc-repo stable main" | sudo tee /etc/apt/sources.list.d/swiftsc.list
```

> [!NOTE]
> We use `[trusted=yes]` because this repository is currently unsigned. For production use, we recommend signing with GPG.

### 2. Update and Install
```bash
sudo apt update
sudo apt install swiftsc
```

## Contributing
To add new packages to this repository, place the `.deb` file in the appropriate `pool/` directory and run `./update-repo.sh`.
