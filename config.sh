case "$1" in
    "-a")
        if [[ -z "$2" ]]; then
            echo "ERROR 01: You need to specify a file, when you wan't to use \"-a\""
        elif [[ "$2" =~ \/?[a-zA-Z0-9]*\/? ]]; then
            if [[ -z "$3" ]]; then
                if [[ "$2" =~ \/?[a-zA-Z0-9]*\.[
                
        fi
        ;;
    "zsh")
        vim  ~/.config/zsh/zshrc
        ;;
    "i3")
        vim ~/.config/i3/config
        ;;
    "vim")
        vim ~/.config/vim/vimrc
        ;;
esac

# \t"$2")\n\t\tvim $2
