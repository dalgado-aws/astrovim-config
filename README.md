Getting started with Astrovim on Windows with Windows Terminal and (PowerShell)

1. Install nvim for windows

   [Download and run the .msi file from here](https://github.com/neovim/neovim/releases/tag/stable)

2. Open Windows Terminal

   ctrl + shift + p ... open command palette ...show all commands

   ctrl + t .... open new terminal window
   ctrl + tab ... switch to next terminal window
   ctrl +shift +tab ... switch to previous terminal window

   ctrl + shift + w ... close tab ... if this is the last tab, it will close the terminal window

   alt + shift + + ... split terminal window horizontally
   alt + < go to the right tab
   alt + < go to the left tab

   ctrl - NUM PAD - ... decrease font size

3. When nvim starts up , it will look for init.lua in C:\Users\<userid>\AppData\Local\nvim\init.lua

   To use AstoNvim, the init.lua has to be customized.
   Fetch the customized init.lua by cloning the folloiwng repo from github:

   `git clone --depth 1 https://github.com/AstroNvim/template $env:LOCALAPPDATA\nvim`

   This will create C:\Users\<userid>\AppData\Local\nvim

4. cd C:\Users\<userid>\AppData\Local\nvim

5. nvim
   This will start nvim with the customized init.lua.
   The customized init.lua will install the `lazy` package manager.
   It will then load lua/lazy_setup.lua
   lua/lazy_setup.lua will load the AstroNvim plugin and the plugins from lua/plugins and commnunity.lua

6. Edit the community.lua and add the following lines

```
{ import = "astrocommunity.pack.angular" },
{ import = "astrocommunity.pack.java" },
```

All available community "language packs" are listed [here](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack)

6. Save the file. Exit nvim with `<leader/space>` and restart nvim. This will cause all plungins to be installed.

Some important plugins in nvim are:
TressSitter: for syntax highlighting
DAP: for debugging
LSPInstaller: for language server

Each of the plugins will need additional packs for specific languages.
Once TreeSitter is installed, it exposes a TSInstall command which can be used to install the language packs.
:TSInstall angular
Similarly, we have
:DAPInstall angular
:LSPInstall angular

8. Gettting isntalled with angualar project and open it with nvim
9. create an angular project
   install node
   install angular
   ng new angular_one
   cd angular_one
   nvim

10. Navigating the project
    <space> e will bring up the explorer(NeoTree)
    <space> <shift> p will preiview file from explorer
    <space> o will toggle between explorer and the open tab
    use j and k to navigate the explorer
    / to search for file
    ? to bring up the explorer menu
    s to open the file in a split

11. Switching between buffers
    <space> b c close this buffer
    <space> b C close all buffers
    <space> b b will assign a short code to each buffer that you can then choose

12. Using terminal
    <space> t f ...bring up/down(toggle) a floating terminal

13. Shifting from the terminal
    C-\ C-n .... this will allow browser to move all over the terminal ...not just the command prompt
    ...then <space> t f

14. Managing splits
    in explorer, "s" will open tht file in a split
    then ctrl-w and sub command to manage splits
    ctrl-w h switch to left window
