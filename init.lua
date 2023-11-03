-- Function to parse python errors and add them to the quickfix list
local function parse_python_errors_from_terminal()
  -- Retrieve the current buffer number
  local bufnr = vim.api.nvim_get_current_buf()

  -- Get the lines from the terminal buffer
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- Concatenate all lines into a single string (simulating terminal output)
  local output = table.concat(lines, "\n")

  -- Define the Python errorformat
  local python_errorformat = '%A  File "%f"%\\, line %l\\,%m,' ..
                             '%C        %m,' ..
                             '%-Z%p^%.%#,' ..
                             '%-G%.%#'

  -- Parse the terminal output and populate the quickfix list
  vim.fn.setqflist({}, ' ', {
    title = 'Python Errors',
    lines = vim.split(output, '\n'),
    efm = python_errorformat
  })

  -- Open the quickfix list
  vim.cmd('copen')
end

-- Custom command to parse errors from terminal
vim.api.nvim_create_user_command(
  'TerminalErrors',
  function()
    parse_python_errors_from_terminal()
  end,
  {desc = "Parse errors from terminal and populate the quickfix list"}
)

