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

    vimAlias = true;
    viAlias = true;

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp = {
      enable = true;
    };

    options.tabstop = 2;
    options.shiftwidth = 2;

    visuals.cinnamon-nvim.enable = true;

    keymaps = [
      #{
      #  mode = "i";
      #  key = "<C-h>";
      #  action = "<Left>";
      #}
      #{
      #  mode = "i";
      #  key = "<C-j>";
      #  action = "<Down>";
      #}
      #{
      #  mode = "i";
      #  key = "<C-k>";
      #  action = "<Up>";
      #}
      #{
      #  mode = "i";
      #  key = "<C-l>";
      #  action = "<Right>";
      #}
      {
        mode = "n";
        key = "<c-e>";
        action = "3<Down>";
      }
      {
        mode = "n";
        key = "<c-q>";
        action = "3<Up>";
      }
      {
        mode = "n";
        key = "<A-e>";
        action = "<PageDown>";
        noremap = false;
      }
      {
        mode = "n";
        key = "<A-e>";
        action = "<PageUp>";
        noremap = false;
      }
      {
        mode = "n";
        key = "<c-h>";
        action = "<cmd>wincmd h<cr>";
      }
      {
        mode = "n";
        key = "<c-j>";
        action = "<cmd>wincmd j<cr>";
      }
      {
        mode = "n";
        key = "<c-k>";
        action = "<cmd>wincmd k<cr>";
      }
      {
        mode = "n";
        key = "<c-l>";
        action = "<cmd>wincmd l<cr>";
      }
    ];

    binds = {
      cheatsheet = {
        enable = true;
      };
    };

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      rust.enable = true;
      nix.enable = true;
      sql.enable = true;
      clang.enable = true;
      ts.enable = true;
      python.enable = true;
      zig.enable= true;
      markdown.enable = true;
      html.enable = true;
      dart.enable = false;
      go.enable = true;
      lua.enable = true;
      php.enable = true;
    };
  };
}
