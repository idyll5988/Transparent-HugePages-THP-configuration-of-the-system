#!/system/bin/sh
[ ! "$MODDIR" ] && MODDIR=${0%/*}
[ -e ${MODDIR}/dev/*/.magisk/busybox ] && BB=$(echo ${MODDIR}/dev/*/.magisk/busybox);
[ -e ${MODDIR}/data/adb/magisk/busybox ] && BB=${MODDIR}/data/adb/magisk/busybox;
[ -e ${MODDIR}/data/adb/ap/bin/busybox ] && BB=${MODDIR}/data/adb/ap/bin/busybox;
[ -e ${MODDIR}/data/adb/ksu/bin/busybox ] && BB=${MODDIR}/data/adb/ksu/bin/busybox;
[ -e ${MODDIR}/system/bin/busybox ] && BB=${MODDIR}/system/bin/busybox;
[ -e ${MODDIR}/system/bin/toybox ] && SOS=${MODDIR}/system/bin/toybox;
[ -e ${MODDIR}/system/bin/sqlite3 ] && SQ=${MODDIR}/system/bin/sqlite3;
[ "$BB" ] && export PATH="/system/bin:$BB:$PATH";
function lock_value() {
	if [[ ! -f "$1" ]]; then
	    km2 "命令:($1) 位置不存在跳过..."
        return 1
    fi
	chmod 0666 "$1" 2> /dev/null 
	chown root:root "$1"
	local curval=$(cat "$1" 2> /dev/null)
	if [[ "$curval" == "$2" ]]; then
	    km1 "命令:$1 参数已存在 ($2) 跳过..."
	    return 0
	fi
	if ! echo -n "$2" > "$1" 2> /dev/null; then
	    km2 "写入:($1) -❌-> 命令 $2 参数失败"
		return 1
	fi
	chmod 0444 "$1"
	km1 "写入:$1 $curval -✅-> 命令 ($2) 参数成功"
}

