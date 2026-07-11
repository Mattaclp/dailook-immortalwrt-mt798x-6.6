rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 26.x feeds/packages/lang/golang

# 移除 passwall feeds 自带的核心库
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}

# 移除过时的luci-app-passwall版本
rm -rf feeds/luci/applications/luci-app-passwall

git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/passwall-packages
git clone https://github.com/Openwrt-Passwall/openwrt-passwall package/passwall-luci

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# replace gn version
rm -rf feeds/packages/devel/gn/Makefile
wget https://github.com/Mattaclp/NewLEDE/raw/refs/heads/main/gn/gnMakefile
mv gnMakefile feeds/packages/devel/gn/Makefile
rm -rf feeds/packages/devel/gn/src/out/last_commit_position.h
wget https://github.com/Mattaclp/NewLEDE/raw/refs/heads/main/gn/src/out/last_commit_position.h
mv last_commit_position.h feeds/packages/devel/gn/src/out/last_commit_position.h

# Add OpenClash Meta
#mkdir -p files/etc/openclash/core
#wget -qO "clash_meta.tar.gz" "https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"
#tar -zxvf "clash_meta.tar.gz" -C files/etc/openclash/core/
#mv files/etc/openclash/core/clash files/etc/openclash/core/clash_meta
#chmod +x files/etc/openclash/core/clash_meta
#rm -f "clash_meta.tar.gz"

rm -rf feeds/luci/applications/luci-app-openclash

function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../
  cd .. && rm -rf $repodir
}

git_sparse_clone dev https://github.com/vernesong/OpenClash luci-app-openclash
cp -rf luci-app-openclash package

mkdir bin
mkdir bin/packages
cp -r package/luci-app-openclash bin/packages/
zip -r luci-app-openclash.zip bin/packages/luci-app-openclash
cp -r luci-app-openclash.zip bin/packages/luci-app-openclash.zip
