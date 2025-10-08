{ config, lib, pkgs, ... }:
{  
  boot.kernel.sysctl."net.ipv6.conf.wlo1.disable_ipv6" = true; 
  #-----------------------------------------------------------
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowPing = false;
    allowedTCPPorts = [ 888 ]; # Add e.g. 22 if you need SSH
    allowedUDPPorts = [ ]; 
    checkReversePath = "strict"; # Anti-spoofing
    rejectPackets = false; # Switch to false for stealth
  };

  services.opensnitch = {
    enable = true;
    rules = {
      systemd-timesyncd = {
        name = "systemd-timesyncd";
        enabled = true;
        action = "allow";
        duration = "always";
        operator = {
          type = "simple";
          sensitive = false;
          operand = "process.path";
          data = "${lib.getBin pkgs.systemd}/lib/systemd/systemd-timesyncd";
        };
      };
      systemd-resolved = {
        name = "systemd-resolved";
        enabled = true;
        action = "allow";
        duration = "always";
        operator = {
          type = "simple";
          sensitive = false;
          operand = "process.path";
          data = "${lib.getBin pkgs.systemd}/lib/systemd/systemd-resolved";
        };
      };
    };
  };

  systemd.services.opensnitchd.serviceConfig.Restart = "always";
}

