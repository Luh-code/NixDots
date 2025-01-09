{ pkgs, lib, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "nord";
      style = "dark";
    };

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
      ts.enable = true;
      zig.enable = true;
    };
  };
}
