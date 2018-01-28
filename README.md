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
Contributions Welcome!

Good luck!  
Alexey Tsarev, Tsarev.Alexey at gmail.com
