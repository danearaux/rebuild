{ config, pkgs, ... }:
{
  home.sessionVariables = {
    TERMINAL = "alacritty";
    EDITOR = "neovim";
    BROWSER = "firefox";
    FILE_MANAGER = "nautilus";
    SHELL = "/run/current-system/sw/bin/fish";
    # GTK_THEME = "";
    XDG_SESSION_TYPE = "wayland";
    PATH = "$HOME/.local/bin:${config.home.profileDirectory}/bin:$PATH";
    LANG = "en_US.UTF-8";
  };
}

