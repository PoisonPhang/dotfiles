local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.gtd.base"] = {},
		["core.norg.concealer"] = {},
		["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/notes/work"
        }
      }
    },
		["core.presenter"] = {},
	},
})
