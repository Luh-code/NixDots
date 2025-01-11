{ pkgs, lib, ... }:

{
  vim.lazy.plugins."aerial.nvim" = { 
    package = pkgs.vimPlugins.aerial-nvim;
    setupModule = "aerial";
    # set up plugin
    setupOpts = {
      
    };
    # lua initialization after setup
    after = ''
      
    '';

    # Explicitely mark the plugin as lazy. Not strictly required if triggers are defined
    lazy = true;

    # load on command
    cmd = ["AerialOpen"];

    # load on event
    event = ["BufEnter"];

    # load on keymap
    keys = [
      {
        key = "<leader>a";
        action = ":AerialToggle<CR>";
      }
    ];
  };
}
