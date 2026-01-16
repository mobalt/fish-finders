function __fish_finders_install --on-event fish_finders_install
    read -P "Set up shortcut key for fmeta? [Y/n] " -l setup_key
    if test -z "$setup_key" -o "$setup_key" = "y" -o "$setup_key" = "Y"
        read -P "Shortcut key [Ctrl+f]: " -l key
        test -z "$key" && set key "Ctrl+f"
        set -l letter (string lower (string sub -s -1 $key))
        set -U __fish_finders_key $letter
        switch $letter
            case a; bind \ca fmeta
            case b; bind \cb fmeta
            case f; bind \cf fmeta
            case g; bind \cg fmeta
            case o; bind \co fmeta
            case p; bind \cp fmeta
            case y; bind \cy fmeta
            case '*'; set letter f; set -U __fish_finders_key f; bind \cf fmeta
        end
        echo "Bound Ctrl+$letter to fmeta"
    end
end

function __fish_finders_uninstall --on-event fish_finders_uninstall
    functions --erase fbranch
    functions --erase fabbr
    functions --erase fenv
    functions --erase fif
    functions --erase fkill
    functions --erase fpid
    functions --erase fport
    functions --erase fssh
    functions --erase fmeta
    if set -q __fish_finders_key
        switch $__fish_finders_key
            case a; bind -e \ca
            case b; bind -e \cb
            case f; bind -e \cf
            case g; bind -e \cg
            case o; bind -e \co
            case p; bind -e \cp
            case y; bind -e \cy
        end
        set -e __fish_finders_key
    end
end

# Restore binding on shell startup if previously configured
if set -q __fish_finders_key
    switch $__fish_finders_key
        case a; bind \ca fmeta
        case b; bind \cb fmeta
        case f; bind \cf fmeta
        case g; bind \cg fmeta
        case o; bind \co fmeta
        case p; bind \cp fmeta
        case y; bind \cy fmeta
    end
end
