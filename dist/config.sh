
{ [[ ! -f /etc/systemd/zram-generator.conf ]] && echo -e "[zram0]\nzram-size = ram * 0.6\ncompression-algorithm = zstd\nswap-priority = 100\nfs-type = swap" | sudo tee /etc/systemd/zram-generator.conf || true; }
sudo systemctl daemon-reload && sudo usermod -aG video,audio,lp,scanner "$(logname)"
{ [[ "$IS_LAPTOP" == "1" ]] && sudo systemctl enable tlp; }
{ [[ "$IS_LAPTOP" == "1" && "$CPU_VENDOR" =~ "GenuineIntel" ]] && sudo systemctl enable thermald; }
sudo systemctl enable lightdm bluetooth NetworkManager
sudo -u "$USER0" systemctl --user enable --now pipewire pipewire-pulse wireplumber
