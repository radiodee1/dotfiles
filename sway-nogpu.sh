
if [ ! -f /usr/share/wayland-sessions/sway-nogpu.desktop ]; then
    echo "Installing sway-nogpu.desktop wayland-sessions file."
    sudo cp sway-nogpu.desktop /usr/share/wayland-sessions/.
fi
