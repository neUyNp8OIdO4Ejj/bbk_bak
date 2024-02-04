#!/bin/bash
# new Env('BBK-新春红包');
# export JD_LOG_XYZ_TOKEN="从机器人获取的token"
# export Proxy_Url="代理网址 例如：星空、熊猫 生成选择txt 一次一个"
# export KNKH_HELP_PINS="指定pin助力，多个用英文&分割"
# export KNKH_SUSSCESS_COUNT="37" # 助力次数 默认37
# export KNKH_BAN_PINS="黑名单pin不参与助力，多个用英文&分割"
# export KNKH_DRAW="false" # true自动抽奖 false不自动抽奖,默认不抽奖
# export KNKH_USE_PROXY="false" # true使用代理
# export KNKH_DELAY="10" # 助力等待多少秒 默认1秒 可选参数,可以不填。
# export KNKH_CK_START_INDEX="10" # 从第10个号开始助力 可选参数,可以不填。
# knkh_list.txt助力链接文件
# 1.先设置助力次数，再设置助力pin或链接
# 2.支持PIN或者链接方式(`knkh_list.txt`存放需要助力的URL,一行一个)
# 3.pin方式支持抽奖和提现
pwd
_ftype=""
use_get_arch=${BBK_ARCH}
get_arch=`arch`
if [ "$use_get_arch" != "" ]; then
  get_arch=$use_get_arch
  echo "指定运行$use_get_arch"
fi
echo $get_arch
if [[ $get_arch =~ "x86_64" ]];then
	_ftype="linux-amd64"
elif [[ $get_arch =~ "x86" ]];then
	_ftype="linux-386"
elif [[ $get_arch =~ "i386" ]];then
	_ftype="linux-386"
elif [[ $get_arch =~ "aarch64" ]];then
	_ftype="linux-arm64"
elif [[ $get_arch =~ "arm" ]];then
	_ftype="linux-arm"
else
	_ftype=""
fi

if [ $_ftype == "" ]; then
	echo "不支持的架构$get_arch"
else
	echo "执行$_ftype"
    if [ -f "$PWD/BBK/$_ftype.bbk" ]; then
        echo "$PWD/BBK/$_ftype.bbk"
        eval "chmod +x ./BBK/$_ftype.bbk"
        eval "./BBK/$_ftype.bbk -t CuGSh5GGZ0T9KDpFkRJUnQ"
    else
        if [ ! -f "$PWD/$_ftype.bbk" ]; then
            echo "在$PWD/BBK目录、$PWD目录下均未找到文件$_ftype.bbk"
            exit 1
        fi
        echo "$PWD/$_ftype.bbk"
        eval "chmod +x $PWD/$_ftype.bbk"
        eval "$PWD/$_ftype.bbk -t CuGSh5GGZ0T9KDpFkRJUnQ"
    fi
fi