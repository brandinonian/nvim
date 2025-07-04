return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      -- Enable telescope extensions
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      -- Set keymaps
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      keymap("n", "<leader>pf", "<cmd>Telescope find_files<CR>", opts)
      keymap("n", "<leader>pg", "<cmd>Telescope git_files<CR>", opts)
      keymap("n", "<leader>lg", "<cmd>Telescope live_grep<CR>", opts)
      keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
      keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
      keymap("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
    end,
  }
}
