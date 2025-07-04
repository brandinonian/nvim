local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- remove whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- don't auto comment new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- set indentation for specific file types
autocmd("FileType", {
  pattern = { "html", "css", "javascript", "typescript", "typescriptreact", "json", "yaml" },
  command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})

autocmd("FileType", {
  pattern = { "python" },
  command = "setlocal tabstop=4 shiftwidth=4 expandtab",
})

-- auto format on save (if LSP available)
autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
