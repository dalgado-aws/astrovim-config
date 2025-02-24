### Getting started with Astrovim on Windows with Windows Terminal and PowerShell

1. Open Windows Terminal

   ctrl + shift + p ... open command palette ...show all commands

   ctrl + shift + t ... new terminal

   ctrl + tab ... switch to next terminal window
   ctrl + shift +tab ... switch to previous terminal window

   ctrl + shift + w ... close tab. if this is the last tab, it will close the terminal window

   alt + shift + + ... split terminal window horizontally
   alt + shift + <
   alt + shift + > ... resize the split
   ctrl + shift + w... will close the split
   alt + < go to the right tab
   alt + < go to the left tab

   ctrl - NUM PAD - ... decrease font size

2. Install nvim for windows

   [Download and run the .msi file from here](https://github.com/neovim/neovim/releases/tag/stable)

3. When nvim starts up , it will look for init.lua in C:\Users\<userid>\AppData\Local\nvim\init.lua

   To use AstoNvim, the init.lua has to be customized.
   Fetch the customized init.lua to your AppData\Local\nvim\init.lua by cloning the following repo from github:

   `git clone --depth 1 https://github.com/AstroNvim/template $env:LOCALAPPDATA\nvim`

   This will create C:\Users\<userid>\AppData\Local\nvim

4. If possible, make the nvim directory a git repo
   This way you can revert any changes you make to the init.lua of other config files.

5. cd C:\Users\<userid>\AppData\Local\nvim

6. `nvim`
   This will start nvim with the customized init.lua.
   The customized init.lua will install the `lazy` package manager.
   It will then load lua/lazy_setup.lua
   lua/lazy_setup.lua will load the AstroNvim plugin and the plugins from lua/plugins and commnunity.lua

7. Edit the community.lua and add the following lines to enable the language packs for angular and java(or other languages)

   All available community "language packs" are listed [here](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack)

```
{ import = "astrocommunity.pack.angular" },
{ import = "astrocommunity.pack.java" },
```

7. Save the file. Exit nvim with <space> Q and restart nvim. This will cause all plungins to be installed.
   The AstroNVim config will install some important plugins:
   TressSitter: for syntax highlighting
   DAP: for debugging
   LSPInstaller: for language server

   Each of the plugins will need additional packs for specific languages.

   For e.g., once TreeSitter is installed, it exposes a TSInstall command which can be used to install the language packs.
   :TSInstall angular

   Similarly, we have
   :DAPInstall angular
   :LSPInstall angular

8. Create an angular project
   install node
   install angular
   ng new angular_one
   cd angular_one
   nvim

9. Navigating the Project with NeoTree Explorer
   <space> e will toggle up the file explorer(NeoTree)
   <space> o will toggle up explorer and the open tab
   When in the File Explorer
   <shift> p will preiview file from explorer
   <shift> s will open the file in a split
   use j and k to navigate the explorer
   / to search for file
   ? to bring up the explorer menu
   s to open the file in a split

10. Navigating the project with Telescope
    <space> f f to find files
    <space> f b to find buffers

11. Working with "Window Splits"
    C-w o will close the split
    C-w h/j/k/l will move to the left/bottom/top/right split

    C-w v will split the window vertically
    C-w s will split the window horizontally
    C-w w ... move between splits

    C-w c ... close the split

    C-w o ... close all other windows (including teh explorer if it is open)

12. Switching between buffers
    <space> b c close this buffer
    <space> b C close all buffers and quit nvim
    <space> b b will assign a short code to each buffer that you can then choose

    Navigating the "jump list":
    C-o will go to the last buffer
    C-i will go to the next buffer

13. Working with the Terminal
    <space> t f will toggle a floating terminal

    The terminal will start capturing all the key strokes. <space> t f might not work.
    Use C-\ C-n to release the terminal from capturing all the key strokes.
    Then use <space> t f to toggle the terminal

14. Another way to use the Terminal(with Windows Terminal)
    Alt + Shift + + will split the terminal horizontally
    Use Alt + > and Alt + < to move between the Terminal Splits
    Use NumPad - to reduce font size
    Use Ctrl + Shift + w to close the split

15. Managing splits
    in explorer, "s" will open tht file in a split
    then ctrl-w and sub command to manage splits
    ctrl-w h switch to left window

16. Installing copilot
    edit plugins/lua/user.lua and add the following code

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
    Various options are avialble

18. Getting started with simple java program
    Exebutin the program

19. Getting Started with Springboot
