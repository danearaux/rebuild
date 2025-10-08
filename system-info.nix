{ config, lib, pkgs, ... }:
{
  networking.hostName = "tzedeq";
  time.timeZone = "America/Phoenix";
  i18n.defaultLocale = "en_US.UTF-8";
}
