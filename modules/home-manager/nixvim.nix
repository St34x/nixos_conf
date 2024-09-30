{ pkgs, config, inputs, ... }:
{
  programs.nixvim = {
	enable 			= true;
        
        defaultEditor 		= true;

        opts = {
          number 		= true;
          relativenumber 	= true;
          shiftwidth 		= 2;
	  clipboard 		= [ "unnamedplus" ];
        };

        globals.mapleader 	= " ";

        colorschemes.base16 = {
	  enable 		= true;
	  colorscheme 		= "tokyo-night-storm";
	};

	plugins = {
	  lsp.enable 		= true;
	  cmp.enable 		= true;
	  lualine.enable 	= true;
	  undotree.enable 	= true;
	  cmp-path.enable 	= true;
	  nvim-tree.enable 	= true;
	  telescope.enable 	= true;
	  autoclose.enable 	= true;
	  treesitter.enable 	= true;
	  bufferline.enable 	= true;
	  copilot-vim.enable 	= true;
	  which-key = {
	    enable 		= true;
	    settings = {
	      icons = {
		breadcrumb 	= "»";
		separator 	= "➜";
		group 		= "+";
	      };
	      layout = {
		height 		= { min = 4; max = 150; };
		width 		= { min = 20; max = 950; };
		spacing 		= 3;
		align 		= "left";
	      };
	    };
	  };
	};

	extraConfigLua 		= ''
	  local status, wk = pcall(require, "which-key")

	  if not (status) then
	      vim.notify("couldn't load whichkey, skipping mappings")
	      return
	  end

	  -- normal mode
	  local which_key_map = {}

	  -- general
	  which_key_map['s'] = { '<Cmd>w<CR>', 'Save file' }
	  which_key_map['S'] = { '<Cmd>wa<CR>', 'Save all' }

	  -- Tree
	  which_key_map['e'] = { vim.cmd.NvimTreeToggle, 'Tree' }

	  -- Undotree
	  which_key_map["u"] = { vim.cmd.UndotreeToggle, 'Undo tree' }

	  -- Git
	  -- which_key_map['g'] = { vim.cmd.Git, 'Git' }

	  -- LSP
	  which_key_map['l'] = { vim.cmd.LspInstall, 'LSP installer' }

	  -- Format buffer
	  which_key_map['f'] = { vim.lsp.buf.format, 'Format buffer' }

	  -- Replace the word I'm on
	  which_key_map['r'] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Replace' }

	  -- Sourse from current file
	  which_key_map[' '] = { function() vim.cmd('so') end, 'Sourse from file' }

	  -- Barbar
	  which_key_map.b = {
	      name = '+Buffer',
	      b = { '<Cmd>BufferNext<CR>', 'Next buffer' },
	      m = {
		  name = '+Move buffer',
		  a = { '<Cmd>BufferMovePrevious<CR>', 'Move back' },
		  e = { '<Cmd>BufferMoveNext<CR>', 'Move forvard' },
	      },
	      f = { '<Cmd>BufferGoto 1<CR>', 'Go to first' },
	      l = { '<Cmd>BufferLast<CR>', 'Go to last' },
	      q = { '<Cmd>BufferClose<CR>', 'Close current' },
	      o = { '<Cmd>BufferCloseAllButCurrent<CR>', 'Close all but current' },
	      u = { '<Cmd>BufferCloseBuffersLeft<CR>', 'Close left' },
	      d = { '<Cmd>BufferCloseBuffersRight<CR>', 'Close right' },
	      s = {
		  name = '+Sort',
		  n = { '<Cmd>BufferOrderByBufferNumber<CR>', 'By buffer number' },
		  l = { '<Cmd>BufferOrderByLanguage<CR>', 'By language' },
		  d = { '<Cmd>BufferOrderByDirectory<CR>', 'By directory' },
		  w = { '<Cmd>BufferOrderByWindowNumber<CR>', 'By window number' },
	      }
	  }

	  -- Telescope
	  local builtin = require('telescope.builtin')
	  which_key_map.t = {
	      name = 'Telescope',
	      f = { builtin.find_files, 'Search file' },
	      -- Treesitter playground
	      p = { vim.cmd.TSPlaygroundToggle, 'Treesitter playground' },
	      s = { function()
		  builtin.grep_string({ search = vim.fn.input("Grep > ") })
	      end, 'Grep' },
	      g = { builtin.git_files, 'Git files' },
	  }

	  -- Packer
	  which_key_map.p = {
	      name = 'Packer',
	      s = { vim.cmd.PackerSync, 'Synchronise' },
	      c = { vim.cmd.PackerCompile, 'Compile' }
	  }

	  which_key_map['x'] = { '<Cmd>q<CR>', 'Quit file' }
	  which_key_map['X'] = { '<Cmd>qa<CR>', 'Quit all' }
	  which_key_map['q'] = { '<Cmd>wa<CR><Cmd>qa<CR>', 'Save quit all' }
	  which_key_map['Q'] = {
	      string.format('<Cmd>wa<CR><Cmd>mksession! %s/Session.vim<CR><Cmd>qa<CR>', vim.fn.getcwd()),
	      'Save session quit all',
	  }

	  wk.register(which_key_map, { prefix = '<leader>' })

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
