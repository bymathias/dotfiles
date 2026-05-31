-- lua/plugins/todo-comments.lua

local todo = plug("todo-comments")
if not todo then return end

todo.setup()

keymap.n("]t", function() require("todo-comments").jump_next() end, "Next todo")
keymap.n("[t", function() require("todo-comments").jump_prev() end, "Previous todo")
keymap.n("<leader>ft", "<cmd>TodoFzfLua<cr>", "Find todos")
