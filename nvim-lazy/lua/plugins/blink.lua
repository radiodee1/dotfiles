return {
  "saghen/blink.cmp",
  opts = {
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
      ["<CR>"] = { function(cmp)
          -- Only accept if the completion menu is currently open
          if cmp.is_menu_visible() then
            return cmp.select_and_accept()
          end
        end,
        "fallback", },
    },
  },
}

