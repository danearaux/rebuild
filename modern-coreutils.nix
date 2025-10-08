{ config, lib, pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      theme = "Dracula"; # Try 'GitHub', 'Sublime Snazzy', 'Dracula' and '1337'
      pager = "less -FR";
    };
  };

  programs.ripgrep = {
    enable = true;
  };
}
