{ pkgs, lib, ... }:

{
  vim.lazy.plugins."which-key.nvim" = { 
    package = pkgs.vimPlugins.which-key-nvim;
    setupModule = "which-key";
    # set up plugin
    setupOpts = {
      
    };
    # lua initialization after setup
    after = ''
      
    '';

    # Explicitely mark the plugin as lazy. Not strictly required if triggers are defined
    lazy = true;

    # load on command
    cmd = [];

    # load on event
    event = [];

    # load on keymap
    keys = [
        { 
                key = "<leader>?";
                action = "<cmd>:lua require(\"which-key\").show({global = false})";
                mode = "n";
        }
    ];
  };
}
