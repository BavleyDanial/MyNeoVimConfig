return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		--"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
        "mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require "dap"
		local ui = require "dapui"

        require("dap-python").setup("python")
        table.insert(dap.configurations.python, {
          type = 'python',
          request = 'launch',
          name = 'python launch configuration',
          program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        })

		require("dapui").setup()
		local codelldb = vim.fn.exepath "codelldb"

		if codelldb ~= "" then
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb,
					args = {"--port", "${port}"},
				}
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = 'launch',
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
				},
			}
		end

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

		vim.keymap.set("n", "<leader>?", function()
			require("dapui").eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_into)
		vim.keymap.set("n", "<F3>", dap.step_over)
		vim.keymap.set("n", "<F4>", dap.step_out)
		vim.keymap.set("n", "<F5>", dap.step_back)
		vim.keymap.set("n", "<F9>", dap.restart)

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
}
