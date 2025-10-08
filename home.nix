{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  home.stateVersion = "25.11";

  imports = [
    ./Modules/waybar.nix
    ./Modules/alacritty.nix
    ./Modules/tmux.nix
    ./Modules/packages.nix
    ./Modules/hyprland.nix
    ./Modules/home-manager.nix
    ./Modules/neovim.nix
    ./Modules/modern-coreutils.nix
    ./Modules/direnv.nix
    ./Modules/starship.nix
    ./Modules/misc-home-settings.nix
    ./Modules/hyprlock.nix
    ./Modules/hypridle.nix
    ./Modules/env.nix
    ./Modules/kitty.nix
  ];
}
