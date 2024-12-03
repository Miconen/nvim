local utils = require 'base.utils'
local is_available = utils.is_available

return function(maps)
  -- Telescope
  if is_available 'telescope.nvim' then
    local builtin = require 'telescope.builtin'
    maps.n['<leader>sh'] = { builtin.help_tags, desc = 'Help' }
    maps.n['<leader>sk'] = { builtin.keymaps, desc = 'Keymaps' }
    maps.n['<leader>sf'] = { builtin.find_files, desc = 'Files' }
    maps.n['<leader>ss'] = { builtin.builtin, desc = 'Select Telescope' }
    maps.n['<leader>sw'] = { builtin.grep_string, desc = 'Current Word' }
    maps.n['<leader>sg'] = { builtin.live_grep, desc = 'Grep' }
    maps.n['<leader>sd'] = { builtin.diagnostics, desc = 'Diagnostics' }
    maps.n['<leader>sr'] = { builtin.resume, desc = 'Resume' }
    maps.n['<leader>s.'] = { builtin.oldfiles, desc = 'Recent Files ("." for repeat)' }
    maps.n['<leader><leader>'] = { builtin.buffers, desc = 'Existing buffers' }

    maps.n['<leader>/'] = {
      function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = 'Fuzzy buffer',
    }

    maps.n['<leader>s/'] = {
      function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      desc = 'Fuzzy open buffers',
    }

    -- Shortcut for searching Neovim configuration files
    maps.n['<leader>sn'] = {
      function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Neovim files',
    }
  end
end
