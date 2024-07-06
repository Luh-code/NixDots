{ inputs, pkgs, lib, config, ... }:

let
  home-manager-modules-path = ./../../modules/home-manager;
  hmmp = home-manager-modules-path;

  hyprland = import "${hmmp}/hyprland/default.nix";
in
{
  mon0 = "DP-3";
  mon1 = "DP-4";

  monitors = 
    [
      "${mon0}, 1920x1080@144, 0x0, 1"
      "${mon1}, 1920x1080@60, 1920x0, 1"
    ];

  workspaces = (
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
                "${ws}, monitor:${if x < 5 then "${mon0}" else "${mon1}"}"
              ]
          )
        10)
      );

  bindExtra = 
(
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

  hyprland.mkHyprConfig monitors workspaces bindExtra;
}
