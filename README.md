Getting started with Astrovim on Windows (powershell)

1.[follow these instructions. select the "powershell" tab ](https://docs.astronvim.com/)

a. [download and run the .msi file from ](https://github.com/neovim/neovim/releases/tag/stable)

b. clone the configuration template:

    1. comment out this line
     if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
    2. ```git clone --depth 1 https://github.com/AstroNvim/template $env:LOCALAPPDATA\nvim```
      this will create C:\Users\<userid>\AppData\Local\nvim
    3. cd C:\Users\<userid>\AppData\Local\nvim
    4. nvim
    5. edit the community.lua and add the following line

    { import = "astrocommunity.pack.angular" },
    6. exit and restart nvim

2. The language pack will cause all the following plugins to to installed:
   https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/angular/README.md

3. If you are unable to install the `angular language pack`, then
   :TSInstall angular # install TreeSitter for angular. For syntax highlighting
   :DAPInstall angular # for debugging
   :LSPInstall angular # for language server

   Not sure how toggle term is to be installed
   As part of the setup you might have to install c or c++ compiler

4. Gettting isntalled with angualar project and open it with nvim
5. create an angular project
6. install node
7. install angular
8. ng new angular_one
9. cd angular_one
10. nvim
11. Navigating the project
    <space> e will bring up the explorer. NeoTree
    <space> <shift> p will preiview file from explorer
    <space> o will toggle between explorer and the open tab
    -- this is like Alt 1 in PyCharm
    use j and k to navigate the explorer
    / to search for file
    ? to bring up the explorer menu
    s to open the file in a split
12. Ctrl-tab will allow shifting between powershell tabs

13. Switching between buffers
    <space> b c close this buffer
    <space> b C close all buffers
    <space> b b will assign a short code to each buffer that you can then choose

14. Using terminal
    <space> t f ...bring up/down(toggle) a floating terminal
    exit .... to exit fromt he terminal

15. Shifting from the terminal
    C-\ C-n .... this will allow browser to move all over the terminal ...not just the command prompt
    ...then <space> t f

16. Managing splits
    in explorer, "s" will open tht file in a split
    then ctrl-w and sub command to manage splits
    ctrl-w h switch to left window

#### 17. windows terminal shortctus

    ctrl-shift-p ...show all commands

    --- managing terminal tabs
    ctrl-tab ... go to next tab
    ctrl-shift-tab ... go to previous tab
    ctrl-shift-w ... close tab

    --- opening new tabls
    ctrl-shift-t ...new tab with default profile (powershell)
    ctrl-shift-d ...duplicate tab
    ctrl-alt-1/2/3/4... switch to tab

    --- resizing
    split panes:
    alt-shift-+ ... split right
    alt left .... go to left pane
    alt right .... go to right pane

    --managing font size for specific terminal split
    ctrl - NUM PAD - ... decrease font size
