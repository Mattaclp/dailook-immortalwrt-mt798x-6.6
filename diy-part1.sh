# sed -i '$a src-git momo https://github.com/nikkinikki-org/OpenWrt-momo.git;main' feeds.conf.default
# git reset --hard c0cb2126a3afaa2994c43fcdb9e3a08962a2f9fd
# git clone https://github.com/Slava-Shchipunov/awg-openwrt/ package/awg-openwrt
git clone -b awg3 --recursive https://github.com/dvv101111/awg-openwrt.git package/awg-openwrt
