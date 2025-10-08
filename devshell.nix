{ pkgs, system, ... }:
{
  perSystem = { pkgs, system, ... }: {
    devShells.default = import /etc/nixos/Modules/devshell.nix { inherit pkgs system; };
    packages = import /etc/nixos/Modules/devshellpkgs.nix { inherit pkgs system; };
  };
}
