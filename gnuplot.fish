# -*- fish -*-
#
# Fish completions for gnuplot ...
#
# This file is in the Public Domain
# written by Stephane Perrot (2024)
#
complete -e gnuplot

# Pas nécessaire d'utiliser un ls intermediaire
# Si quotes : l'expansion est différée ...
complete -c gnuplot -x -a '*.gp *.dem'

complete -c gnuplot -s V -l version		-d 'Display version'
complete -c gnuplot -s h -l help		-d 'Display help'
complete -c gnuplot -s p -l persist		-d 'Persist window after quitting'
complete -c gnuplot -s s -l slow		-d 'Wait for font initialization'
complete -c gnuplot -s d -l default-settings	-d 'Do not read init files'
complete -c gnuplot -s c -r			-d 'scriptname ARG1 ARG2 ...'
complete -c gnuplot -s e -r			-d "Execute commands: command1; command2; ..."

# TBD These are X11 specific options, not generally useful
#complete -c gnuplot -s 'clear' -d   'requests that the window be cleared momentarily'
#complete -c gnuplot -s 'tvtwm' -d   'requests relative geometry specifications'
#complete -c gnuplot -s 'raise' -d   'raises plot window after each plot'
#complete -c gnuplot -s 'noraise' -d 'does not raise plot window after each plot'
#complete -c gnuplot -s 'ctrlq'   -d 'closes window on ctrl-q rather than q'
#complete -c gnuplot -s 'persist' -d 'plot windows survive after main gnuplot program exits'
