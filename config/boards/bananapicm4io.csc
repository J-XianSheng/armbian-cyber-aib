# Amlogic A311D 4GB RAM eMMC GBE USB3
BOARD_NAME="Banana Pi CM4IO"
BOARDFAMILY="meson-g12b"
BOARD_MAINTAINER="pyavitz"
BOOTCONFIG="bananapi-cm4-cm4io_defconfig"
KERNEL_TARGET="current,edge"
KERNEL_TEST_TARGET="current"
MODULES_BLACKLIST="simpledrm" # SimpleDRM conflicts with Panfrost
FULL_DESKTOP="yes"
SERIALCON="ttyAML0"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="amlogic/meson-g12b-bananapi-cm4-cm4io.dtb"
BOOTBRANCH_BOARD="tag:v2024.07"
BOOTPATCHDIR="v2024.07"

function post_family_tweaks_bsp__bananapi_rtl_bt() {
	if [[ -d "$SRC/packages/bsp/bananapi/rtl_bt" ]]; then
		mkdir -p "${destination}"/lib/firmware/updates/rtl_bt
		display_alert "$BOARD" "Installing upstream firmware" "info"
		cp -fr $SRC/packages/bsp/bananapi/rtl_bt/* "${destination}"/lib/firmware/updates/rtl_bt/
	fi
}