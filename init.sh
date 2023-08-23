#!/bin/bash

# Pull in utils
source ./install_util.sh

### Declarations
CONF=~/.config
now=$(date +"%m-%d-%y-%H:%M")
BACKUP_ARCHIVE="${CONF}/backup_${now}.zip"
INSTALL=false

### Handle install vs update
shift # remove prog. name
if [ $# -gt 0 ] ; then
    for arg in "$@"
    do
        case "$arg" in 
            --install | -i) 
                INSTALL=true
                ;;
            --help | -h)
                print_usage
                ;;
            *)
                printf "Unsupported argument: %s" "$arg"
                print_usage
                ;;
        esac
    done
fi

echo "Starting init.sh. Bootstrapping your machine since [Now]!"

### OS Check
machine="$(uname -s)"
case "${machine}" in
    Linux*)     OS=Linux;;
    Darwin*)    OS=Darwin;;
    CYGWIN*)    OS=Cygwin;;
    MINGW*)     OS=MinGw;;
    *)          OS=machine;;
esac

echo "Detected Operating System: ${OS}"

### Handle backup
zip "$BACKUP_ARCHIVE" "$CONF"  -q
if [ -d "$CONF/$BK" ] ; then
    echo "Backed up $BACKUP_ARCHIVE to $CONF"
else 
    echo "Unable to backup $CONF to $BACKUP_ARCHIVE"
    exit 1
fi

### Handle install
if "$INSTALL" ; then
    echo "Installing dependencies..."
    
    # Homebrew
    if [ "$(command -v brew)" ] ; then 
        echo "Installing homebrew dependencies..." 
        brew bundle install --file ./brew/BBrewfile
        brew update & brew upgrade && brew cleanup --prune=all -s && brew autoremove
    fi

    echo "Installation complete..."
else
    echo "Skipping dependency installation..."
fi

### Handle .config updates
echo "Updating config dir @ $CONF ..."
cp -r ./brew       $CONF
cp -r ./zsh        $CONF
cp -r ./kitty      $CONF
cp -r ./yabai      $CONF
cp -r ./skhd       $CONF
cp -r ./vim        $CONF
cp -r ./tmux       $CONF
cp -r ./starship   $CONF
cp -r ./wallpaper  $CONF

echo "Overwriting config files"
cp $CONF/vim/.vimrc ~/.vimrc
cp $CONF/zsh/.zshrc ~/.zshrc

### Handle links
echo "Updating symlinks..."

# Wallpaper
ln -sf "$CONF/wallpaper" ./wallpaper

# zsh + zplug
[ "$(command -v zplug)"  ] && ln -sf $CONF/zsh/.zshrc ~/.zshrc || echo "Note: zPlug not found. Skipping linking $CONF/zsh/zshrc.plug to ~/.zshrc"

# yabai
[ "$(command -v yabai)" ] && ln -sf $CONF/yabai/.yabairc ~/.yabairc || echo "Note: yabai not found. Skipping linking $CONF/yabai/.yabairc to ~/.yabairc"

# vim + nvim
[ "$(command -v nvim)" ] && ln -sf $CONF/vim $CONF/nvim || echo "Note: nvim not found. Skipping linking $CONF/vim to $CONF/nvim"

### 
