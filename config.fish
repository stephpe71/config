# -*- fish -*-
# ==============================================================================
# Stephane Perrot config file for the Fish shell
#
# Disclaimer: I'm new to the(this) shell, some
# things may be clearly doable in a better way!
# ==============================================================================
if status is-interactive

    set -l mytmp (ps ux | grep emacs)
    if count $res >= 1 ; set EDITOR 'emacsclient -nw'; else; set EDITOR vi; end
    
    # Commands to run in interactive sessions can go here
    fish_config prompt choose pythonista

    alias b bat
    alias c cat
    alias l less
    alias j jobs
    alias s 'dirs | tr " " "\n" | cat -n'
    alias p pushd
    alias po popd 

    abbr -a bp bat -p
    
    alias al 'ls -al'
    alias la 'ls -la'
    alias sl ls
    alias ltr 'ls -ltr'

    #alias md mkdir
    #alias rd rmdir
    abbr -a md mkdir
    abbr -a rd rmdir
    
    alias rl 'source ~/.config/fish/config.fish'
    alias wh which

    #alias zg zabbix_get
    #alias gz zabbix_get
    abbr -a zg zabbix_get

    alias +x 'chmod +x'
    #alias -x 'chmod -x'
    alias +w 'chmod +w'
    #alias -w 'chmod -w'

    abbr -a gco git checkout
    abbr -a ecn emacsclient -n 
    abbr -a zgloc zabbix_get -s localhost -k 

    # ----------------------------------------------------------------------------
    # Autres exemples
    #
    # abbr -a   --position anywhere -- -C --color
    # abbr -a L --position anywhere --set-cursor '% | less'
    #
    # function last_history_item ; echo $history[1] ; end
    # abbr -a !! --position anywhere --function last_history_item
    #
    # function myedit ; echo $EDITOR $argv ; end
    # abbr -a edit_texts --position command --regex ".+\.txt" -- function vim_edit
    # ----------------------------------------------------------------------------
    alias jqc	'jq -c'
    alias jqm	'jq -M'
    alias jq.	'jq .'
    alias wcl	'wc -l'

    alias ns	netstat
    alias nsan	'netstat -an'
    
    # FreeBSD version, GNU date would use a @
    alias tstodt	'xargs date -r'
    alias mlrj2tcat	'mlr --j2t cat'
    alias fancygrid	'tabulate -1 -f fancy_grid'    

    abbr -a j2t		mlr --j2t cat
    abbr -a fgr		tabulate -1 -f fancy_grid

    set -l touchpad_devid $(xinput list | grep TouchPad | perl -pe 's@.*id=(\d+).*@\1@')

    alias disable_touchpad	"xinput disable $touchpad_devid"
    alias enable_touchpad	"xinput enable  $touchpad_devid"

    # FIXME: does not work as abbrevs ...
    #alias erase_abbrevs 'for a in (abbr --list); abbr -e $a ; end'

    # --------------------------------------------------------------------------
    # Partie supervision 
    # Default zabbix_agent to request
    alias tofg 'mlrj2tcat | fancygrid'
    
    set -g zg_host "localhost"
    #set -g zg_proc_fields "{pid,name,pmem,cputime_user,cputime_system,cmdline}"
    set -g zg_proc_fields "{pid,name,pmem,cputime_user,cputime_system,cmdline}"
    #alias za_file_get 'zabbix_agent -s $zg_host -k vfs.file_get'

    # alias zg		zabbix_get
    alias get_procs	"zabbix_get -s $zg_host -k proc.get"

    alias top_mem	"get_procs | jq '.|sort_by(.pmem)' | jq -c '.[]|$zg_proc_fields'"
    alias top_mem_grid	"top_mem | mlrj2tcat | fancygrid"

    alias top_cpu	"get_procs | jq '.|sort_by(.cputime_user)' | jq -c '.[]|$zg_proc_fields'"
    alias top_cpu_grid	"top_cpu | mlrj2tcat | fancygrid"
    
    # to be defined
    #alias top_cpu "get_procs|jq '.|sort_by(.pmem)'|jq -c '.[]|$zg_proc_fields'"

    # example for files
    #zabbix_get -s localhost -k vfs.dir.get[/tmp,,,file] | jq '. | sort_by(.size) |last'
    #zabbix_get -s localhost -k vfs.dir.get[/var/log,,,file] | jqc '. | sort_by(.size) |.[]|{basename,user,size,pathname}' | mlrj2tcat | fancygrid

    # zg -s $zg_host -k vfs.dir.get[/var/log,,,file] | jqc '. | sort_by(.size) |.[]|{basename,user,group,permissions,size,pathname}' | tofg

    # --------------------------------------------------------------------------
    # Abbreviations 
    function multicd
	set -l length (math (string length -- $argv) -1)
	echo cd (string repeat -n $length ../)
    end
    # Abbrevs turn oout to be better than aliases, imo
    abbr --add dotdot --regex '^\.\.+$' --function multicd
    abbr --add dzdo --position command sudo 
    abbr --add gp   --position command gnuplot
    abbr --add ecn  --position command emacsclient -n # no wait
end







