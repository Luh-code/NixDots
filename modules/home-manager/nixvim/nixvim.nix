{ inputs, ... }:

{
  imports =
    [
      inputs.nixvim.homeManagerModules.nixvim
    ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    
    plugins.bufferline = {
      enable = true;
    };

    plugins.tmux-navigator = {
      enable = true;

    };

    files = {
      "ftplugin/nix.lua" = {
        opts = {
          shiftwidth = 2;
	        tabstop = 2;
	        expandtab = true;
          clipboard = "unnamedplus";
	      };
      };
    };
    
    keymaps = [
      {
        key = "<C-w>h";
        action = "<cmd>TmuxNavigateLeft<cr>";
      }
      {
        key = "<C-w>j";
        action = "<cmd>TmuxNavigateDown<cr>";
      }
      {
        key = "<C-w>k";
        action = "<cmd>TmuxNavigateUp<cr>";
      }
      {
        key = "<C-w>l";
        action = "<cmd>TmuxNavigateRight<cr>";
      }
      {
        key = "<C-w>\\";
        action = "<cmd>TmuxNavigatePrevious<cr>";
      }
    ];
  };
}
