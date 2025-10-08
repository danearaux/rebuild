{ config, lib, pkgs, ... }:
{
  programs.waybar = 
  {
    enable = true;
  };

  xdg.configFile."waybar".source =
    builtins.path { path = "/home/dane/dotfiles/waybar"; };
}

