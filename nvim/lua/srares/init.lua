require("srares.colors")
require("srares.remap")
require("srares.packer")
require("srares.set")

function Pprint(t)
    vim.notify("DEBUG: " .. vim.inspect(t), vim.log.levels.INFO)
end
