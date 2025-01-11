{ pkgs, lib, ... }:

{
  imports = [
    ./plugins/plugins.nix
  ];

  vim = {
    theme = {
      enable = true;
      #name = "base16";
      style = "dark";
    };

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      rust.enable = true;
      nix.enable = true;
      sql.enable = true;
      clang.enable = true;
      ts.enable = true;
      python.enable = true;
      zig.enable = true;
      markdown.enable = true;
      html.enable = true;
      dart.enable = true;
      go.enable = true;
      lua.enable = true;
      php.enable = true;
    };
  };
}
