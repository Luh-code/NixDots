{ pkgs, lib, ... }:

{
  vim.lazy.plugins."vim-tmux-navigator" = { 
    package = pkgs.vimPlugins.vim-tmux-navigator;
    setupModule = "vim-tmux-navigator";
    # set up plugin
    setupOpts = {
      
    };
    # lua initialization after setup
    after = ''
      
    '';

    # Explicitely mark the plugin as lazy. Not strictly required if triggers are defined
    lazy = true;

    # load on command
    cmd = [
      "TmuxNavigateLeft"
      "TmuxNavigateUp"
      "TmuxNavigateDown"
      "TmuxNavigateRight"
    ];

    # load on event
    event = [];

    # load on keymap
    keys = [
      {
        mode = "n";
        key = "<C-h>";
        action = "<TmuxNavigateLeft>";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<TmuxNavigateDown>";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<TmuxNavigateUp>";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<TmuxNavigateRight>";
      }
    ];
  };
}
