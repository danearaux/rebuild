{ config, pkgs, ... }:
{ 
  environment.etc."wayland-sessions/hyprland-uwsm.desktop".text ="
  [Desktop Entry]
  Name=Hyprland(uwsm)
  Comment=Hyprland compositor managed by uwsm
  Exec=uwsm start hyprland
  Type=Application
  ";
}
