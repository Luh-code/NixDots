{ inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input = {
        kb_layout = "de";
      };

      "$mod" = "SUPER";
      "$term" = "alacritty";
      "$browser" = "floorp";
      "$explorer" = "dolphin";
      "$menu" = "wofi";
      bind =
        [
          # exit Hyprland
          "$mod, M, exit"
          
          # window controls
          "$mod, q, killactive"

          # movement
          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"

          # app bindings
          "$mod, return, exec, $term"
          "$mod, b, exec, $browser"
          "$mod, e, exec, $explorer"
          "$mod, space, exec $menu"
        ]
        ++ (
          # workspaces
          # binds $mod + 1..10 to switching workspaces
          # also binds $mod + SHIFT + 0..10 to moving windows to workspaces
          builtins.concatLists (
            builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, workspace, ${toString (x + 1)}"
              ]
            )
          10)
        );
    };
  };
}
