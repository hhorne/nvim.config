-- nvim-dap and nvim-dap ui, for debugging applications
return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint' })
    vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

    require("which-key").register({
      ["<leader>db"] = { dap.toggle_breakpoint, "[D]ebug [B]reakpoint" },
      ["<F5>"] = { dap.continue, "Continue" },
    })
  end,
}
