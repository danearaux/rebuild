{
  description = "My NixOS and Home Manager flake";

  inputs = {
    # nix-snapd ~ snap pkg manager and more...
    nix-snapd.url = "github:nix-community/nix-snapd";
    nix-snapd.inputs.nixpkgs.follows = "nixpkgs";

    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hyprland and utilities
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-protocols.url = "github:hyprwm/hyprland-protocols";
    hyprland-contrib.url = "github:hyprwm/contrib";

    # flake-parts, fh and other flake utilities
    flake-parts.url = "github:hercules-ci/flake-parts";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*";
    fh.inputs.nixpkgs.follows = "nixpkgs";

    # code formatters
    alejandra.url = "github:kamadorueda/alejandra";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    home-manager,
    alejandra,
    hyprland,
    hyprland-plugins,
    hyprland-protocols,
    hyprland-contrib,
    fh,
    nix-snapd,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          buildInputs =
            [
            ]
            ++ (import ./Modules/devshellpkgs.nix {inherit pkgs;});
        };
      };

      flake = {
        nixosConfigurations."tzedeq" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs;};
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager # you can put these modules in
            {
              # your configuration.nix, btw.
              home-manager.useGlobalPkgs = true; # (like snapd)
              home-manager.useUserPackages = true;
              home-manager.users."dane" = {
                imports = [
                  ./home.nix
                ];
              };
            }
          ];
        };
      };
    };
}
