deps_config := \
	extra/Configs/Config.in.arch \
	extra/Configs/Config.c6x \
	extra/Configs/Config.xtensa \
	extra/Configs/Config.x86_64 \
	extra/Configs/Config.vax \
	extra/Configs/Config.v850 \
	extra/Configs/Config.sparc \
	extra/Configs/Config.sh64 \
	extra/Configs/Config.sh \
	extra/Configs/Config.powerpc \
	extra/Configs/Config.mips \
	extra/Configs/Config.microblaze \
	extra/Configs/Config.nios2 \
	extra/Configs/Config.nios \
	extra/Configs/Config.m68k \
	extra/Configs/Config.ia64 \
	extra/Configs/Config.i960 \
	extra/Configs/Config.i386 \
	extra/Configs/Config.hppa \
	extra/Configs/Config.h8300 \
	extra/Configs/Config.frv \
	extra/Configs/Config.e1 \
	extra/Configs/Config.cris \
	extra/Configs/Config.bfin \
	extra/Configs/Config.avr32 \
	extra/Configs/Config.arm \
	extra/Configs/Config.alpha \
	extra/Configs/Config.in

include/config/auto.conf: \
	$(deps_config)

ifneq "$(ARCH)" "i386"
include/config/auto.conf: FORCE
endif

$(deps_config): ;
