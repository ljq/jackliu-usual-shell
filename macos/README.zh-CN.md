# Jaco Liu's MacOS Scripts

### Jaco Liu's Usual Tool Script List:

* **orbstack_ssh.sh**: Using SSH and node number to quickly log into servers based on orbstack.dev.

####### 使用SSH和活跃的节点编号来快速登录基于orbstack.dev的服务器：

* **macos_nginx_brew_service.sh**: 

###### MacOS 🍎 
**MacOS Ventura 13.3**

###### 用途说明
此脚本用于解决MacOS升级新版后，基于Homebrew发行的Nginx包守护服务无法启动运行问题。
此问题一般由MacOS更新的权限隐私策略与nginx守护服务权限冲突导致服务无法启动。该脚本通过直接操作nginx服务进程实现服务的管理。

###### 命令参数:
```
    -v|V|version: Show current nginx version information.
    
    -h|-help|--help: Show help info.
    
    -s|s|status: Nginx process status.
    
    start|restart|reload|stop: Service operation.
```

###### **cleanup-macOS-Disk.sh**
macOS Cleanup 清除释放磁盘空间.
注意：面向开发者，普通用户慎用。


 [English](README.md)