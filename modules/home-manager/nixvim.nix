{ pkgs, config, inputs, ... }:
{
  programs.nixvim = {
    enable = true;
    
    defaultEditor = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      clipboard = [ "unnamedplus" ];
    };

    globals.mapleader = " ";

    colorschemes.base16 = {
      enable = true;
      colorscheme = "tokyo-night-storm";
    };

    plugins = {
      lsp.enable = true;
      cmp.enable = true;
      lualine.enable = true;
      undotree.enable = true;
      cmp-path.enable = true;
      nvim-tree.enable = true;
      telescope.enable = true;
      autoclose.enable = true;
      treesitter.enable = true;
      bufferline.enable = true;
      copilot-vim.enable = true;
      which-key = {
        enable = true;
        layout = {
          height = { min = 4; max = 150; };
          width = { min = 20; max = 950; };
          spacing = 3;
          align = "left";
        };
        registrations = {
          "<leader>s" = "Save file";
          "<leader>S" = "Save all";
          "<leader>e" = "Tree";
          "<leader>u" = "Undo tree";
          "<leader>l" = "LSP installer";
          "<leader>f" = "Format buffer";
          "<leader>r" = "Replace";
          "<leader><space>" = "Source from file";
          "<leader>x" = "Quit file";
          "<leader>X" = "Quit all";
          "<leader>q" = "Save quit all";
          "<leader>Q" = "Save session quit all";
        };
      };
    };  # This closing bracket was missing

    keymaps = [
      {
        key = "<leader>s";
        action = "<Cmd>w<CR>";
        mode = "n";
        options.desc = "Save file";
      }
      {
        key = "<leader>S";
        action = "<Cmd>wa<CR>";
        mode = "n";
        options.desc = "Save all";
      }
      {
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
        mode = "n";
        options.desc = "Tree";
      }
      {
        key = "<leader>u";
        action = ":UndotreeToggle<CR>";
        mode = "n";
        options.desc = "Undo tree";
      }
      {
        key = "<leader>l";
        action = ":LspInstall<CR>";
        mode = "n";
        options.desc = "LSP installer";
      }
      {
	key = "<leader>f";
	action = "function() vim.lsp.buf.format() end";
	mode = "n";
	options = {
	  desc = "Format buffer";
	};
      }
      {
        key = "<leader>r";
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
        mode = "n";
        options.desc = "Replace";
      }
      {
        key = "<leader><space>";
        action = ":so<CR>";
        mode = "n";
        options.desc = "Source from file";
      }
      {
        key = "<leader>x";
        action = "<Cmd>q<CR>";
        mode = "n";
        options.desc = "Quit file";
      }
      {
        key = "<leader>X";
        action = "<Cmd>qa<CR>";
        mode = "n";
        options.desc = "Quit all";
      }
      {
        key = "<leader>q";
        action = "<Cmd>wa<CR><Cmd>qa<CR>";
        mode = "n";
        options.desc = "Save quit all";
      }
      {
        key = "<leader>Q";
        action = ''function() lua vim.cmd(string.format('<Cmd>wa<CR><Cmd>mksession! %s/Session.vim<CR><Cmd>qa<CR>', vim.fn.getcwd())) end'';
        mode = "n";
        options = {
          desc = "Save session quit all";
        };
      }
    ];

    extraConfigLua = ''
      local status, wk = pcall(require, "which-key")

      if not (status) then
          vim.notify("couldn't load whichkey, skipping mappings")
          return
      end

      wk.register({
        b = {
          name = "+Buffer",
          b = { "<Cmd>BufferNext<CR>", "Next buffer" },
          m = {
            name = "+Move buffer",
            a = { "<Cmd>BufferMovePrevious<CR>", "Move back" },
            e = { "<Cmd>BufferMoveNext<CR>", "Move forward" },
          },
          f = { "<Cmd>BufferGoto 1<CR>", "Go to first" },
          l = { "<Cmd>BufferLast<CR>", "Go to last" },
          q = { "<Cmd>BufferClose<CR>", "Close current" },
          o = { "<Cmd>BufferCloseAllButCurrent<CR>", "Close all but current" },
          u = { "<Cmd>BufferCloseBuffersLeft<CR>", "Close left" },
          d = { "<Cmd>BufferCloseBuffersRight<CR>", "Close right" },
          s = {
            name = "+Sort",
            n = { "<Cmd>BufferOrderByBufferNumber<CR>", "By buffer number" },
            l = { "<Cmd>BufferOrderByLanguage<CR>", "By language" },
            d = { "<Cmd>BufferOrderByDirectory<CR>", "By directory" },
            w = { "<Cmd>BufferOrderByWindowNumber<CR>", "By window number" },
          }
        },
        t = {
          name = "Telescope",
          f = { require('telescope.builtin').find_files, "Search file" },
          p = { "<Cmd>TSPlaygroundToggle<CR>", "Treesitter playground" },
          s = { function()
            require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
          end, "Grep" },
          g = { require('telescope.builtin').git_files, "Git files" },
        },
        p = {
          name = "Packer",
          s = { "<Cmd>PackerSync<CR>", "Synchronise" },
          c = { "<Cmd>PackerCompile<CR>", "Compile" }
        }
      }, { prefix = "<leader>" })
          
      -- Move selected text vertically
      vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv")
      vim.keymap.set("v", "O", ":m '<-2<CR>gv=gv")

      -- Leave cursor in place when join the lines
      vim.keymap.set("n", "J", "mzJ`z")

      -- Replace highlighted word and keep it to yank
      vim.keymap.set("x", "<leader>p", [["_dP]])

      vim.keymap.set( "n", "'e", "<Cmd>TmuxNavigateDown<cr>")
      vim.keymap.set( "n", "'o", "<Cmd>TmuxNavigateUp<cr>")
      vim.keymap.set( "n", "'i", "<Cmd>TmuxNavigateRight<cr>")
      vim.keymap.set( "n", "'a", "<Cmd>TmuxNavigateLeft<cr>")
      vim.keymap.set( "n", "'/", "<Cmd>TmuxNavigatePrevious<cr>")	
    '';
  };
}

