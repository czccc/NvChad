-- This is an example init file , its supposed to be placed in /lua/custom dir
-- lua/custom/init.lua

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

local hooks = require "core.hooks"

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

hooks.add("setup_mappings", function(map)
   map("n", "<leader>cc", ":Telescope <CR>", opt)
   map("n", "<leader>q", ":q <CR>", opt)
end)

-- NOTE : opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options

-- Install plugins
-- To add new plugins, use the "install_plugin" hook,

-- examples below:

hooks.add("install_plugins", function(use)
   
  -- osc52
  use {
      "ojroques/vim-oscyank"
  }

  use "akinsho/toggleterm.nvim"
  use "folke/which-key.nvim"
  
end)

hooks.add("setup_mappings", function(map)
  map("n", "<leader>cc", "dd", opt) -- example to delete the buffer
end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

local ok, err = pcall(require, "custom.autocmds")
if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
end

require "custom.plugins.whichkey"
require "custom.plugins.toggleterm"
