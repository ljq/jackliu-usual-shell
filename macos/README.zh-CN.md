# Jack Liu's MacOS Scripts

### Jack Liu's Usual Tool Script List:

* **orbstack_ssh.sh**: Orbstack SSH Tool

####### orbstack fast connect ssh：
```
# Define an array of node names or addresses
nodes=(
    "root@rocky-master@orb"
    "root@rocky-node1@orb"
    "root@rocky-node2@orb"
    "root@rocky-node3@orb"
    
    # Add more nodes here as needed
)
```

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