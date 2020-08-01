# Initializaes wal for chunkwm, etc
function pywal {
    # generate color scheme from current wallpaper
    current_wallpaper="$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')"
    wal -i $current_wallpaper -n
}
