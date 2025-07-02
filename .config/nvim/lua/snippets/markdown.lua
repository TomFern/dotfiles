local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("tab", {
    t({
      '<Tabs groupId="editor-yaml">',
      '<TabItem value="editor" label="Editor">',
      "</TabItem>",
      '<TabItem value="yaml" label="YAML">',
      "</TabItem>",
      "</Tabs>",
    }),
  }),
}
