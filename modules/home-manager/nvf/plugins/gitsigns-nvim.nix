{ pkgs, lib, ... }:

{
  vim.lazy.plugins."gitsigns.nvim" = { 
    package = pkgs.vimPlugins.gitsigns-nvim;
    setupModule = "gitsigns";
    # set up plugin
    setupOpts = {
      
    };
    # lua initialization after setup
    after = ''
      
    '';

    # Explicitely mark the plugin as lazy. Not strictly required if triggers are defined
    lazy = false;

    # load on command
    cmd = [];

    # load on event
    event = [];

    # load on keymap
    keys = [
      {
      }
    ];
  };
}
