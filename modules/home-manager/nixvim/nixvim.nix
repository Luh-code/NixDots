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
        showTabIndicators = true;
        tabSize = 12;
        alwaysShowBufferline = true;
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
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 500;
        };
        formattersByFt = {
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
        };
      };
    
      lsp = {
        enable = true;
        servers = {
          eslint = {enable = true;};
          html = {enable = true;};
          lua-ls = {enable = true;};
          nil_ls = {enable = true;};
          marksman = {enable = true;};
          pyright = {enable = true;};
          gopls = {enable = true;};
          terraformls = {enable = true;};
          tsserver = {enable = true;};
          yamlls = {enable = true;};
          clangd = {enable = true;};
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
