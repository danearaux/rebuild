{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
            general {
              border_size = 1
              col.active_border = rgba(ffffffff) #313244cc (surface)
              col.inactive_border = rgba(ffffffff)
            }

      #https://wiki.hypr.land/Configuring/Variables/#decoration
            decoration {
              rounding = 2

      #Change transparency of focused and unfocused windows
              active_opacity = 0.9
              inactive_opacity = 0.9

              shadow {
                enabled = true
                range = 3
                render_power = 2
                color = rgba(ffffffcc)
              }

      #https://wiki.hypr.land/Configuring/Variables/#blur
              blur {
                enabled = true
                size = 5 #3
                passes = 3 #1
                vibrancy = 0.1696
              }
            }
      #https://wiki.hypr.land/Configuring/Variables/#animations
            animations {
              enabled = yes

      #Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
      #        NAME,           X0,   Y0,   X1,   Y1
              bezier = easeOutQuint,   0.23, 1,    0.32, 1
              bezier = easeInOutCubic, 0.65, 0.05, 0.36, 1
              bezier = linear,         0,    0,    1,    1
              bezier = almostLinear,   0.5,  0.5,  0.75, 1
              bezier = quick,          0.15, 0,    0.1,  1

      #Default animations, see https://wiki.hypr.land/Configuring/Animations/
      #           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
              animation = global,        1,     10,    default
              animation = border,        1,     5.39,  easeOutQuint
              animation = windows,       1,     4.79,  easeOutQuint
              animation = windowsIn,     1,     4.1,   easeOutQuint, popin 87%
              animation = windowsOut,    1,     1.49,  linear,       popin 87%
              animation = fadeIn,        1,     1.73,  almostLinear
              animation = fadeOut,       1,     1.46,  almostLinear
              animation = fade,          1,     3.03,  quick
              animation = layers,        1,     3.81,  easeOutQuint
              animation = layersIn,      1,     4,     easeOutQuint, fade
              animation = layersOut,     1,     1.5,   linear,       fade
              animation = fadeLayersIn,  1,     1.79,  almostLinear
              animation = fadeLayersOut, 1,     1.39,  almostLinear
              animation = workspaces,    1,     1.94,  almostLinear, fade
              animation = workspacesIn,  1,     1.21,  almostLinear, fade
              animation = workspacesOut, 1,     1.94,  almostLinear, fade
              animation = zoomFactor,    1,     7,     quick
            }

            # Ref https://wiki.hypr.land/Configuring/Workspace-Rules/
            # "Smart gaps" / "No gaps when only"
            # uncomment all if you wish to use that.
            # workspace = w[tv1], gapsout:0, gapsin:0
            # workspace = f[1], gapsout:0, gapsin:0
            # windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
            # windowrule = rounding 0, floating:0, onworkspace:w[tv1]
            # windowrule = bordersize 0, floating:0, onworkspace:f[1]
            # windowrule = rounding 0, floating:0, onworkspace:f[1]

            # See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
            dwindle {
              pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
              preserve_split = true # You probably want this
            }

      #############
      ### INPUT ###
      #############

      # https://wiki.hypr.land/Configuring/Variables/#input
            input {
              kb_layout = us
              kb_variant =
              kb_model =
              kb_options =
              kb_rules =

              follow_mouse = 1

              sensitivity = 0.5 # -1.0 - 1.0, 0 means no modification.

              touchpad {
                natural_scroll = false
              }
            }
            # See https://wiki.hypr.land/Configuring/Master-Layout/ for more
            # See https://wiki.hypr.land/Configuring/Master-Layout/ for more
            master {
              new_status = master
            }

            monitor=,preferred,auto,auto


      ###################
      ### MY PROGRAMS ###
      ###################
      # See https://wiki.hypr.land/Configuring/Keywords/

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################
      # See https://wiki.hypr.land/Configuring/Environment-variables/

            env = XCURSOR_SIZE,24
            env = HYPRCURSOR_SIZE,32


      ###################
      ### PERMISSIONS ###
      ###################
      # See https://wiki.hypr.land/Configuring/Permissions/
      # Please note permission changes here require a Hyprland restart and are not applied on-the-fly
      # for security reasons

            ecosystem {
              enforce_permissions = 1
            }


      #####################
      ### LOOK AND FEEL ###
      #####################
      # Refer to https://wiki.hypr.land/Configuring/Variables/

      #Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on

      #https://wiki.hypr.land/Configuring/Variables/#animations

      #See https://wiki.hypr.land/Configuring/Gestures

      #Example per-device config
      #See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more
            device {
              name = triathalon-mouse-0
              sensitivity = 0
            }

      #Laptop multimedia keys for volume and LCD brightness
            bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
            bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
            bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
            bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
            bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

      # Requires playerctl
            bindl = , XF86AudioNext, exec, playerctl next
            bindl = , XF86AudioPause, exec, playerctl play-pause
            bindl = , XF86AudioPlay, exec, playerctl play-pause
            bindl = , XF86AudioPrev, exec, playerctl previous

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      #See https://wiki.hypr.land/Configuring/Window-Rules/ for more
      #See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

      #Ignore maximize requests from apps. You'll probably like this.
            windowrule = suppressevent maximize, class:.*

      #Fixes dragging issues with xwayland
            windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
    '';
    # all color codes are listed in '/etc/nixos/color_codes'
    # pp      rgba(f5c2e7ff)
    # Base    rgba(1e1e2eff)
    # Mantle    rgba(181825ff)
    # Surface0    rgba(313244ff)
    # Blue    rgba(89b4faff)
    # Green    rgba(a6e3a1ff)
    # Red    rgba(f38ba8ff)
    # Peach    rgba(fab387ff)
    # Rosewater    rgba(f5e0dcff)
    plugins = [
      # pkgs.hyprlandPlugins.hyprspace
      # pkgs.hyprlandPlugins.hyprbars
      # pkgs.hyprlandPlugins.hyprfocus
      pkgs.hyprlandPlugins.hyprscrolling
    ];
    settings.env = "GTK_THEME, Dark-Gruvbox";
    settings = {
      # monitor = ",preferred,auto,1"
      exec-once = [
        "waybar"
        "swww-daemon & sleep 1 && swww img ~/Downloads/Pictures/blk-flower.jpg"
        "easyeffects --gapplication-service"
        "hyprcursor"
      ];
      "$mod" = "SUPER";
      bind = [
        "SUPER, P, exec, grimblast save area"
        "SUPER, A, exec, rofi"
        "SUPER, V, exec, neovim"
        "SUPER, F, exec, nautilus"
        "SUPER, T, exec, alacritty"
        "SUPER, R, exec, kitty"
        "SUPER, E, exec, ghostty"
        "SUPER, B, exec, firefox"
        "SUPER, W, togglefloating"
        "SUPER, Q, killactive"
        "SUPER+CTRL, A, exec, easyeffects"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER+ALT, 1, movetoworkspace, 1"
        "SUPER+ALT, 2, movetoworkspace, 2"
        "SUPER+ALT, 3, movetoworkspace, 3"
        "SUPER+ALT, 4, movetoworkspace, 4"
        "SUPER+ALT, 5, movetoworkspace, 5"
        "SUPER+ALT, 6, movetoworkspace, 6"
        "SUPER+ALT, 7, movetoworkspace, 7"
        "SUPER+ALT, 8, movetoworkspace, 8"
        "SUPER+ALT, 9, movetoworkspace, 9"
      ];

      bindm = [
        # Hotkeys to enable mouse interaction with windows..
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
      decoration = {
        rounding = 4;
      };
    };
  };
}
