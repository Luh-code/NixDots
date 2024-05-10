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

    #extraConfigLua = "
    #";
    
    keymaps = [
      {
        mode = "i";
        key = "<C-h>";
        action = "<Left>";
      }
      {
        mode = "i";
        key = "<C-j>";
        action = "<Down>";
      }
      {
        mode = "i";
        key = "<C-k>";
        action = "<Up>";
      }
      {
        mode = "i";
        key = "<C-l>";
        action = "<Right>";
      }
      {
        mode = "n";
        key = "<C-w>h";
        action = "<cmd>TmuxNavigateLeft<cr>";
      }
      {
        mode = "n";
        key = "<C-w>j";
        action = "<cmd>TmuxNavigateDown<cr>";
      }
      {
        mode = "n";
        key = "<C-w>k";
        action = "<cmd>TmuxNavigateUp<cr>";
      }
      {
        mode = "n";
        key = "<C-w>l";
        action = "<cmd>TmuxNavigateRight<cr>";
      }
      {
        mode = "n";
        key = "<C-w>\\";
        action = "<cmd>TmuxNavigatePrevious<cr>";
      }
    ];
  };
}
