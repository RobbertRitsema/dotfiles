export NUXT_TELEMETRY_DISABLED=1
export MANWIDTH=90
export HISTSIZE=10000
export SAVEHIST=10000

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
    export CLUTTER_BACKEND=wayland
fi
