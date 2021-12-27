local conf = require("core.utils").load_config().plugins.options.nvimtree
local git_status = conf.enable_git

local present, nvimtree = pcall(require, "nvim-tree")
if not present then
   return
end

local present, nvim_tree_config = pcall(require, "nvim-tree.config")
if not present then
  return
end
local tree_cb = nvim_tree_config.nvim_tree_callback


local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = git_status
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_window_picker_exclude = {
   filetype = { "notify", "packer", "qf" },
   buftype = { "terminal" },
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

nvimtree.setup {
   filters = {
      dotfiles = false,
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   auto_close = false,
   open_on_tab = false,
   open_on_setup = false,
   hijack_cursor = true,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      allow_resize = true,
      auto_resize = true,
      side = "left",
      width = 30,
      height = 30,
      hide_root_folder = false,
      number = false,
      relativenumber = false,
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        },
      },
   },
   git = {
      enable = true,
      ignore = true,
      timeout = 500,
   },
   trash = {
     cmd = "trash",
     require_confirm = true,
   },
   quit_on_open = 0,
   git_hl = 1,
   disable_window_picker = 0,
   root_folder_modifier = ":t",
   show_icons = {
     git = 1,
     folders = 1,
     files = 1,
     folder_arrows = 1,
     tree_width = 30,
   },
   system_open = {
     cmd = nil,
     args = {},
   },
   diagnostics = {
     enable = true,
     icons = {
       hint = "",
       info = "",
       warning = "",
       error = "",
     },
   },
   update_to_buf_dir = {
     enable = true,
     auto_open = true,
   },
}
