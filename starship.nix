{ config, pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    # Configure Starship settings using Nix attribute sets
    settings = {
      # Add a blank line between shell prompts
      add_newline = true;

      # Character module configuration
      character = {
        success_symbol = "[ λ ](bold #FFDBBB)";
        error_symbol = "[ λ ](bold red)";
      };

      # Disable the package module
      package.disabled = true;

      # Example of configuring another module, e.g., directory
      directory = {
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = true;
        home_symbol = "~";
      };

      # You can also import existing TOML presets and merge your custom settings
      # settings = lib.mkMerge [
      #   (builtins.fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/nerd-font-symbols.toml"))
      #   {
      #     # Your custom configurations here, which will override or extend the preset
      #     os.disabled = false;
      #   }
      # ];
    };
  };
}
