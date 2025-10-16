#!/usr/bin/env bash
# Author : Jaco Liu
# Email: stackgo@163.com
# pyenv pipenv:
#   site-packages path info
#   cd site-packages path info

# system platform os
function systemPlatform(){
    os=""
    if [ "$(uname)" == "Darwin" ]; then
        # Mac OS X 操作系统
        os="Darwin"
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then   
        # GNU/Linux操作系统
        os="Linux"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then    
        # Windows NT操作系统
        os="MINGW32_NT"
    fi
    echo $os
}

#brew pyenv python version
pyfullversion=$(python --version)  
pyfullversion=${pyfullversion//Python /}
pysubversionarray=(${pyfullversion//./ })
pysubversion="${pysubversionarray[0]}.${pysubversionarray[1]}"

#echo $pyfullversion
#echo $pysubversion


osplatform=$(systemPlatform)
case ${osplatform} in 
    "Darwin")
        if [ ${osplatform} == "Darwin" ]; then
            # version
            echo -e "site-packages path info:"
            echo -e "cd ～/.pyenv/versions/${pyfullversion}/lib/python${pysubversion}/site-packages"
        fi
        ;;
esac

exit 0



 
