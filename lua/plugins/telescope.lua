return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("telescope").setup()
      -- Only load fzf if it compiles successfully
      pcall(require("telescope").load_extension, "fzf")
    end,
    keys = {
      { "<leader>t", ":Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", ":Telescope live_grep<CR>", desc = "Grep in Files" },
      { "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffers" },
      { "<leader>r", ":Telescope oldfiles<CR>", desc = "Find oldfiles" },
    },
  },
}
