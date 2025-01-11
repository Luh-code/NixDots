{ pkgs, lib, ... }:

{
  vim.lazy.plugins."bufferline.nvim" = { 
    package = pkgs.vimPlugins.bufferline-nvim;
    setupModule = "gitsigns";
    # set up plugin
    setupOpts = {
      termguicolors = true;
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
    ];
  };
}
