-- obsidian
return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre /Users/andrix/Nextcloud/brainvault/brainvault/**.md",
      "BufNewFile /Users/andrix/Nextcloud/brainvault/brainvault/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("obsidian").setup({
        -- A list of workspace names, paths, and configuration overrides.
        -- If you use the Obsidian app, the 'path' of a workspace should generally be
        -- your vault root (where the `.obsidian` folder is located).
        -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
        -- the workspace to the first workspace in the list whose `path` is a parent of the
        -- current markdown file being edited.
        workspaces = {
          {
            name = "Vault",
            path = "/Users/andrix/Nextcloud/brainvault/brainvault",
          },
        },

        -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
        completion = {
          -- Set to false to disable completion.
          nvim_cmp = false,
          -- Trigger completion at 2 chars.
          min_chars = 2,
        },

        -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
        -- way then set 'mappings = {}'.
        mappings = {
          -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
          ["gd"] = {
            action = function()
              return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
          -- Toggle check-boxes.
          ["<leader>oc"] = {
            action = function()
              return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
          },
        },

        -- Where to put new notes. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = "notes_subdir",

        -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
        -- URL it will be ignored but you can customize this behavior here.
        ---@param url string
        follow_url_func = function(url)
          -- Open the URL in the default web browser.
          vim.fn.jobstart({ "open", url }) -- Mac OS
          -- vim.fn.jobstart({"xdg-open", url})  -- linux
        end,

        -- Optional, sort search results by "path", "modified", "accessed", or "created".
        -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
        -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
        sort_by = "modified",
        sort_reversed = true,

        -- Optional, determines how certain commands open notes. The valid options are:
        -- 1. "current" (the default) - to always open in the current window
        -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
        -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
        open_notes_in = "current",
      })
    end,

    -- see below for full list of options 👇
  },
}
