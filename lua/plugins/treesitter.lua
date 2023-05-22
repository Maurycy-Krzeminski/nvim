return {
    "nvim-treesitter/nvim-treesitter",

  dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ":TSUpdate",
  config = function ()
      -- Using protected call
      local status_ok, _ = pcall(require, "nvim-treesitter")
      if not status_ok then
          return
      end
      local status_ok_c, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok_c then
          return
      end

    configs.setup {
	    -- A list of parser names, or "all"
	    ensure_installed = { "vimdoc", "javascript", "typescript", "lua", "rust", "go", "java", "kotlin", "svelte" },

	    -- Install parsers synchronously (only applied to `ensure_installed`)
	    sync_install = false,

	    -- Automatically install missing parsers when entering buffer
	    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	    auto_install = true,

	    highlight = {
		    -- `false` will disable the whole extension
		    enable = true,

		    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		    -- Using this option may slow down your editor, and you may see some duplicate highlights.
		    -- Instead of true it can also be a list of languages
		    additional_vim_regex_highlighting = false,
	    },
    }
  end
}
