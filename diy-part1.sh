sed -i '$a src-git momo https://github.com/nikkinikki-org/OpenWrt-momo.git;main' feeds.conf.default
git revert e344478a8c6b680f940691e78c334bf4c8875536
