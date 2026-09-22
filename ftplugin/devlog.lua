if vim.b.did_indent_guide then
  return
end
vim.b.did_indent_guide = true

local ns = vim.api.nvim_create_namespace('indent_guide_col4')
--vim.api.nvim_set_hl(0, 'IndentGuideCol4', { bg = '#4a4a4a', ctermbg = 237, fg ='#ff0' })

local COL = 4 -- 0-indexed window column => visually the 4th character
local bufnr = vim.api.nvim_get_current_buf()

local function draw_guide()
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
  --local top = vim.fn.line('w0')    -- first visible line (1-indexed)
  --local bot = vim.fn.line('w$')    -- last visible line (1-indexed)
  --local lines = vim.api.nvim_buf_get_lines(bufnr, top - 1, bot, false)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local code_block_start = 0
  local code_block_end = 0
  for i, line in ipairs(lines) do
    if line:sub(1, 8) == "        " then
      if code_block_start == 0 then
        code_block_start = i
      end
      code_block_end = i
    elseif line ~= "" and code_block_start > 0 then

      for j=code_block_start,code_block_end do
        vim.api.nvim_buf_set_extmark(bufnr, ns, j - 1, 0, {
          virt_text = { { ' ', 'DevlogCodeLineChar' } },
          virt_text_win_col = COL,
          hl_mode = 'combine',
        })
      end

      code_block_start = 0
      code_block_end = 0
    end
  end
end

draw_guide()

local fn_name = ('__indent_guide_draw_%d'):format(bufnr)
_G[fn_name] = draw_guide

vim.cmd(string.format([[
  augroup IndentGuide%d
    autocmd!
    autocmd TextChanged,TextChangedI <buffer=%d> lua %s()
  augroup END
]], bufnr, bufnr, fn_name))
