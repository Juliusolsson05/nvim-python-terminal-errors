# Neovim Python Error Parser

This Neovim plugin provides a command to parse Python error messages from a terminal buffer and navigate to a list with references to the files/lines where the errors occurred.

## Features

- Parses Python traceback errors directly from Neovim's terminal.
- Populates the quickfix list with parsed errors for easy navigation.
- Allows quick access to the exact line in the file where an error occurred.

## Requirements

- Neovim 0.5.0 or newer.

## Installation

You can place the provided Lua function and command definition in your `init.lua` file or source it from a separate Lua script if you prefer to keep your configuration modular.

## Usage

1. Open a terminal in Neovim with `:terminal`.
2. Run your Python script or any command that outputs Python errors to the terminal.
3. Execute `:TerminalErrors` to parse the output and populate the quickfix list with the found errors.

Once the quickfix list is open, you can:

- Use `:cnext` and `:cprev` to navigate through the errors.
- Press `Enter` on any error entry to jump to the respective file and line.

## Configuration

No additional configuration is needed. However, the `errorformat` is currently tailored to Python traceback errors. If you need to parse errors from other languages or tools, you will need to adjust the `errorformat` string accordingly.
