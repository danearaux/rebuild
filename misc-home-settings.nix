{ config, lib, pkgs, ... }:
{
  home.username = "dane";

  home.homeDirectory = "/home/dane";

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
 
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  nix.settings.allow-import-from-derivation = true;
}
