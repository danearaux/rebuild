{ config, lib, pkgs, ... }:
{
  services.tor = {
    enable = true;
    #openFirewall = true;
  };
}
