#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# Add luci-app-mosdns
rm -rf feeds/packages/lang/golang
git clone --single-branch --depth=1 https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
git clone -b v5 --single-branch --depth=1 https://github.com/sbwml/luci-app-mosdns package/mosdns
git clone --single-branch --depth=1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# Add luci-app-adguardhome
git clone --single-branch --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome

# Add luci-app-amlogic
git clone --single-branch --depth=1 https://github.com/ophub/luci-app-amlogic package/luci-app-amlogic
