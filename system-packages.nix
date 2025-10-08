{ config, lib, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # example: inputs.nix-software-center.packages.${system}.nix-software-center
    inputs.hyprland-contrib.packages.${system}.grimblast
    # -- Begin -- (grimblast prerequisites) 
    grim
    slurp
    hyprpicker
    wl-clipboard
    jq
    libnotify
    # -- End -- 
    
    gradience #-For editing the uneditable (nautilus.)
    gtk-engine-murrine #-Same as above...
    nautilus
    gimp
    tailscale
    firefox
    brave
    tor
    tor-browser-bundle-bin
    home-manager
    uwsm
    sudo-rs
    opensnitch-ui
    alacritty
    kitty
    foot
    ghostty
    macchanger
    wireguard-tools
    openvpn
    tailscale
    opensnitch
    opensnitch-ui
    networkmanager
    dhcpcd
    lsof
    nmap
    iproute2
    gping
    dnsmasq
    upower
    tlp
    bluez
    blueman
    wget
    curl
    xh
    sudo-rs
    wl-clipboard-rs
    cliphist
    fastfetch
    pipewire
    wireplumber
    pavucontrol
    pkg-config
    libnotify
    # Below: System Backup Utilities
    btrfs-progs
    snapper
    rsync
    borgbackup
    psmisc
    # -- End --
    sysstat
    ansible
  ];

  nixpkgs.config.allowUnfree = true;
}
