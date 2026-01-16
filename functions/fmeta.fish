function fmeta -d "Search fish-finders functions and run selected"
    printf "%s\t%s\n" \
        fabbr   "Search fish abbreviations" \
        fbranch "Search git branches" \
        fenv    "Search environment variables" \
        fif     "Search pattern in files" \
        fkill   "Search a process to kill" \
        fmeta   "Search fish-finders functions and run selected" \
        fport   "Search a listening port" \
        fssh    "Search an ssh host" \
    | column -ts \t | fzf -1 -0 $FZF_CUSTOM_OPTIONS | read -l selection
    or return 1

    set -l cmd (string match -r '^\S+' $selection)
    if test "$cmd" = "fif"
        read -P "fif regex: " -l regex
        test -n "$regex" && commandline -r "fif $regex"
    else
        commandline -r $cmd
    end
    commandline -f execute
end
