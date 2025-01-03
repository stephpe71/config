# -*- fish -*-
# ==============================================================================
# Fish shell completion for the 'zabbix_get' command
# (the one most used on the CLI)
#
# Inspired by default zabbix_get.fish
#
# Author:	Stéphane Perrot 
# Version:	0.82
# Date:		09-10-2024
#
# DISCLAIMER : I'm new to fish, learning by examples
#
# TODO:
#  - documentation for each key/item (keep it short)
#  - completion of filenames/dirnames in [] would be nice
#  - Maybe do something with abbrevs ? nit -> net.if.total ap -> agent.ping
# 
# Thanks to the nice people at Brasserie Paris-Europe (Paris 8th. district)
# for coffee and inspiration!
# 
# This file is in the Public Domain
#
# ==============================================================================
# Variables for categoring the multiple keys (-k parameters) to the zabbix_get cmd

set -l _zg_agent_hosts		"127.0.0.1 localhost"
set -l _zg_interfaces		(ifconfig -a | grep ^[a-z] | awk '{print $1}' | tr -d ':')
set -g interfaces		(ifconfig -a | grep ^[a-z] | awk '{print $1}' | tr -d ':')

set -l _zg_pref_host		"localhost"

set -l _zg_comp_initialized	""

# to be used with string match -r/ (-qer for example)
# we dont put space before [ for now
set -l _zg_item_re		'[a-z]+\.[a-z]+(\.[a-z]+)?\['

set -l _zg_agent_if_type_values "bytes(default)|packets|errors|dropped|overruns|frame|compressed|multicast"

# ==============================================================================
# Functions
# from zypper completion ...
function _zg_initialize_completion
   echo -n "Initializing... "
   set -g dest_uname		$(zabbix_get -s 127.0.0.1 -k system.uname | awk '{print $1}')
   set -g dest_agt_version	$(zabbix_get -s 127.0.0.1 -k agent.version)
   echo "done."
end

#_zg_initialize_completion
function _zg_cmd_in_array
    for i in (commandline -pco)
        # -- is used to provide no options for contains
        # (if $i is equal to --optname without -- will be error)
        if contains -- $i $argv
            return 0
        end
    end
    return 1
end

# check item-2 and item
function _zg_cmd_in_array
    for i in (commandline -pco)
        # -- is used to provide no options for contains
        # (if $i is equal to --optname without -- will be error)
        if contains -- $i $argv
            return 0
        end
    end
    return 1
end

function _zg_current_item
    return (commandline -pco | awk '{print $NF}')
end

set -l _zg_ref_doc '/home/sperrot/admin/sup/zabbix/agent/doc/1 Zabbix agent.html'

function _zg_current_item_docstring
    set -l _tmp $(grep $argv $_zg_ref_doc)
    return $_zg_ref_doc
end

# one function for each
function _zg_item_is_vfs_file_contents ; _zg_cmd_in_array "vfs.file.contents"; end
function _zg_item_is_net_if_in ;	_zg_cmd_in_array "net.if.in"; end
function _zg_item_is_net_if_out ;	_zg_cmd_in_array "net.if.out"; end
function _zg_item_is_net_if_total ;	_zg_cmd_in_array "net.if.total"; end
function _zg_item_is_proc_mem ;		_zg_cmd_in_array "proc.mem"; end
function _zg_item_is_proc_num ;		_zg_cmd_in_array "proc.num"; end

function reverse
    for i in $(seq (count $argv) 1)
	echo $argv[$i]
    end
end

# approche sans les [
function _zg_item_is_net_if_in_two_params
    set -l revcli (reverse (commandline -pco))
    set -l retval 1

    string match -q -- $revcli[2] net.if.in; and contains -- $revcli[1] $interfaces; and set retval 0

    return $retval
end

# if faut que ca matche uniquement si 
function _zg_item_is_net_if_in_one_param
    set -l revcli (reverse (commandline -pco))
    set -l retval 1

    string match -q -- $revcli[1] net.if.in; and set retval 0

    return $retval
end

# quelle interface ?
function _zg_item_looking_at
    set -l re $argv
    set -l revcli (reverse (commandline -pco))
    set -l retval 1

    string match -q -- $revcli[1] net.if.in; and set retval 0

    return $retval
end

# ==============================================================================
# Completions

# General
# complete -c zabbix_get -f -s s -l host -d "Specify host name or IP address of a host."
complete -c zabbix_get -f -s p -l port		 -d "Specify port number of agent running on the host."
complete -c zabbix_get -f -s I -l source-address -d "Specify source IP address."
complete -c zabbix_get -f -s t -l timeout	 -d "Specify timeout."
complete -c zabbix_get -f -s h -l help		 -d "Display this help and exit."
complete -c zabbix_get -f -s V -l version	 -d "Output version information and exit."

# SPE
# No need to define completion all at once 
# 1 line by completion item is apparently acceptable...
complete -r zabbix_get -f -s s -d "Host name or IP address." -a "$_zg_agent_hosts"


# Defined below, with a line for each item
#complete -c zabbix_get -f -s k -l key -d "Specify key of item to retrieve value for."

# Start of auto generated list
# Auto generated completion lines for fish
# from keys list as of Zabbix Agent (variant 1) v7.0, FreeBSD

# We keep the short "[Item doc]" for now, as it allows more keys
# to be displayed in a compact way

# Detailed item parameters would be best displayed in a
# 'sub completion step' 
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a agent.hostmetadata
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a agent.hostname
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a agent.ping
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a agent.variant
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a agent.version

complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a eventlog
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a eventlog.count

complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a kernel.maxfiles
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a kernel.maxproc
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a modbus.get

complete -r -c  zabbix_get -f -s k -d "[ip?,name,type?,timeout?,count?,protocol?]" -a net.dns
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a net.dns.perf
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a net.dns.record

complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a net.if.collisions
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a net.if.discovery

complete -r -c  zabbix_get -f -s k -d "<if,mode>"	-a net.if.in
complete -r -c  zabbix_get -f -s k -d "<if,mode>"	-a net.if.out
complete -r -c  zabbix_get -f -s k -d "<if,mode>"	-a net.if.total

# The following are obsolete I would guess...
complete -r -c  zabbix_get -f -s k -d "[Item doc]"	-a net.tcp.dns 
complete -r -c  zabbix_get -f -s k -d "[Item doc]"	-a net.tcp.dns.query

complete -r -c  zabbix_get -f -s k -d "[port]"		  -a net.tcp.listen
complete -r -c  zabbix_get -f -s k -d "[ip,port]"	  -a net.tcp.port
complete -r -c  zabbix_get -f -s k -d "[service,ip,port]" -a net.tcp.service
complete -r -c  zabbix_get -f -s k -d "[service,ip,port]" -a net.tcp.service.perf

complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a net.udp.listen
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a net.udp.service
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a net.udp.service.perf

complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a proc.get
#complete -r -c  zabbix_get -f -s k -d "[<name>,<user>,<state>,<cmdline>,<zone>]" -a proc.mem
#complete -r -c  zabbix_get -f -s k -d "[<name>,<user>,<state>,<cmdline>,<zone>]" -a proc.num

complete -r -c  zabbix_get -f -s k -d "[name,user,state,cmdline,zone]" -a proc.mem
complete -r -c  zabbix_get -f -s k -d "[name,user,state,cmdline,zone]" -a proc.num

complete -r -c  zabbix_get -f -s k -d "Boot time stamp." -a system.boottime
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.cpu.discovery
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.cpu.intr
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.cpu.load
#complete -r -c  zabbix_get -f -s k -d "[online|max]" -a system.cpu.num
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.cpu.load

#complete -r -c  zabbix_get -f -s k -d "[<cpu num or all>,<type>,<mode>,<logical or physical>]" -a system.cpu.swcomplete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.cpu.switches
#complete -r -c  zabbix_get -f -s k -d "[pname,user,,][Item doc]" -a system.cpu.util
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.cpu.util
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.hostname
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.localtime

complete -r -c  zabbix_get -f -s k -d "[Command_to_run_on_system]" -a system.run

complete -r -c  zabbix_get -f -s k -d "System arch." -a system.sw.arch
complete -r -c  zabbix_get -f -s k -d "System swap size" -a system.swap.size
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a system.uname

#complete -r -c  zabbix_get -f -s k -d "Time since boot (secs)." -a system.uptime

complete -r -c  zabbix_get -f -s k -d "#seconds since boot."	   -a system.uptime
complete -r -c  zabbix_get -f -s k -d "#users connected on system" -a system.users.num

#complete -r -c  zabbix_get -f -s k -d "[<device>,<type>,<mode>]" -a vfs.dev.read
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a vfs.dev.read
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a vfs.dev.write
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a vfs.dir.count
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a vfs.dir.get
complete -r -c  zabbix_get -f -s k -d "[Item doc]" -a vfs.dir.size

complete    -n _zg_item_is_vfs_file_contents -c zabbix_get -d -F

# Works, at least !!!
# complete -x -n _zg_item_is_net_if_in_two_params -c zabbix_get -a "bytes packets errors dropped "
# complete -x -n _zg_item_is_net_if_in_one_param  -c zabbix_get -d "interface" -a "em0 lo0 wlan0"

complete -f -n _zg_item_is_proc_mem -c zabbix_get -d "<name>,<user>,<mode>,<cmdline>,<memtype>" -a ",,,, []"

# On ne met pas de -f pour vfs.file.
complete -r -c zabbix_get -s k -d "File checksum."		-a vfs.file.cksum
complete -r -c zabbix_get -s k -d "File contents."		-a vfs.file.contents
complete -r -c zabbix_get -s k -d "Check file existence."	-a vfs.file.exists
complete -r -c zabbix_get -s k -d "Get file contents."		-a vfs.file.get
complete -r -c zabbix_get -s k -d "File md5sum."		-a vfs.file.md5sum
complete -r -c zabbix_get -s k -d "File owner"			-a vfs.file.owner
complete -r -c zabbix_get -s k -d "File perms"				-a vfs.file.permissions
complete -r -c zabbix_get -s k -d "Get file extract matching regexp"	-a vfs.file.regexp
complete -r -c zabbix_get -s k -d "Check if file matches regexp"	-a vfs.file.regmatch
complete -r -c zabbix_get -s k -d "Get file size"		-a vfs.file.size
complete -r -c zabbix_get -s k -d "Get file time"		-a vfs.file.time

complete -r -c zabbix_get -f -s k -d "File system discovery" -a vfs.fs.discovery
complete -r -c zabbix_get -f -s k -d "" -a vfs.fs.get
complete -r -c zabbix_get -f -s k -d "" -a vfs.fs.inode
complete -r -c zabbix_get -f -s k -d "" -a vfs.fs.size

complete -r -c zabbix_get -f -s k -d "[Item doc]" -a vm.memory.size

complete -r -c zabbix_get -f -s k -d "[Item doc]" -a web.page.get
complete -r -c zabbix_get -f -s k -d "[Item doc]" -a web.page.perf
complete -r -c zabbix_get -f -s k -d "[Item doc]" -a web.page.regexp

complete -r -c zabbix_get -f -s k -d "[Item doc]" -a zabbix.stats

#complete -f -n _zg_cmd_in_array -c zypper -a '(__fish_zypper_print_repos)' -d Repo

# ==============================================================================
# Abbreviations
# Useful : the '[]' are added without being interpreted
# RAF : put the cursor 2 chars back, inside the []
# 
# FIXME?: risk of interferences w/ other user defined abbrevs ?
# for now that risk is doomed acceptable
# maybe add a check beforehand

# maybe useful
#    for a in (abbr --list); abbr -e $a ; end

abbr --add --position anywhere ap	agent.ping
abbr --add --position anywhere av	agent.version
abbr --add --position anywhere ava agent.variant

abbr --add --position anywhere nid net.if.discovery
abbr --add --position anywhere nii	net.if.in[]
abbr --add --position anywhere nio net.if.out[]
abbr --add --position anywhere nit	net.if.total

abbr --add --position anywhere pm proc.mem[]
abbr --add --position anywhere pn	proc.num[]
abbr --add --position anywhere pg	proc.get

abbr --add --position anywhere swa	system.sw.arch
abbr --add --position anywhere syn	system.users.num

# Doesn't work (the set cursor)
#abbr --add --position anywhere --set-cursor='\]' vfc	vfs.file.contents[]
abbr --add --position anywhere vfc	vfs.file.contents[]
abbr --add --position anywhere vfck	vfs.file.cksum[]
abbr --add --position anywhere vfe	vfs.file.exists[]
abbr --add --position anywhere vfg	vfs.file.get[]
abbr --add --position anywhere vfm	vfs.file.md5sum[]
abbr --add --position anywhere vfo	vfs.file.owner[]
abbr --add --position anywhere vfre	vfs.file.regexp[]
abbr --add --position anywhere vfrl	vfs.file.regmatch[]

abbr --add --position anywhere vfsg	vfs.fs.get[]
abbr --add --position anywhere zs	zabbix.stats


# ==============================================================================
# ADDITIONAL: not strictly zabbix_get related, but useful

# To transform a timestamp in datehour 
alias tstodt	'xargs date -r'

# to prettify json data:'
# 'mlr --j2t cat'
#
#zabbix_get -s localhost -k proc.get[] | jq -c '.[] | {pid,name,pmem}' | mlrj2tcat | fancygrid
#
# with sorted data:
# 
# 1) json -> tsv
#alias mlrj2tcat

# 2) display tsv in a noce grid
alias fancygrid	'tabulate -1 -f fancy_grid'    



