{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        ",/home/dane/Downloads/lichess-wallpaper.png"
      ];

      wallpaper = [
        ",/home/dane/Downloads/lichess-wallpaper.png"
      ];
    };
  };
}
