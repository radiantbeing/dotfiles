vim.pack.add({
  { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") }
})

require("blink.cmp").setup(
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  {
    appearance = { nerd_font_variant = "normal" },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100
        }
      }
    }
  }
)

