{ config, lib, pkgs, ... }:
{
  # security.doas.enable = false;
  #   users = [ "dane" ];
  #   keepEnv = true;
  # };
  security.sudo.enable = false;

  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = true;
    execWheelOnly = true;
    extraConfig = ''
      Defaults timestamp_timeout=5
    '';
  };
}

