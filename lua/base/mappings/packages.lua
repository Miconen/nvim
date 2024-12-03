local utils = require 'base.utils'
local is_available = utils.is_available

return function(maps)
  -- Lazy
  maps.n['<leader>p'] = 'Packages'
  maps.n['<leader>pl'] = {
    function()
      require('lazy').check()
    end,
    desc = 'Lazy open',
  }
  maps.n['<leader>pL'] = {
    function()
      require('lazy').update()
    end,
    desc = 'Lazy update',
  }

  -- Mason
  if is_available 'mason.nvim' then
    maps.n['<leader>pm'] = { '<cmd>Mason<cr>', desc = 'Mason open' }
    maps.n['<leader>pM'] = { '<cmd>MasonUpdateAll<cr>', desc = 'Mason update' }
  end

  -- Treesitter
  if is_available 'nvim-treesitter' then
    maps.n['<leader>pt'] = { '<cmd>TSInstallInfo<cr>', desc = 'Treesitter open' }
    maps.n['<leader>pT'] = { '<cmd>TSUpdate<cr>', desc = 'Treesitter update' }
  end
end
