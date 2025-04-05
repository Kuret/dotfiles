# Dotfiles


## CachyOS Packages

### Gaming
- cachyos-gaming-applications
- cachyos-gaming-meta
- all-ways-egpu-git
- protonup-qt
- killwine
- mesa-git
- lib32-mesa-git
- linux-firmware-git
- amd-ucode-git
- ryzen_smu-dkms-git
- ryzenadj
- vk-hdr-layer-kwin6-git # For enabling HDR with Wine-Wayland
- wine-pure-git # Wine with Wayland, NTSync, WoW64 support
- sc-controller-git

### Other apps
- 1password
- cloudflared
- ctags
- cursor-extracted
- direnv
- git
- git-delta
- github-cli
- inotify-tools
- mailspring (thunderbird?)
- mise
- neovim
- postgresql
- qbittorrent-qt5
- realtime-privileges (+ `sudo gpasswd -a $USER realtime`)
- ripgrep
- ruby, ruby-irb, ruby-rdoc
- scrcpy
- ttf-ligaconsolas-nerd-font
- uad-ng-bin
- usage
- wl-clipboard, xclip
- yt-dlp
- zen-twilight-bin
- zoxide

# Hyprland
- hyprland
- hyprpolkitagent
- xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
- waybar
- hyprpaper
- hypridle
- swaync
- wlogout
- wofi / rofi

Update git packages with `-Syyu --devel`

Heroku CLI: `curl https://cli-assets.heroku.com/install.sh | sh`

## Fixes

### Select eGPU as default
Install `all-ways-egpu`, pick method 2 and 3.
https://github.com/ewagner12/all-ways-egpu

### Black cursor in HDR
In `config/plasma-workspce/env/hdr-cursor-fix.sh` is a fix to force SW rendering. This can introduce latency so disable when fixed in Mesa and/or KDE.

### Random freezes in KDE with AMD GPU
- mesa-git / linux-firmware-git should alleviate this a bit
- Disabling direct scanout might help: https://gitlab.freedesktop.org/drm/amd/-/issues/4025
  - Fix included in `config/plasma-workspace/env/no-direct-scanout.sh`
- Kernel command lines that might help: `pcie_aspm=off split_lock_detect=off amdgpu.dcdebugmask=0x600 amdgpu.mcbp=0 amdgpu.ppfeaturemask=0xfffd7fff`
  - Calculate featuremask value: `printf 'amdgpu.ppfeaturemask=0x%x\n' "$(($(cat /sys/module/amdgpu/parameters/ppfeaturemask) | 0x4000))"`
- The `disable-boost` and `tdp` scripts might help.
- Disable kwin triple buffering
  - `systemctl edit --user plasma-kwin_wayland.service`
  - Add: 
    ```
    [Service]
    Environment="KWIN_DRM_DISABLE_TRIPLE_BUFFERING=1"
    ```

### Fix inverted screen on bootloader
- `video=eDP-1:panel_orientation=upside_down i2c_touchscreen_props=GXTP7380:touchscreen-inverted-x:touchscreen-inverted-y`

### Power management
Default is power-profiles-daemon, might also try:

- Handheld Daemon: `paru -S acpi_call-dkms hhd hhd-ui adjustor; sudo systemctl enable hhd@$(whoami)`
- TLP & TLP-UI
- Auto-CPUFreq & Thermald

### Fix 1Password support in unsupported browsers
https://docs.zen-browser.app/guides/1password

### GPD DUO tips and tricks
- https://www.gpd.hk/gpdduofirmwaredriver
- https://www.oscillator.se/debian-on-the-gpd-duo/

### Useful Arch/CachyOS wiki entries
- https://wiki.archlinux.org/title/HDR_monitor_support
- https://wiki.archlinux.org/title/KDE#Games
- https://wiki.cachyos.org/configuration/general_system_tweaks
- https://wiki.cachyos.org/configuration/gaming


### Windows needed
- Update WD SSD Firmware
- GPD Drivers: https://www.gpd.hk/gpdduofirmwaredriver
