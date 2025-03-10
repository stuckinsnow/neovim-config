# 💤 LazyVim Config

I'm new to Lua, so don't trust some of the more complicated files, but maybe it can give you some inspiration if you're new. Some of the plugins are disabled, but I kept the config files for them as it's an opinionated choice. For example, You may prefer to use neo-tree and telescope. Find the line that says `enabled = false`.

## UI config

There are two ui files, ui and ui-2; the former converts line numbers to a rainbow colour. The latter disables relative line numbers on the inactive buffer e.g. if you have a split window, the line numbers will be less visible. It's useful if you want to find a line. However, it does not convert line numbers into rainbow colours.

You can switch ui files easily in init.lua; similarly, I have commented out code for tokynight theme. I should remove this altogether, but I am forever undecided with my colour themes!

## Mini-files

Mini-files config was obtained from Maria's config, but has been modified. You can now press "<leader>e" to see a tree view structure, press it again to go to the root dir.

## Thank you

Special thanks to theprimeagen, maria, and typecraft (I may have forgotten some people). Their advice & config files have been tremendously helpful to me:

<https://github.com/ThePrimeagen/>

<https://github.com/MariaSolOs>

<https://github.com/typecraft-dev>

![aa](https://github.com/user-attachments/assets/c0af3997-8a29-44bc-a740-c4ceb4d96b82)
