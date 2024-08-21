# Neovim Configuration

#### **Neovide** with **NVIM v0.10.1**.

#### Font: `Source Code Pro`

![Neovim Setup](/screens/screenshot.png)

## Information

### Coding

- **[neoformat](https://github.com/sbdchd/neoformat)**: A powerful code formatting plugin.
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Simplifies commenting in code.
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)**: Highlights and searches for TODO comments in code.
- **[supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim)**: Provides AI-powered code completion and inline suggestions, enhancing the coding experience with Maven and other tools.
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Automatically closes pairs like brackets and quotes.
- **[neotest](https://github.com/nvim-neotest/neotest)**: A testing framework integrated with Neovim.
  - **[neotest-jest](https://github.com/nvim-neotest/neotest-jest)**: Provides Jest testing integration.

### Colorscheme

- **[onedark.vim](https://github.com/joshdick/onedark.vim)**: OneDark theme with customization for terminal colors.
- **[kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)**: A beautiful Kanagawa theme.
- **[palenight.nvim](https://github.com/alexmozaidze/palenight.nvim)**: Palenight theme.
- **[nordic.nvim](https://github.com/AlexvZyl/nordic.nvim)**: Nordic theme with extensive customization options.
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)**: Tokyo Night theme.
- **[catppuccin/nvim](https://github.com/catppuccin/nvim)**: Catppuccin theme with multiple flavor options.

### Git Integration

- **[neogit](https://github.com/NeogitOrg/neogit)**: A Magit-like Git integration interface for Neovim.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git integration that shows signs in the gutter.
- **[git-blame.nvim](https://github.com/f-person/git-blame.nvim)**: Displays Git blame information in the gutter.
- **[diffview.nvim](https://github.com/sindrets/diffview.nvim)**: Provides a side-by-side diff view for Git.

### LSP (Language Server Protocol) and Autocompletion

- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: A completion engine for Neovim.
- **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)**: A collection of snippets for different languages.
- **[lspkind.nvim](https://github.com/onsails/lspkind.nvim)**: Adds icons to the autocompletion menu.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: A snippet engine for Neovim.
- **[lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)**: Provides signature help for LSP functions.
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: A package manager for LSP servers, DAP servers, linters, and formatters.
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)**: Integrates Mason with lspconfig.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: A collection of configurations for Neovim's built-in LSP client.
- **[none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)**: A general-purpose LSP server for Neovim.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Treesitter configurations and abstractions for Neovim.
- **[typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim)**: TypeScript-specific tools for Neovim.
- **[SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim)**: Provides JSON schema support for LSP.

### UI Enhancements

- **[which-key.nvim](https://github.com/folke/which-key.nvim)**: Displays possible keybindings in a popup.
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: A file explorer for Neovim.
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**: A terminal manager for Neovim.
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A fuzzy finder and search utility.
- **[nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)**: Enhances the quickfix window.
- **[nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)**: Adds a scrollbar with diagnostics and search result markers.
- **[treesj](https://github.com/Wansmer/treesj)**: Split and join code blocks.
- **[dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)**: Provides a customizable dashboard for Neovim.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A status line configuration plugin.
- **[nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)**: Highlights color codes in your code.
- **[barbar.nvim](https://github.com/romgrk/barbar.nvim)**: A buffer management plugin with tabline support.
- **[barbecue.nvim](https://github.com/utilyre/barbecue.nvim)**: Adds breadcrumbs and more to your Neovim UI.

### Additional Tools

- **[nvm.nvim](https://github.com/pipoprods/nvm.nvim)**: Integrates Node Version Manager (NVM) into Neovim.
- **[guess-indent.nvim](https://github.com/nmac427/guess-indent.nvim)**: Automatically guesses and sets the indentation for files.
- **[vim-prisma](https://github.com/prisma/vim-prisma)**: Syntax highlighting for Prisma schema files.

### Default LSPs

- **intelephense**: PHP language support.
- **pyright**: Python language server.
- **bashls**: Bash language server.
- **rust_analyzer**: Rust language server.
- **jdtls**: Java Development Tools language server.
- **marksman**: Markdown language server.
- **graphql**: GraphQL language server.
- **sqlls**: SQL language server.
- **solidity**: Solidity language server.
- **cssls**: CSS language server.
- **html**: HTML language server.
- **volar**: Vue language server.
- **dockerls**: Docker language server.
- **yamlls**: YAML language server.
- **lemminx**: XML language server.
- **jsonls**: JSON language server.
- **eslint**: JavaScript and TypeScript linting and formatting.
- **lua_ls**: Lua language server, especially for Neovim configurations.
- **prismals**: Prisma schema language server.

### Default Linters and Formatters

- **prettierd**: Fast Prettier for formatting various languages.
- **stylua**: Lua formatter.
- **shfmt**: Shell script formatter.
- **shellcheck**: Linter for shell scripts.
- **autopep8**: Formatter for Python code.
