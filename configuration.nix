{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  system.stateVersion = "25.05";

  imports = [
    # --- Device & System ---
    ./hardware-configuration.nix
    ./Modules/nix-settings.nix
    ./Modules/system-info.nix
    # --- Cachix ---
    ./cachix.nix
    ./Modules/cachix-user.nix
    # --- System Backup Configurations ---
    ./Modules/borgbackup2.nix
    # --- Additional Repositories ---
    ./Modules/snapd.nix
    # --- System Enabled Packages & Software ---
    ./Modules/system-packages.nix
    ./Modules/android-dev.nix
    # --- Desktop Environments ---
    ./Modules/desktopEnvs.nix
    ./Modules/themes.nix
    # --- Display-Graphics-Gaming ---
    ./Modules/graphics.nix
    ./Modules/nixos-gaming.nix
    ./Modules/displayManager.nix

    # --- Users-Groups-Permissions ---
    ./Modules/users-groups.nix
    ./Modules/sudo.nix
    ./Modules/polkit.nix
    # --- Network-BT-SSH ---
    ./Modules/mosh.nix
    ./Modules/ssh.nix
    ./Modules/tailscale.nix
    ./Modules/networking.nix
    ./Modules/bluetooth.nix
    ./Modules/firewall.nix
    # --- Boot-Kernel ---
    ./Modules/bootloader.nix
    ./Modules/kernelModules.nix
    # --- Shells ---
    ./Modules/fish.nix
    ./Modules/zsh.nix
  ];

  ####################
  # CHOOSE YE SHELL: #
  ####################

  programs = {
    zsh.enable = true;
    fish.enable = false;
  };
}
