local utils = require 'base.utils'
local is_available = utils.is_available

return function(maps)
  -- Lazygit
  if is_available 'snacks.nvim' then
    maps.n['<leader>gz'] = {
      function()
        Snacks.lazygit.open()
      end,
      desc = 'Open current git project in the browser',
    }
  end

  if is_available 'gitsigns.nvim' then
    maps.n['<leader>g'] = 'Git'
    maps.n[']g'] = {
      function()
        require('gitsigns').nav_hunk 'next'
      end,
      desc = 'Next Git hunk',
    }
    maps.n['[g'] = {
      function()
        require('gitsigns').nav_hunk 'prev'
      end,
      desc = 'Previous Git hunk',
    }
    maps.n['<leader>gl'] = {
      function()
        require('gitsigns').blame_line()
      end,
      desc = 'View Git blame',
    }
    maps.n['<leader>gL'] = {
      function()
        require('gitsigns').blame_line { full = true }
      end,
      desc = 'View full Git blame',
    }
    maps.n['<leader>gp'] = {
      function()
        require('gitsigns').preview_hunk()
      end,
      desc = 'Preview Git hunk',
    }
    maps.n['<leader>gh'] = {
      function()
        require('gitsigns').reset_hunk()
      end,
      desc = 'Reset Git hunk',
    }
    maps.n['<leader>gr'] = {
      function()
        require('gitsigns').reset_buffer()
      end,
      desc = 'Reset Git buffer',
    }
    maps.n['<leader>gs'] = {
      function()
        require('gitsigns').stage_hunk()
      end,
      desc = 'Stage Git hunk',
    }
    maps.n['<leader>gS'] = {
      function()
        require('gitsigns').stage_buffer()
      end,
      desc = 'Stage Git buffer',
    }
    maps.n['<leader>gu'] = {
      function()
        require('gitsigns').undo_stage_hunk()
      end,
      desc = 'Unstage Git hunk',
    }
    maps.n['<leader>gd'] = {
      function()
        require('gitsigns').diffthis()
      end,
      desc = 'View Git diff',
    }
  end
end
