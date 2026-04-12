return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show = true,
      },
      ghost_text = {
        enabled = true,
      },
      -- list = {
      --  selection = { preselect = false, auto_insert = false },
      -- },
    },
    cmdline = {
      enabled = true,
      -- { "buffer" },
      sources = function()
        local type = vim.fn.getcmdtype()
        -- Enable buffer-based completion for searching with / or ?
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Enable command-line completion for :
        if type == ":" then
          return { "cmdline" }
        end
        return {}
      end,
    },
    keymap = {
      preset = "none", -- default
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_next()
          end
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_prev()
          end
        end,
        "fallback",
      },
      ["<CR>"] = {
        function(cmp)
          -- Only accept if the completion menu is currently open
          if cmp.is_menu_visible() then
            return cmp.select_and_accept()
          end
        end,
        "fallback",
      },
    },
  },
}
