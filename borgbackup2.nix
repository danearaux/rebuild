# This is your main /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/Modules/borgbackup.nix  # <-- This line imports the 1st/main module
    ];

  # ... other system configurations go here ...

  # This section USES the module
  services.myBorgbackup = {
    enable = true;
    user = "dane";
    sshKeyPath = /home/dane/.ssh/id_ed25519;
    repoUrl = "ssh://danearaux@pm.me/etc/nixos/backups";

    jobs = {
      "etc-dane" = {
        paths = "/etc/nixos";
        extraExcludes = [ "backups" ];
      };
      # ... other jobs
    };
  };
}
