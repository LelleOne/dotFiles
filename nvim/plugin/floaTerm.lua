vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state ={
    floating = {
        buf = -1,
        win = -1,
    }
}

local function floating_window(opts)
    opts = opts or {}

    local columns = vim.o.columns
    local lines = vim.o.lines

    -- Default to 80% of screen
    local width = opts.width or math.floor(columns * 0.8)
    local height = opts.height or math.floor(lines * 0.8)

    -- Center the window
    local col = math.floor((columns - width) / 2)
    local row = math.floor((lines - height) / 2)

    -- Create a scratch buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf)then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end
    -- Window options
    local win_opts = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_opts)

  return {buf = buf, win = win }
end
local toggle_term = function ()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("FloaTerm", toggle_term, {})

vim.keymap.set({"n", "t"}, "<space>tt", toggle_term)
