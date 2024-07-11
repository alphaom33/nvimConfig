local project_log = require("2PBHD.project-log")
vim.keymap.set("n", "<C-p>", function() project_log:add_project() end)
