# Modify default IP
sed -i 's/192.168.6.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Use sing-box-1.12.16-reF1nd-linux-arm64
mkdir -p files/usr/bin/
wget https://github.com/Mattaclp/dailook-immortalwrt-mt798x-6.6/releases/download/sing-box-1.12.16-reF1nd-linux-arm64/sing-box
cp sing-box files/usr/bin/
chmod +x files/usr/bin/sing-box

# sing-box依賴刪除
sed #sed #sed -i 's/+sing-box//g' feeds/momo/mom

rm -rf files/etc/banner

# Zerotier
#mkdir -p files/etc/config/
#wget https://raw.githubusercontent.com/Mattaclp/dailook-immortalwrt-mt798x-6.6/refs/heads/main/zerotier
#cp zerotier files/etc/config/
