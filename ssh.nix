# Modules/ssh.nix
{ config, lib, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 888 ]; # SSH port

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      ChallengeResponseAuthentication = false;
      KbdInteractiveAuthentication = false;
      X11Forwarding = false;
      AllowTcpForwarding = "no";
      AllowAgentForwarding = "no";
      AllowStreamLocalForwarding = "no";
      MaxAuthTries = 3;
      MaxSessions = 2;
      LoginGraceTime = "20s";
      #UseDNS = false;
      LogLevel = "VERBOSE";
      Compression = "no";
      ClientAliveInterval = 300;
      ClientAliveCountMax = 0;
    };
  };

  systemd.services.sshd.serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    PrivateTmp = true;
    PrivateDevices = true;
    NoNewPrivileges = true;
    MemoryDenyWriteExecute = true;
    RestrictSUIDSGID = true;
    CapabilityBoundingSet = [ "CAP_NET_BIND_SERVICE" ];
    AmbientCapabilities = [ "CAP_NET_BIND_SERVICE" ];
    LockPersonality = true;
  };
  networking.firewall.allowedTCPPorts = config.services.openssh.ports; # ✅ FIXED
}

