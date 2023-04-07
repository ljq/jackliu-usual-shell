# Jack Liu's MacOS Scripts

### Jack Liu's Usual Tool Script List:

* **macos_nginx_brew_service.sh**: 
[help information]

###### Description: 🍎 
This script is used to resolve the problem that the Homebrew-based Nginx package 
daemon service cannot be started after the new version of MacOS is updated. This 
problem is usually caused by the conflict between the permission privacy policy 
updated by MacOS and the permission of the nginx daemon service. This script 
manages the service by directly manipulating the nginx service process.

###### Command usage:
```
    -v|V|version: Show current nginx version information.
    
    -h|-help|--help: Show help info.
    
    -s|s|status: Nginx process status.
    
    start|restart|reload|stop: Service operation.
```

[简体中文](README.zh-CN.md)
 