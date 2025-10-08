{ config, lib, pkgs, ... }:
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    allowed-users = [ "@wheel" ];
    trusted-users = ["root" "dane"];
  };

  nixpkgs.config.allowUnfree = true;
}
