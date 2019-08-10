# Initializaes wal for chunkwm, etc
function pywal {
    # ensure that the template file is available
    echo "FOCUS=0xff{color2}" > ~/.config/wal/templates/chunkwmcolors
    echo "PRESE=0xff{color1}" >> ~/.config/wal/templates/chunkwmcolors

    # generate color scheme from current wallpaper
    current_wallpaper="$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')"
    wal -i $current_wallpaper -n
}
