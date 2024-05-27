{ inputs, pkgs, ... }:

#let
#  hyprlandConfigLocation = ./;
#  cLoc = hyprlandConfigLocation;
#in
{
  #imports = 
  #  [
  #    "${cLoc}/hyprland/general.nix" 
  #  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    settings = {
      # set up environment variables
      env = 
        [
          "LIBVA_DRIVER_NAME,nvidia"
          "XDG_SESSION_TYPE,wayland"
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "ELECTRON_OZONE_PLATFORM_HINT,auto"
        ];

      # set up keyboard and mouse
      input = {
        kb_layout = "de";
        ## set up cursor
        #cursor = {
        #  no_hardware_cursors = true;
        #};
      };

      # set up monitors
      "$mon1" = "DP-2";
      "$mon0" = "DP-3";
      monitor =
        [
          "$mon0, 1920x1080@144, 0x0, 1"
          "$mon1, 1920x1080@60, 1920x0, 1"
        ];
      # assign workspaces 1-5 to $mon0 and 6-10 to $mon1
      workspace = (
        builtins.concatLists (
          builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in 
              [
                "${ws}, monitor:${if x < 5 then "$mon0" else "$mon1"}"
              ]
          )
        10)
      );

      # set up bindings
      "$mod" = "SUPER";
      "$term" = "alacritty";
      "$browser" = "floorp";
      "$explorer" = "dolphin";
      "$menu" = "killall wofi & wofi --show drun";
      bind =
        [
          # exit Hyprland
          "$mod SHIFT, m, exit"
          
          # window controls
          "$mod, q, killactive"
          "$mod, f, fullscreen, 0"
          "$mod, d, fullscreen, 1"
          "$mod, v, togglefloating"
          "$mod, Minus, splitratio, -0.1"
          "$mod, Comma, splitratio, -0.1"
          "$mod, Plus, splitratio, 0.1"
          "$mod, Colon, splitratio, 0.1"

          # movement
          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"

          # app bindings
          "$mod, return, exec, $term"
          "$mod, b, exec, $browser"
          "$mod, e, exec, $explorer"
          "$mod, space, exec, $menu"

          # utils
          "$mod SHIFT, s, exec, grimblast --notify --cursor --freeze copysave area"
          "$mod SHIFT ALT, s, exec, grimblast --notify --cursor --freeze copysave screen"

          # workspaces
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"
          
          # scratchpad
          "$mod, y, togglespecialworkspace, magic"
          "$mod SHIFT, y, movetoworkspace, special:magic"
        ]
        ++ (
          # workspaces
          # binds $mod + 1..10 to switching workspaces
          # also binds $mod + SHIFT + 1..10 to moving windows to workspaces
          builtins.concatLists (
            builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
          10)
      );
      # media controls
      bindl =
        [
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioPlay, exec, playerctl play-pause"
          ",XF86AudioNext, exec, playerctl next"
          ",XF86AudioPrev, exec, playerctl previous"
        ];
      bindle =
        [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          "SHIFT, XF86AudioRaiseVolume, exec, playerctl volume 0.05+"
          "SHIFT, XF86AudioLowerVolume, exec, playerctl volume 0.05-"
        ];


      bindm =
        [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

      general = {
        # gaps and borders
        gaps_in = "4";
        gaps_out = "5";
        gaps_workspaces = "50";
        border_size = "1";

        # fallback colors
        "col.active_border" = "rgba(0DB7D4FF)";
        "col.inactive_border" = "rgba(0DB7D4FF)";

        resize_on_border = "true";
        no_focus_fallback = "true";
        layout = "dwindle";

        allow_tearing = "true"; # allows the 'immediate' window rule
      };

      dwindle = {
        preserve_split = "true";
        smart_split = "false";
        smart_resizing = "false";
      };

      decoration = {
        rounding = "20";

        blur = {
          enabled = "true";
          xray = "true";
          special = "false";
          new_optimizations = "true";
          size = "7";
          passes = "4";
          brightness = "1";
          noise = "0.01";
          contrast = "1";
          popups = "true";
          popups_ignorealpha = "0.6";
        };

        # shadow options
        drop_shadow = "true";
        shadow_ignore_window = "true";
        shadow_range = "20";
        shadow_offset = "0 2";
        shadow_render_power = "4";
        "col.shadow" = "rgba(0000002A)";

        # Dimming
        dim_inactive = "false";
        dim_strength = "0.1";
        dim_special = "0";
      };
    };
  };
}
