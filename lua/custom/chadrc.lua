-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
   cmdheight = 2,            -- more space in the neovim command line for displaying messages
   fileencoding = "utf-8",   -- the encoding written to a file

   -- NvChad options
   nvChad = {
      copy_cut = true, -- copy cut text ( x key ), visual and normal mode
      copy_del = true, -- copy deleted text ( dd key ), visual and normal mode
      insert_nav = true, -- navigation in insertmode
      window_nav = true,

      -- updater
      update_url = "https://github.com/czccc/NvChad",
      update_branch = "user",
   },
}

M.ui = {
   theme = "onedark",
}

M.plugins = {
   -- enable/disable plugins (false for disable)
   status = {
      telescope_media = true,
   }
   options = {
      nvimtree = {
         enable_git = 1,
         -- packerCompile required after changing lazy_load
         lazy_load = true,

         ui = {
            allow_resize = true,
            side = "left",
            width = 25,
            hide_root_folder = true,
         },
      },
   }
   
   
}

return M
