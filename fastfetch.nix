{ pkgs, ...}:
{
  programs.fastfetch = {
    enable = true;
    extraConfig = ''
      [network]
      interface=wlo1
      mac=true
      ip=false

      [custom]
      title=Public IP
      command=curl -s https://ifconfig.me
    '';
  };
}
