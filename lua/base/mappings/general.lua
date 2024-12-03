return function(maps)
  maps.n['<Esc>'] = { '<cmd>nohlsearch<CR>', desc = 'Clear highlights on search when pressing <Esc> in normal mode' }
  maps.n['<leader>q'] = { vim.diagnostic.setloclist, desc = 'Diagnostic Quickfix List' }
  maps.t['<Esc><Esc>'] = { '<C-\\><C-n>', desc = 'Exit terminal mode' }

  -- Keybinds to make split navigation easier.
  maps.n['<C-h>'] = { '<C-w><C-h>', desc = 'Move focus to the left window' }
  maps.n['<C-l>'] = { '<C-w><C-l>', desc = 'Move focus to the right window' }
  maps.n['<C-j>'] = { '<C-w><C-j>', desc = 'Move focus to the lower window' }
  maps.n['<C-k>'] = { '<C-w><C-k>', desc = 'Move focus to the upper window' }
  maps.n['vs'] = { '<cmd>vs<CR>', desc = 'Vertical split' }
  maps.n['sp'] = { '<cmd>sp<CR>', desc = 'Vertical split' }
end