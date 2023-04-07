#!/usr/bin/env bash
# Author: Jack Liu
# Date Time: 2023-04-07 20:06
# Site: https://github.com/ljq
# Blog: https://www.defense.ink
# Email: ljqlab@163.com
# Description: 🍎 The nginx distribution provided by hombrew daemon service shortcut script.

# help info
USEAGE="[usage]: [-s | s | status] [start | restart | reload | stop] [-h | -help | --help] [-v | -V | --version]"
HELP_INFO=$(cat <<EOF
[help information]

Description: 🍎 
    This script is used to resolve the problem that the Homebrew-based Nginx package 
    daemon service cannot be started after the new version of MacOS is updated. This 
    problem is usually caused by the conflict between the permission privacy policy 
    updated by MacOS and the permission of the nginx daemon service. This script 
    manages the service by directly manipulating the nginx service process.

Command usage:

    -v|V|version: Show current nginx version information.
    
    -h|help: Show help info.
    
    -s|s|status: Nginx process status.
    
    start|restart|reload|stop: Service operation.

EOF
)

# set variables
sh_file=$0
argv1=$1
nginx_conf_file=$(brew --prefix)/etc/nginx/nginx.conf
nginx_bin=$(brew --prefix nginx)/bin/nginx

# main

# description
if [ "$argv1" = "" ]; then
	echo -e "[brew's nginx service shortcut script]\n"
fi
# initialization check
if ! [ -x "$(command -v brew)" ]; then
	echo -e "[WARNING] Homebrew is not installed."
	exit
fi
if [ ! -f "$nginx_bin" ]; then
	echo -e "[WARNING] The version of nignx provided by homebrew is not installed."
	exit
fi
if [ ! -f "$nginx_conf_file" ]; then
        echo -e "[WARNING] The nignx.conf file provided by homebrew is not exist."
        exit
fi
# nginx config check
chk_status=$(${nginx_bin} -t 2>&1)
if [[ $chk_status =~ "syntax is ok" ]] && [[ $chk_status =~ "test is successful" ]]; then
	#echo -e "[INFO] The nginx.conf syntax is ok.\n"
	echo ""
else
	echo -e "[ERROR] The nginx.conf syntax is incorrect."
	exit
fi

# exec
case "$argv1" in
	"-v"|"-version"|"--version"|"-V")
	  ${nginx_bin} -V
	  ;;
	"-s"|"s"|"status")
	  serv_process=$(ps -ef | grep nginx | grep -v "grep\|${sh_file}")
	  if [ "$serv_process" = "" ]; then
		echo -e "[NOTICE] Nginx service status is stoped.\n"
	  else
	  	echo -e "[NOTICE] Nginx service status is running.\n"
	  fi
	  ;;
	"start")
	  serv_process=$(ps -ef | grep nginx | grep -v "grep\|${sh_file}")
	  if [ "$serv_process" = "" ]; then
	    echo -e "[NOTICE] Nginx service is starting ...\n"
	    ${nginx_bin} -c $nginx_conf_file
	  else
	  	echo -e "[WARNING] Nginx service is already running. Do not repeat operation.\n"
	  fi
	  ;;
	"restart")
	  echo -e "[NOTICE] Nginx service is restarting ...\n"
	  ${nginx_bin} -s stop
	  ${nginx_bin} -c $nginx_conf_file
	  ;;
	"reload")
	  echo -e "[NOTICE] Nginx service is reloading ...\n"
	  ${nginx_bin} -s reload
	  ;;
	"stop")
	  ${nginx_bin} -s stop
	  echo -e "[NOTICE] Nginx service has stoped.\n"
	  ;;
	"-t")
	  ${nginx_bin} -t
	  ;;
	"-h"|"-help"|"--help")
	  echo -e "${HELP_INFO}\n" 
	  ;;
	*)
	  echo -e "[WARNING] Parameter is invalid or missing. Please run help command: ${sh_file} -h\n"
	  ;;
esac

exit
