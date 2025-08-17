return {
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      local dap = require("dap")

      dap.configurations.cpp = {
        {
          name = "Launch current file",
          type = "codelldb",
          request = "launch",
          -- Use a function to dynamically determine the executable path
          program = function()
            local current_file = vim.fn.expand("%:r")
            return vim.fn.getcwd() .. "/" .. current_file
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          terminal = "integrated",
          preLaunchTask = {
            type = "shell",
            command = function()
              local current_file = vim.fn.expand("%")
              local output_name = vim.fn.expand("%:r")
              return "g++ -g " .. current_file .. " -o " .. output_name
            end,
          },
        },
      }
    end,
  },
}
