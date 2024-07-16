# Jack Liu's usual shell scripts

### Jack Liu's Usual Tool Script List:

* MacOS: 🍎
    * **macos_nginx_brew_service.sh**: This script aims to resolve the problem that the service cannot be started due to the conflict between the nginx daemon service permission and the MacOS permission privacy policy provided by the installation package of the new MacOS version and Homebrew. This script directly operates the nginx service process.
    *  **cleanup-macOS-Disk.sh**
    macOS Cleanup Clear Free disk space.
    Warnning: For developers, ordinary users should use with caution.


* Cross-platform:
    * **pipenv-pkg.sh**: MacOS (brew install pipenv) site-packages path info


### Directory structure
```
├── README.md
├── cross-platform
│   ├── README.md
│   └── pipenv-pkg.sh
└── macos
    ├── README.md
    ├── README.zh-CN.md
    ├── cleanup-macOS-Disk.sh
    ├── macos_nginx_brew_service.sh
    └── orbstack_ssh.sh

3 directories, 8 files
```
