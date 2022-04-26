local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

catppuccin.setup({
  integration = {
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = true,
    },
    which_key = true,
    neogit = true,
    vim_sneak = true,
    bufferline = true,
    ts_rainbow = true,
  },
})

local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
