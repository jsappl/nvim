-- ui
local dap, dapui = require("dap"), require("dapui")

require("nvim-dap-virtual-text").setup({
  highlight_changed_variables = false,
})
dapui.setup()

-- automatically open/close dap-ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

--TODO when stepping over the line highlight color is bad. However, the following only changes color of breakpoints and
--  not when stepping over... Example: https://github.com/Mofiqul/dracula.nvim/issues/74
--vim.api.nvim_set_hl(0, "debugPCDraculaFix", { bg = "#ffffff" })
--vim.fn.sign_define(
--  "DapBreakpoint",
--  { text = "→`", texthl = "", linehl = "debugPCDraculaFix", numhl = "" }
--)
