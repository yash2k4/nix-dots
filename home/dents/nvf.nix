{
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      autocomplete.nvim-cmp = {
        enable = true;
        mappings = {
          next = "<Down>";
          previous = "<Up>";
          confirm = "<CR>";
          complete = "<C-Space>";
          close = "<C-e>";
        };
      };

      autopairs.nvim-autopairs.enable = true;

      binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
      };

      comments.comment-nvim.enable = true;

      dashboard.alpha.enable = true;

      extraPackages = with pkgs; [
        dockerfile-language-server
        hadolint
        helm-ls
        kubectl
        nodePackages.intelephense
        rubyPackages.solargraph
        sqls
        tailwindcss-language-server
        yaml-language-server
      ];

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          filesystem = {
            filtered_items = {
              hide_dotfiles = false;
              visible = true;
            };
          };
        };
      };

      git = {
        enable = true;
        gitsigns.codeActions.enable = true;
        gitsigns.enable = true;
      };

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;

        bash = {
          enable = true;
          lsp.enable = true;
        };

        clang = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["clangd"];
        };

        css = {
          enable = true;
          lsp.enable = true;
        };

        go = {
          enable = true;
          lsp.enable = true;
        };

        html = {
          enable = true;
        };

        java = {
          enable = true;
          lsp.enable = true;
        };

        json = {
          enable = true;
          lsp.enable = true;
        };

        lua = {
          enable = true;
          lsp.enable = true;
        };

        markdown = {
          enable = true;
        };

        nix = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["nil"];
        };

        php = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["intelephense"];
        };

        python = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["pyright"];
        };

        ruby = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["solargraph"];
        };

        rust = {
          enable = true;
          extensions.crates-nvim.enable = true;
          lsp.enable = true;
        };

        sql = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["sqls"];
        };

        terraform = {
          enable = true;
          lsp.enable = true;
        };

        ts = {
          enable = true;
          lsp.enable = true;
          extensions.ts-error-translator.enable = true;
        };

        typst = {
          enable = true;
          lsp.enable = true;
        };

        yaml = {
          enable = true;
          lsp.enable = true;
        };

        zig = {
          enable = true;
          lsp.enable = true;
        };
      };

      lazy.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        lspSignature.enable = true;
        lspsaga.enable = true;
        trouble.enable = true;
      };

      maps.normal = {
        "<S-Tab>" = {
          action = "<cmd>bprev<CR>";
          desc = "Previous buffer";
        };
        "<Tab>" = {
          action = "<cmd>bnext<CR>";
          desc = "Next buffer";
        };
        "<leader>bd" = {
          action = "<cmd>bdelete<CR>";
          desc = "Delete buffer";
        };

        "<leader>ca" = {
          action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
          desc = "Code action";
        };

        "<leader>e" = {
          action = "<cmd>Neotree toggle<CR>";
          desc = "Toggle file tree";
        };

        "<leader>fb" = {
          action = "<cmd>Telescope buffers<CR>";
          desc = "Find buffers";
        };
        "<leader>ff" = {
          action = "<cmd>Telescope find_files<CR>";
          desc = "Find files";
        };
        "<leader>fg" = {
          action = "<cmd>Telescope live_grep<CR>";
          desc = "Live grep";
        };
        "<leader>fh" = {
          action = "<cmd>Telescope help_tags<CR>";
          desc = "Help tags";
        };

        "gd" = {
          action = "<cmd>lua vim.lsp.buf.definition()<CR>";
          desc = "Go to definition";
        };
        "gr" = {
          action = "<cmd>lua vim.lsp.buf.references()<CR>";
          desc = "Go to references";
        };

        "K" = {
          action = "<cmd>lua vim.lsp.buf.hover()<CR>";
          desc = "Hover docs";
        };

        "<leader>ld" = {
          action = "<cmd>Trouble diagnostics toggle<CR>";
          desc = "Toggle diagnostics";
        };

        "<C-h>" = {
          action = "<C-w>h";
          desc = "Move to left window";
        };
        "<C-j>" = {
          action = "<C-w>j";
          desc = "Move to lower window";
        };
        "<C-k>" = {
          action = "<C-w>k";
          desc = "Move to upper window";
        };
        "<C-l>" = {
          action = "<C-w>l";
          desc = "Move to right window";
        };

        "<leader>rn" = {
          action = "<cmd>lua vim.lsp.buf.rename()<CR>";
          desc = "Rename symbol";
        };

        "<leader>sh" = {
          action = "<cmd>split<CR>";
          desc = "Horizontal split";
        };
        "<leader>sv" = {
          action = "<cmd>vsplit<CR>";
          desc = "Vertical split";
        };

        "<leader>tt" = {
          action = "<cmd>ToggleTerm<CR>";
          desc = "Toggle terminal";
        };
      };

      notify.nvim-notify.enable = true;

      options = {
        clipboard = "unnamedplus";
        expandtab = true;
        number = true;
        relativenumber = true;
        scrolloff = 8;
        shiftwidth = 2;
        signcolumn = "yes";
        tabstop = 2;
        termguicolors = true;
        wrap = false;
      };

      snippets.luasnip.enable = true;

      spellcheck = {
        enable = true;
        languages = ["en"];
      };

      statusline.lualine = {
        enable = true;
        theme = lib.mkForce "catppuccin";
      };

      tabline.nvimBufferline.enable = true;

      telescope.enable = true;

      terminal.toggleterm = {
        enable = true;
        setupOpts.direction = "horizontal";
      };

      theme = {
        enable = lib.mkForce true;
        name = lib.mkForce "catppuccin";
        style = lib.mkForce "mocha";
        transparent = lib.mkForce true;
      };

      treesitter = {
        enable = true;
        autotagHtml = true;
        context.enable = false;
        fold = true;
      };

      utility = {
        diffview-nvim.enable = true;
        motion.leap.enable = true;
        surround.enable = true;
      };

      viAlias = true;
      vimAlias = true;

      visuals = {
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
        nvim-cursorline.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
      };
    };
  };
}
