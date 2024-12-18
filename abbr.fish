# -*- fish -*-
# ==============================================================================
# Completion for abbr is not defined by default !!
#
# Fish completions for abbr ...
#
# This file is in the Public Domain
# written by Stephane Perrot (2024)
#
# Completion for abbr is not defined by default !!
# ==============================================================================
complete -e abbr

# abbr --add NAME [--position command | anywhere] [-r | --regex PATTERN]
#                 [--set-cursor[=MARKER]] ([-f | --function FUNCTION] | EXPANSION)
# abbr --erase NAME ...
# abbr --rename OLD_WORD NEW_WORD
# abbr --show
# abbr --list
# abbr --query NAME ...

#abbr --add NAME [--position command | anywhere] [-r | --regex PATTERN] [--set-cursor[=MARKER]] ([-f | --function FUNCTION] | EXPANSION)
complete -f -c abbr -s a -l add		-d 'Creates a new abbreviation.'
complete -f -c abbr -s e -l erase	-d 'Erases the abbreviation with the given name.'
complete -f -c abbr -s s -l show	-d 'Show all abbreviations in a manner suitable for import and export.'
complete -f -c abbr -s l -l list	-d 'Print the names of all abbreviation.'
complete -f -c abbr -s q -l query	-d 'Return 0 (true) if one of the NAME is an abbreviation.'
complete -f -c abbr -s h -l help	-d 'Displays help for the abbr command.'
complete -f -c abbr      -l rename	-d 'Rename an abbreviation, from OLD_NAME to NEW_NAME'


