{ inputs, ... }:

{
  imports =
    [
      inputs.nixvim.homeManagerModules.nixvim
    ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;

    colorschemes = {
      gruvbox.enable = false;
      nord.enable = false;
    };
    
    opts = {
      relativenumber = true;
    };

    plugins = {
      bufferline = {
        enable = true;
        settings.options = {
          show_tab_indicators = true;
          tab_size = 12;
          always_show_bufferline = true;
        };
      };

      tmux-navigator = {
        enable = true;
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fb" = "buffers";
          "<leader>fg" = "live_grep";
          "<leader>fs" = "grep_string";
        };
      };

      which-key = {
        enable = true;
      };

      todo-comments = {
        enable = true;
      };

      chadtree = {
        enable = true;
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lspFallback = true;
            timeoutMs = 500;
          };
          formatters_by_ft = {
            html = [["prettierd" "prettier"]];
            css = [["prettierd" "prettier"]];
            javascript = [["prettierd" "prettier"]];
            javascriptreact = [["prettierd" "prettier"]];
            python = [["black"]];
            lua = [["stylua"]];
            nix = [["alejandra"]];
            markdown = [["prettierd" "prettier"]];
            yaml = [["yamllint" "yamlfmt"]];
            cpp = [["clang-format"]];
            zig = [["zigfmt"]];
          };
        };
      };
    
      lsp = {
        enable = true;
        servers = {
          eslint = {enable = true;};
          html = {enable = true;};
          lua-ls = {enable = true;};
          nil-ls = {enable = true;};
          marksman = {enable = true;};
          pyright = {enable = true;};
          gopls = {enable = true;};
          terraformls = {enable = true;};
          tsserver = {enable = true;};
          yamlls = {enable = true;};
          clangd = {enable = true;};
          zls = {enable = true;};
        };
      };

      lspsaga = {
        enable = true;
        codeAction = {
          showServerName = true;
        };
        definition.keys = {
          
        };
      };

      transparent = {
        enable = false;
      };
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

    extraConfigLuaPre = ''
      vim.g.mapleader = ' '
    '';
    
    extraConfigVim = ''
      set signcolumn=yes
    '';
    
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
      # Scoll
      {
        mode = "n";
        key = "<C-e>";
        action = "3<Down>";
      }
      {
        mode = "n";
        key = "<C-q>";
        action = "3<Up>";
      }
      {
        mode = "n";
        key = "<A-e>";
        action = "<PageDown>";
      }
      {
        mode = "n";
        key = "<A-q>";
        action = "<PageUp>";
      }
      # Tmux
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
      # bufferline 
      {
        mode = "n";
        key = "<TAB>";
        action = "<cmd>bn<cr>";
      }
      {
        mode = "n";
        key = "<S-TAB>";
        action = "<cmd>bp<cr>";
      }
      # chadtree
      {
        mode = "n";
        key = "<leader>t";
        action = "<cmd>CHADopen<cr>";
      }
      # lspsaga
      {
        mode = "n";
        key = "<leader>pd";
        action = "<cmd>Lspsaga peek_definition<cr>";
      }
    ];
  };
}
