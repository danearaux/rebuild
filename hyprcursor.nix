{ config, lib, pkgs, ... }:
{
  home.pointerCursor = {
    name = "Catppuccin-Frappe-Rosewater-Cursors";
    package = pkgs.catppuccin-cursors.frappeRosewater;
    size = 45;
  };
}
    
