local utils = require 'base.utils'
local is_available = utils.is_available

return function(maps)
  -- Mini
  if is_available 'mini.nvim' then
    local files = require 'mini.files'
    maps.n['-'] = {
      function()
        if not files.close() then
          files.open()
        end
      end,
    }
  end

  -- Snacks
  if is_available 'snacks.nvim' then
    maps.n['<leader>gh'] = {
      function()
        Snacks.gitbrowse.open()
      end,
      desc = 'Open current git project in the browser',
    }
  end

  -- Query for plugin availability
  maps.n['<leader>sA'] = {
    function()
      -- Get user input
      vim.ui.input({ prompt = 'Search: ' }, function(search)
        if search then
          -- Search for the input
          local available = is_available(search)
          vim.notify('Plugin available: ' .. tostring(available), vim.log.levels.INFO)
        end
      end)
    end,
    desc = 'Query plugin availability',
  }
end
