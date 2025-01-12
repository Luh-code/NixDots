{ pkgs, lib, ... }:

{
  vim.lazy.plugins."tmux.nvim" = { 
    package = pkgs.vimPlugins.tmux;
    setupModule = "tmux";
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
    ];
  };
}
