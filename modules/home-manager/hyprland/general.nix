{ inputs, ... }:

{
  wayland.windowManager.hyprland = {
    general = {
      # gaps and borders
      gaps_in = "4";
      gaps_out = "5";
      gaps_workspaces = "50";
      border_size = "1";

      # fallback colors
      col.active_border = "rgba(0DB7D4FF)";
      col.inactive_border = "rgba(0DB7D4FF)";

      resize_on_border = "true";
      no_focus_fallbacl = "true";
      layout = "dwindle";

      allow_tearing = "true"; # allows the 'immediate' window rule
    };

    windle = {
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
      col.shadow = "rgba(0000002A)";

      # Dimming
      dim_inactive = "false";
      dim_strength = "0.1";
      dim_special = "0";
    };
  };
}
