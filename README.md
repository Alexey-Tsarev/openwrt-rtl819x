This repository contains OpenWrt (Barrier Breaker) for Realtek rtl819x devices.

It based on the OpenWrt, which was found in this archive:
https://sourceforge.net/projects/rtl819x/files/rtk_openwrtSDK_v2.5.tar.gz

Supported devices
(according to information from http://4pda.ru/forum/index.php?showtopic=642012):
- TOTOLINK A2004NS
- WAVLINK WL-WN527A2

Steps to build this firmware: https://wiki.openwrt.org/doc/howto/build


Clone this repo:
~~~
git clone https://github.com/AlexeySofree/OpenWrt-rtl819x.git
cd OpenWrt-rtl819x
~~~

or get new changes (in case if you already cloned) via:
~~~
git pull
~~~


Install required packages: https://wiki.openwrt.org/doc/howto/buildroot.exigence  
CentOS (some packages require EPEL):
~~~
yum install subversion binutils bzip2 gcc gcc-c++ gawk gettext flex ncurses-devel zlib-devel zlib-static make patch unzip perl-ExtUtils-MakeMaker glibc glibc-devel glibc-static quilt ncurses-libs sed sdcc intltool sharutils bison wget git-core openssl-devel xz
~~~

~~~
./scripts/feeds update -a
./scripts/feeds install -a

cp config/.config .config # this is a "default" config. Use it as a start point
make menuconfig

make download V=99
make V=99
~~~
---

Notes:  
The script: `rtl819x-commit_finder/commits_finder.sh`
helped to find the start commit. Starting at the found commit, Realtek made own changes.

There are two branches, which were rebased from original barrier_breaker branch in the different ways:
- The `barrier_breaker-rtl819x_dev1` branch is auto-rebased using "Accept Theirs" option
- The `barrier_breaker-rtl819x_dev2` branch is auto-rebased using "Accept Yours" option

The result contains the following different files:
~~~
git diff barrier_breaker-rtl819x-dev1..barrier_breaker-rtl819x-dev2 --name-only
package/kernel/mac80211/files/lib/netifd/wireless/mac80211.sh
target/linux/ar7/Makefile
target/linux/ar71xx/Makefile
target/linux/ar71xx/base-files/etc/diag.sh
target/linux/ar71xx/base-files/etc/uci-defaults/01_leds
target/linux/ar71xx/config-3.10
target/linux/ar71xx/image/Makefile
target/linux/at91/Makefile
target/linux/atheros/Makefile
target/linux/au1000/Makefile
target/linux/avr32/Makefile
target/linux/brcm2708/Makefile
target/linux/brcm47xx/Makefile
target/linux/brcm63xx/Makefile
target/linux/brcm63xx/base-files/etc/uci-defaults/02_network
target/linux/cns21xx/Makefile
target/linux/cns3xxx/Makefile
target/linux/imx6/Makefile
target/linux/ixp4xx/Makefile
target/linux/kirkwood/Makefile
target/linux/lantiq/Makefile
target/linux/lantiq/base-files/etc/uci-defaults/01_leds
target/linux/lantiq/xrx200/config-default
target/linux/malta/Makefile
target/linux/mpc85xx/Makefile
target/linux/octeon/Makefile
target/linux/orion/Makefile
target/linux/ppc40x/Makefile
target/linux/ramips/Makefile
target/linux/ramips/base-files/etc/diag.sh
target/linux/ramips/base-files/etc/uci-defaults/01_leds
target/linux/ramips/base-files/etc/uci-defaults/02_network
target/linux/ramips/base-files/lib/ramips.sh
target/linux/ramips/base-files/lib/upgrade/platform.sh
target/linux/ramips/image/Makefile
target/linux/rb532/Makefile
target/linux/realview/Makefile
target/linux/uml/Makefile
target/linux/x86/Makefile
target/linux/xburst/Makefile
~~~
---

Contributions Welcome!

Good luck!  
Alexey Tsarev, Tsarev.Alexey at gmail.com
