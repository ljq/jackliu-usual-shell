# Jack Liu's MacOS Scripts

### Jack Liu's Usual Tool Script List:

* **macos_nginx_brew_service.sh**: 

###### 用途说明 🍎
此脚本用于解决MacOS升级新版后，基于Homebrew发行的Nginx包守护服务无法启动运行问题。
此问题一般由MacOS更新的权限隐私策略与nginx守护服务权限冲突导致服务无法启动。该脚本通过直接操作nginx服务进程实现服务的管理。

###### 命令参数:
```
    -v|V|version: Show current nginx version information.
    
    -h|-help|--help: Show help info.
    
    -s|s|status: Nginx process status.
    
    start|restart|reload|stop: Service operation.
```

 [English](README.md)