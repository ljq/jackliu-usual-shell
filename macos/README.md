# MacOS Scripts

### Jack Liu's Usual Tool Script List:

**macos_nginx_brew_service.sh**: 

This script is used to resolve the problem that the Homebrew-based Nginx package daemon service cannot be started after the new version of MacOS is updated. This problem is usually caused by the conflict between the permission privacy policy updated by MacOS and the permission of the nginx daemon service. This script manages the service by directly manipulating the nginx service process.

[简体中文](README.zh-CN.md)
 