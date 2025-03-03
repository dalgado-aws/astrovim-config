### Getting started with AstroNvim with Windows Terminal and PowerShell

1. Open Windows Terminal

   ctrl + shift + p ... open command palette ...show all commands

   ctrl + shift + t ... new terminal window

   ctrl + tab ... switch to next terminal window

   ctrl + shift + tab ... switch to previous terminal window

   ctrl + shift + w ... close terminal window. if this is the last terminal window, it will close the terminal window

   alt + shift + + ... split terminal window horizontally

   alt + shift + < ... resize the split

   alt + shift + >

   ctrl + shift + w ... will close the split

   alt + < go to the right tab

   alt + < go to the left tab

   ctrl + NUM PAD -(Minus) ... decrease font size

2. Install nvim for windows

   [Download and run the .msi file from here](https://github.com/neovim/neovim/releases/tag/stable)

3. When nvim starts up , it will look for init.lua in C:\Users\<userid>\AppData\Local\nvim\init.lua

   To use AstoNvim, the init.lua has to be customized to load AstroNvim specific config and plugins.

   Fetch the customized init.lua to your AppData\Local\nvim\init.lua by cloning the following repo from github:

   `git clone --depth 1 https://github.com/AstroNvim/template $env:LOCALAPPDATA\nvim`

   This will create C:\Users\<userid>\AppData\Local\nvim

4. Optional Step: Convert the nvim config directory(C:\Users\<userid>\AppData\Local\nvim\init.lua) to a git repo

   This way you can revert any changes you make to the init.lua or other config files.

   For this, create a new repository on github and push the nvim directory to the repository.

5. Change to the nvim config directory and start nvim

   `cd C:\Users\<userid>\AppData\Local\nvim`

   `nvim`

   This will start nvim with the customized `init.lua` in `C:\Users\<userid>\AppData\Local\nvim`.

   The customized init.lua will first install the `lazy` package manager.

   It will then load `lua/lazy_setup.lua` and

   1. `lua/lazy_setup.lua` will load and configure the AstroNvim plugin.

   2. `lua/lazy_setup.lua` will load and configure the plugins from folder `lua/plugins`
      Note that most of the files under `lua/plugins` are `disabled` by defaut.
      To enable the file, comment out the below line that appears the the top of each file:
      `if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE`

   3. `lua/lazy_setup.lua` will load and confiure the plugins from `commnunity.lua`

6. Install the "language packs" for the languages you are interested in.

   To install the "language packs" for `angular` and `java` , do the following:

   1. Edit the `community.lua` and add the following lines:

   ```
   { import = "astrocommunity.pack.angular" },
   { import = "astrocommunity.pack.java" },
   ```

   2. If the file has a line `if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE`, then comment out this line.

   All available community "language packs" are listed [here](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack)

7. Save the file. Exit nvim with <space> Q and restart nvim. This will cause all "language pack" plugins to be installed.

8. Understanding Language Support in Nvim
   Modern Editors(like Nvim and VSCode ) do not have inbuilt support for syntax highlighting, parsing, debugging, etc
   This is provided by plugins.
   This allows the editor to be lightweight and fast. The plugins are responsible for providing the features.
   Plugins expose an API that the editor can use to provide the features.

   1. Syntax Highlighting with TreeSitter

      TreeSitter is a syntax highlighting, codefolding, and indentation engine that is used by Nvim to provide syntax highlighting.

      Enter `:TSInstallInfo` to check the installed language packs.

      Enter `:TSInstall angular` to install the angular language pack.

      When we configure a "language pack" for a language, the TreeSitter language module for that language will be installed by AstroNvim.

   2. Syntax Checking with Language Servers

      Nvim communicates with the Language Servers to determine syntax correctness of the files being edited and suggest "completions".

      When we configure a "language pack" for a language, the language server for that language will be installed by AstroNvim via Mason.

      The "Mason" plugin is responsible for managing Language Servers, DAP, Linters,and Formatters.

      Enter :Mason at the to bring up the Mason menu

   3. Debugging with DAP Plugin

      The DAP plugin is used for debugging and is also mangaged by Mason.

      Enter :Mason then navigate to the DAP section to see the available debuggers.

9. Navigating the Project with NeoTree Explorer

   <space> e will toggle up the file explorer(NeoTree)

   <space> o will toggle between the file explorer and the open tab

   When in the File Explorer

   <shift> p will preview file from explorer

   <shift> s will open the file in a split

   use j and k to navigate the explorer

   / will search for file

   ? will bring up the explorer menu

   s will open the file in a split

10. Navigating the project with Telescope

    <space> f f will find files

    <space> f b will find buffers

11. Working with "Window Splits"

    C-w o will close the split

    C-w h/j/k/l will move to the left/bottom/top/right split

    C-w v will split the window vertically

    C-w s will split the window horizontally

    C-w w will move between splits

    C-w c will close the split

    C-w o will close all other windows (including the explorer if it is open)

    In Explorer, "s" will open tht file in a split

12. Switching between buffers

    <space> b c will close this buffer

    <space> b C will close all buffers and quit nvim

    <space> b b will assign a short code to each buffer that you can then choose

13. Navigating the "jump list":

    C-o will go to the last buffer

    C-i will go to the next buffer

14. Working with the Terminal

    <space> t f will toggle a floating terminal

    The terminal will start capturing all the key strokes. <space> t f might not work.

    Use Ctrl-\ Ctrl-n to release the terminal from capturing all the key strokes.

    Then use <space> t f to toggle the terminal

15. Another way to use the Terminal(with Windows Terminal)

    Alt + Shift + + will split the Windows Terminal Vertically

    Use Alt + > and Alt + < will move between the Terminal Splits

    Use NumPad - to reduce font size

    Use Ctrl + Shift + w will close the split

16. Installing copilot

    Edit plugins/lua/user.lua and add the following code

    Explantion of the code:

    nvim-cmp is a completion plugin. Copilot has to be configured to collaborate with nvim-cmp.
    If this is not done, the both nvim-cmp and copilot will be trying to provide suggestions and this will cause a conflict.

```lua

  {
    "github/copilot.vim",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false }, -- Disable standalone Copilot UI
        panel = { enabled = false }, -- Disable Copilot floating panel
      }
      require("copilot_cmp").setup() -- Use Copilot as a cmp source
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "github/copilot.vim", -- Copilot
      "zbirenbaum/copilot.lua", -- Alternative Copilot integration
      "zbirenbaum/copilot-cmp", -- Copilot as a cmp source
      "hrsh7th/cmp-nvim-lsp", -- LSP completions
      "hrsh7th/cmp-buffer", -- Buffer completions
      "hrsh7th/cmp-path", -- Path completions
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    config = function()
      local cmp = require "cmp"
      cmp.setup {
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(), -- Next suggestion
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = "copilot", group_index = 2 }, -- Copilot suggestions
          { name = "nvim_lsp", group_index = 2 }, -- LSP completions
          { name = "buffer", group_index = 3 }, -- Buffer words
          { name = "path", group_index = 3 }, -- File paths
          { name = "luasnip", group_index = 3 }, -- Snippet completions
        },
      }
    end,
  },
```

..then do :Copilot setup

Once Copilot Setup is done, then use following techniquies
... Copilot will automatically make suggestions when cursor is resting

17. Installing ChatGPT

    Get a ChatGPT API key from OpenAI by visiting https://beta.openai.com/signup/

    Set the environment variable in PowerShell

    $env:OPENAI_API_KEY="sk-proj-P2lnbwyGhZ4YHw9Vh6jsjsaxE5St5VV2KbEGSM4c79G..........."

    :ChatGPT

    Various options are available to interact with ChatGPT

18. Getting started with simple java program
    Execute the program

19. Getting Started with Springboot
