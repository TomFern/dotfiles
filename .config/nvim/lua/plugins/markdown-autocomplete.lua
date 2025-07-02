return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Custom source for Markdown custom anchors
      local markdown_custom_anchors_source = {
        name = "markdown_custom_anchors",
        option = {},
        get_trigger_characters = function()
          return { "#" }
        end,
        complete = function(self, request, callback)
          local input = string.sub(request.context.cursor_before_line, request.offset - 1, request.offset - 1)

          -- Only trigger if '#' is typed or in a link
          if input ~= "#" and not request.context.cursor_before_line:match("%[.*%]%(#?$") then
            return callback()
          end

          -- Extract custom anchors from current buffer
          local bufnr = vim.api.nvim_get_current_buf()
          local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

          local candidates = {}
          for _, line in ipairs(lines) do
            -- Match custom anchors like {#anchor-name}
            local custom_anchor = line:match("{#([%w%-]+)}")
            if custom_anchor then
              table.insert(candidates, {
                label = custom_anchor,
                insertText = custom_anchor,
                documentation = {
                  kind = "markdown",
                  value = "**Custom Anchor:** " .. custom_anchor,
                },
              })
            end

            -- Also match headings with inline custom anchors
            local heading, inline_anchor = line:match("^#+%s*(.+)%s*{#([%w%-]+)}$")
            if inline_anchor then
              table.insert(candidates, {
                label = inline_anchor,
                insertText = inline_anchor,
                documentation = {
                  kind = "markdown",
                  value = "**Heading Anchor:** " .. (heading or inline_anchor),
                },
              })
            end
          end

          callback({
            items = candidates,
            isIncomplete = false,
          })
        end,
      }

      -- Add custom source to completion sources
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "markdown_custom_anchors" },
      }))

      -- Register the custom source
      require("cmp").register_source("markdown_custom_anchors", markdown_custom_anchors_source)
    end,
  },
}
