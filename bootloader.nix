{ config, lib, pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    efiInstallAsRemovable = false; # look up what this is?
  };
  boot.loader.efi.canTouchEfiVariables = true;
}
