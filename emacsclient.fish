# -*- fish -*-
# ==============================================================================
# Fish completions for emacsclient ...
#
# written by Stephane Perrot (2024)
#
# This file is in the Public Domain
# ==============================================================================
complete -e emacsclient

complete -c emacsclient -s V -l version			-d 'Just print version info and return'
complete -c emacsclient -s H -l help			-d 'Print this usage information message'
# should add nw as a possibility for the next option
complete -c emacsclient -s t -l tty			-d 'Open a new Emacs frame on the current terminal'
complete -c emacsclient -s c -l create-frame		-d 'Create a new frame instead existing'
complete -c emacsclient -s r -l reuse-frame		-d 'Create a new frame if none exists'
complete -c emacsclient -s F -l frame-parameters -r	-d 'Set the parameters of a new frame'
complete -c emacsclient -s e -l eval			-d 'Evaluate the FILE arguments as ELisp expressions'
complete -c emacsclient -s n -l no-wait			-d "Don't wait for the server to return"
complete -c emacsclient -s w -l timeout	-r		-d 'Seconds to wait before timing out'
complete -c emacsclient -s q -l quiet			-d "Don't display messages on success"
complete -c emacsclient -s u -l suppress-output		-d "Don't display return values from the server"

complete -c emacsclient -s d -l display	-r		-d "Visit the file in the given display"
complete -c emacsclient      -l parent-id -r		-d "Open in parent window ID, via XEmbed"
complete -c emacsclient -s s -l socket-name -r		-d "Set filename of the UNIX socket for communication"
complete -c emacsclient -s f -l server-file -r		-d 'Set filename of the TCP authentication file'
complete -c emacsclient -s a -l altearnate-editor -r	-d 'Editor to fallback to if the server is not running'
complete -c emacsclient -s T -l tramp -r		-d 'PREFIX to prepend to filenames sent by emacsclient'

