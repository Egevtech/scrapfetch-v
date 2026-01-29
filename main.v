module main

import infinixius.sysinfo
import os

fn main() {
	data := sysinfo.get_system_info()

	username := os.loginname() or {"Unknown"}
	hostname := os.hostname() or { "Unknown" }
	sysname := sysinfo.release() or { "Unknown" }
	kernel_name := os.uname().sysname
	kernel_ver := os.uname().release

	mem_use := data.memory_total / 1024 - data.memory_available / 1024
	mem_total := data.memory_total / 1024

	res := os.execute("which scrap")

	scrap_status := if res.exit_code == 0 { "installed" } else { "not installed" }


	println("@@@@@@@@@::.....:@@@    $username@$hostname")
	println("@: :..... ......:@@@    ========")
	println(":  ....:-===++++@@@@    OS - $sysname")
	println(":. .=++++++++===::@@    Kernel - $kernel_name $kernel_ver")
	println("@.  :+===-..... ..:@")
	println("@ .. .....:-==+:  .@    Mem - $mem_use/$mem_total MB")
	println("@@..====+++++++=. .:")
	println("@@@@++=+==--:.... .:")
	println("@@@::..... ......:@@    Scrap is $scrap_status on your $sysname")
	println("@@@:... ..:@@@@@@@@@")

}
