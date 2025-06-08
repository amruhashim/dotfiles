local function live_multigrep(opts)
  opts = opts or {}
  local current_dir = opts.cwd or vim.uv.cwd()
  
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local make_entry = require('telescope.make_entry')
  local conf = require('telescope.config').values
  
  pickers.new(opts, {
    prompt_title = 'Live MultiGrep',
    finder = finders.new_async_job({
      command_generator = function(prompt)
        if not prompt or prompt == '' then
          return nil
        end
        
        local pieces = vim.split(prompt, '  ') -- double space
        local args = { 'rg' }
        
        if pieces[1] then
          table.insert(args, '-e')
          table.insert(args, pieces[1])
        end
        
        if pieces[2] then
          table.insert(args, '-g')
          table.insert(args, pieces[2])
        end
        
        return vim.flatten({
          args,
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case'
        })
      end,
      entry_maker = make_entry.gen_from_vimgrep({
        cwd = current_dir
      }),
      cwd = current_dir,
    }),
    sorter = conf.generic_sorter(opts),
    previewer = conf.file_previewer(opts),
  }):find()
end

-- Set keymap
vim.keymap.set('n', '<leader>fg', live_multigrep, { 
  desc = 'Live grep with file filtering' 
})