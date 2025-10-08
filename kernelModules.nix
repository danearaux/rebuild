{ config, pkgs, ... }:
{
  boot.kernelModules = [
    "kvm-intel" # Essential for kernel virtualization. (opposed to "kvm-amd")
    "fuse" # Restrict the fuse group: "sudo usermod -aG fuse dane"
    "coretemp"
  ];
}

# This module is being sourced in configuration.nix.

# If the module is required early during the boot (e.g. to mount the root file system), you can use boot.initrd.kernelModules.
