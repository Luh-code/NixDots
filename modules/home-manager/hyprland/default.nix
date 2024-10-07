{ inputs, pkgs, lib, config, ... }:

#let
#  hyprlandConfigLocation = ./;
#  cLoc = hyprlandConfigLocation;
#in
let
  base0FColor = config.stylix.base16Scheme.base0F;
in
{
  #imports = 
  #  [
  #    "${cLoc}/hyprland/general.nix" 
  #  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    settings = { 
      debug.disable_logs = "false";
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
        kb_layout = "us";
        accel_profile = "flat";
        ## set up cursor
      };
      cursor = {
        no_hardware_cursors = "true";
      };

      misc = {
        disable_hyprland_logo = "true";
      };

      exec-once = 
        [
          "sleep 5 ; swww-daemon"
          #"swww img ${pkgs.stylix.image}"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        ];

      # set up monitors
      "$mon0" = "DP-3";
      "$mon1" = "DP-4";
      monitor =
        [
          "$mon0, 1920x1080@144, 0x0, 1"
          "$mon1, 1920x1080@60, 1920x0, 1"
        ];
      # assign workspaces 1-5 to $mon0 and 6-10 to $mon1
      workspace = (
        builtins.concatLists (
          builtins.genList (
            x:
            let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in 
              [
                #"${if ws == 10 then builtins.toString (0) else builtins.toString (ws)}, monitor:${if x < 5 then "$mon0" else "$mon1"}"
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
      #"$menu" = "killall .wofi-wrapped & wofi --show drun";
      "$menu" = "killall wofi || wofi --show drun";
      "$fsm" = "bash ~/.config/eww/dashboard/launch_dashboard";
      bind =
        [
          # hyprland controls
          "$mod SHIFT, m, exit"
          "$mod SHIFT, r, exec, hyprctl reload; notify-send \"Hyprland Reloaded!\""
          
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
          "$mod SHIFT, space, exec, $fsm"

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
          "$mod, down, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          "$mod, up, exec, playerctl play-pause"
          "$mod, right, exec, playerctl next"
          "$mod, left, exec, playerctl previous"
        ];
      bindle =
        [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          "SHIFT, XF86AudioRaiseVolume, exec, playerctl volume 0.05+"
          "SHIFT, XF86AudioLowerVolume, exec, playerctl volume 0.05-"
          "$mod, home, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          "$mod, delete, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
          "$mod SHIFT, home, exec, playerctl volume 0.05+"
          "$mod SHIFT, delete, exec, playerctl volume 0.05-"
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
        #"col.active_border" = lib.mkForce "rgb(${toString base0FColor})";
        "col.active_border" = lib.mkForce "rgba(525252FF)";
        "col.inactive_border" = lib.mkForce "rgba(0000002A)";

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

      bezier = [
        "funk,.32,1.06,0,.99"
      ];

      animation = [
        "workspaces,1,7,funk,slidefade 0%"
        "windows,1,7,funk,slide"
        "fade,1,7,funk"
        "border,1,2,funk"
        "borderangle,1,2,funk"
        "layersIn,1,7,funk,slide top"
        "layersOut,1,7,funk,slide bottom"
      ];

      decoration = {
        rounding = "15";

        blur = {
          enabled = "true";
          xray = "true";
          special = "false";
          new_optimizations = "true";
          size = "2";
          passes = "2";
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
        "col.shadow" = lib.mkForce"rgba(0000002A)";

        # Dimming
        dim_inactive = "true";
        dim_strength = "0.1";
        dim_special = "0";
      };

      windowrulev2 = 
        [
        ];
    };
  };
}
