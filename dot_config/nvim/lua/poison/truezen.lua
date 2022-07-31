local status_ok, true_zen = pcall(require, "true-zen")
if not status_ok then
  return
end

true_zen.setup({
  modes = {
    ataraxis = {
      minimum_writting_area = {
        width = 80,
      },
      padding = {
        left = 32,
        right = 32,
      }
    }
  }
})
