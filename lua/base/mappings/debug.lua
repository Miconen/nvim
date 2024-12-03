local utils = require 'base.utils'
local is_available = utils.is_available

return function(maps)
  if is_available 'nvim-dap' then
    maps.n['<leader>D'] = 'Debug'

    maps.n['<leader>Dc'] = {
      function()
        require('dap').continue()
      end,
      desc = 'Start/Continue',
    }
    -- Basic debugging keymaps, feel free to change to your liking!
    maps.n['<F5>'] = maps.n['Dc']

    maps.n['<leader>Di'] = {
      function()
        require('dap').step_into()
      end,
      desc = 'Step Into',
    }
    maps.n['<F1>'] = maps.n['Di']

    maps.n['<leader>Do'] = {
      function()
        require('dap').step_over()
      end,
      desc = 'Step Over',
    }
    maps.n['<F2>'] = maps.n['Do']

    maps.n['<leader>DO'] = {
      function()
        require('dap').step_out()
      end,
      desc = 'Step Out',
    }
    maps.n['<F3>'] = maps.n['DO']

    maps.n['<leader>Dt'] = {
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    }
    maps.n['F4'] = maps.n['Db']

    maps.n['<leader>DB'] = {
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    }
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    maps.n['<leader>Dt'] = {
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    }
    maps.n['<leader>Dt'] = maps.n['<F7>']
  end
end
