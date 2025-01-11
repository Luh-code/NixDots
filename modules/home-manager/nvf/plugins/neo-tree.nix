{ pkgs, lib, ... }:

{
  vim.lazy.plugins."neo-tree.nvim" = { 
    package = pkgs.vimPlugins.neo-tree-nvim;
    setupModule = "neo-tree";
    # set up plugin
    setupOpts = {
      
    };
    # lua initialization after setup
    after = ''
      
    '';

    # Explicitely mark the plugin as lazy. Not strictly required if triggers are defined
    lazy = true;

    # load on command
    cmd = [ "Neotree" ];

    # load on event
    event = [];

    # load on keymap
    keys = [
      {
        key = "<leader>t";
        action = ":Neotree";
        mode = "n";
      }
    ];
  };
}
