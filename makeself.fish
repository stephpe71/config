# -*- fish -*-
#
# Fish completions for gnuplot ...
#
# This file is in the Public Domain
# written by Stephane Perrot (2024)
#
complete -e makeself

# Usage: /usr/local/bin/makeself [args] archive_dir file_name label startup_script [script_args]
# args can be one or more of the following :
complete -c makeself -s v -l version		-d 'Display version'
complete -c makeself -s h -l help		-d 'Display help'

# -x : alias for -r and -f
# -f : no-files
# -r : this completion must have argument
# by using "(  ... )" syntax, command call is defered...
# + complete -x -c su -d "Username" -a "(cat /etc/passwd | cut -d : -f 1)"

complete -c makeself -l tar-quietly	-d "Suppress verbose output from the tar command"
complete -c makeself -l quiet -s q	-d "Do not print any messages other than errors."
complete -c makeself -l gzip		-d "Compress using gzip (default if detected)"
complete -c makeself -l pigz		-d "Compress with pigz"
complete -c makeself -l zstd		-d "Compress with zstd"
complete -c makeself -l bzip2		-d "Compress using bzip2 instead of gzip"
complete -c makeself -l pbzip2		-d "Compress using pbzip2 instead of gzip"
complete -c makeself -l bzip3		-d "Compress using bzip3 instead of gzip"
complete -c makeself -l xz		-d "Compress using xz instead of gzip"
complete -c makeself -l lzo		-d "Compress using lzop instead of gzip"
complete -c makeself -l lz4		-d "Compress using lz4 instead of gzip"
complete -c makeself -l compress	-d "Compress using the UNIX 'compress' command"
complete -c makeself -l threads -x -a "(seq 1 8)" -d "Number of threads to be used by compressors that support parallelization."
complete -c makeself -l base64		-d "Instead of compressing, encode the data using base64"
complete -c makeself -l gpg-encrypt	-d "Instead of compressing, encrypt the data using GPG"
complete -c makeself -l gpg-asymmetric-encrypt-sign	-d "Instead of compressing, asymmetrically encrypt and sign the data using GPG"
complete -c makeself -l gpg-extra	-d "Append more options to the gpg command line"
complete -c makeself -l ssl-encrypt	-d "Instead of compressing, encrypt the data using OpenSSL"
complete -c makeself -l ssl-passwd -x	-d "Use the given password to encrypt the data using OpenSSL"
complete -c makeself -l ssl-pass-src -x -d "Use the given src as the source of password to encrypt the data"
complete -c makeself -l ssl-no-md	-d "Do not use '-md' option not supported by older OpenSSL."
complete -c makeself -l nochown		-d "Do not give the target folder to the current user (default)"
complete -c makeself -l chown		-d "Give the target folder to the current user recursively"
complete -c makeself -l nocomp		-d "Do not compress the data"
complete -c makeself -l notemp		-d "The archive will create archive_dir in the current directory"
complete -c makeself -l needroot	-d "Check that the root user is extracting the archive before proceeding"
complete -c makeself -l copy		-d "the archive will first copy itself to a temp directory"
complete -c makeself -l append		-d "Append more files to an existing Makeself archive"
complete -c makeself -l target		-d "Extract directly to a target directory"
complete -c makeself -l current		-d "Files will be extracted to the current directory"
complete -c makeself -l nooverwrite	-d "Do not extract the archive if the specified target directory exists"
complete -c makeself -l tar-format -x	-d "Specify a tar archive format (default is ustar)"
complete -c makeself -l tar-extra -x	-d "Append more options to the tar command line"
complete -c makeself -l untar-extra -x	-d "Append more options to the during the extraction of the tar archive"
complete -c makeself -l nomd5		-d "Don't calculate an MD5 for archive"
complete -c makeself -l nocrc		-d "Don't calculate a CRC for archive"
complete -c makeself -l sha256		-d "Compute a SHA256 checksum for the archive"
complete -c makeself -l header -x	-d "Specify location of the header script"
complete -c makeself -l cleanup -x	-d "Specify a cleanup script that executes on interrupt and when finished successfully."
complete -c makeself -l follow		-d "Follow the symlinks in the archive"
complete -c makeself -l noprogress	-d "Do not show the progress during the decompression"
complete -c makeself -l nox11		-d "Disable automatic spawn of a xterm"
complete -c makeself -l nowait		-d "Do not wait for user input after executing embedded"
complete -c makeself -l sign -x		-d "Signature private key to sign the package with"
complete -c makeself -l lsm -x		-d "LSM file describing the package"
complete -c makeself -l license -x	-d "Append a license file"
complete -c makeself -l help-header -x	-d "Add a header to the archive's --help output"
complete -c makeself -l packaging-date -x -d "Use provided string as the packaging date"
complete -c makeself -l keep-umask	-d "Keep the umask set to shell default."
complete -c makeself -l export-conf	-d "Export configuration variables to startup_script"
!
