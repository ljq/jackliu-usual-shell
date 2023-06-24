#!/usr/bin/env bash
# Title：🍎 Cleanup Device Trash Files.
# 		 macOS Cleanup 清除释放磁盘空间.
# Author： Jack Liu
# UpdateTime: 2023-06-24 16:13
# -----------------------------------
#

cd ~

argv_1=$1

if [ "$argv_1" == "" ] ; then
	### clean list
	echo -e "-------------- 【用户目录 Cleanup 清除释放磁盘空间支持的参数说明】-------------\n"
	echo -e "-os: 	清理🍎系统~用户目录下(包含.DS_Store|Xcode模拟器缓存|Xcode无用SDK）"
	echo -e "-vmc: 	清理vmware fusion运行缓存；"
	echo -e "-npm: 	清理.npm缓存"
	echo -e "-gdl: 	清理.gradle"
	echo -e "-wx: 	微信数据缓存目录(注意：清理微信目录前关闭卸载微信,慎用勿频繁执行！)"
	echo -e "-omz: 	zsh插件更新(附加)"
	echo -e "---------------------------------------------------------\n"
	# 读取一个参数值
	read -p'[请输入要清理的项目参数]: ' vmc
	echo -e "已输入:${vmc}\n"
fi

if [ "$argv_1" == "" ]; then
	echo "参数为空，请重新执行此脚本"
	exit
fi

echo -e "[NOTICE] Task is running ..."

### Task
case $argv_1 in
	"-os")
		# 清理用户目录下.DS_Store
		sudo find . -path ./.Trash -prune -o -name ".DS_Store" -print -depth -exec rm {} \;
		sudo find . -path ./.Trash -prune -o -name "._.DS_Store" -print -depth -exec rm {} \;
		sudo find . -path ./Library -prune -o -name ".DS_Store" -print -depth -exec rm {} \;
		sudo find . -path ./Library -prune -o -name "._.DS_Store" -print -depth -exec rm {} \;

		# 清理Xcode升级后的模拟器
		xcrun simctl delete unavailable

		# 清理Xcode无用的SDK
		sudo rm -rf /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform
		sudo rm -rf /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVSimulator.platform
		sudo rm -rf /Applications/Xcode.app/Contents/Developer/Platforms/WatchOS.platform
		sudo rm -rf /Applications/Xcode.app/Contents/Developer/Platforms/WatchSimulator.platform
		;;
	"-vmc")
		# Vmware Fusion clean
		echo 'Vmware Fusion clean...'
		cat /dev/zero > wipefile; rm wipefile
		~/VmwareFusionBin/vmware-vdiskmanager -d "/Users/jackliu/VmwareFusionPro/Centos8_X64.vmwarevm/虚拟磁盘.vmdk"
		~/VmwareFusionBin/vmware-vdiskmanager -k "/Users/jackliu/VmwareFusionPro/Centos8_X64.vmwarevm/虚拟磁盘.vmdk"
		~/VmwareFusionBin/vmware-vdiskmanager -d "/Users/jackliu/VmwareFusionPro/Centos8_X64-node01.vmwarevm/虚拟磁盘-cl1.vmdk"
		~/VmwareFusionBin/vmware-vdiskmanager -k "/Users/jackliu/VmwareFusionPro/Centos8_X64-node01.vmwarevm/虚拟磁盘-cl1.vmdk"
		~/VmwareFusionBin/vmware-vdiskmanager -d "/Users/jackliu/VmwareFusionPro/Centos8_X64-devops02.vmwarevm/虚拟磁盘-cl2.vmdk"
		~/VmwareFusionBin/vmware-vdiskmanager -k "/Users/jackliu/VmwareFusionPro/Centos8_X64-devops02.vmwarevm/虚拟磁盘-cl2.vmdk"
		;;
	"-npm")
		# 清理npm
		npm cache verify
		npm cache clean --force
		;;
	"-wx")
		echo "微信缓存文件清理..."
		sudo rm -rf ~/Library/Containers/com.tencent.xinWeChat/Data/Library/Application\ Support/com.tencent.xinWeChat/*
		;;
	"-omz")
		# oh-my-zsh 更新
		echo "oh-my-zsh仓库更新"
		cd ~/.oh-my-zsh && git pull && cd ~
		;;
	"-gdl")
		# 清理.gradle缓存
		gradle build --refresh-dependencies	
		;;
	*)
		echo -e "[Warning]参数无效\n"
		;;
esac

echo "-------------- [ The cleanup task is complete. ] -----------"
exit

