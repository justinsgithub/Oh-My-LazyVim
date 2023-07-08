# Oh My LazyVim 💤🔌

> The last NeoVim config you'll never need.

This is config built from the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).

The goal of this project is to create as large and every battery you can think of included config as possible... while minimizing abstractions to keep full customizability / extensibility.

I've always found it much faster to take out the things you don't need (like as fast as commenting out some code).

As opposed to having to go install the tool(s) I need, figure out how to configure them properly, and then also set up keymaps for them.

The goal is to include every good plugin out there along with alternatives where you might want the choice, as well as great support for every popular programming language feasible.

The idea is to make creating the perfect and most powerful config you can think of as simple as commenting and uncommenting or enabling / disabling plugins right from their plugin spec, thanks to the power of [lazy.nvim](https://github.com/folke/lazy.nvim)

Refer to the [LazyVim documentation](https://lazyvim.github.io/installation) to get started, but clone this repo instead if you want a more feature-rich config to start from (:

`git clone https://github.com/justinsgithub/oh-my-lazyvim ~/.config/nvim`

## Warning

This is just meant to be a 1 time template to clone, to get you up and started quickly.

This project is brand new and new plugins will keep being added, but after you make your own adjustments and personalizations to it be careful merging with newer versions of this repo and risk overwriting your custom configs. To protect against messing up your config, the lua/user and lua/config dir is in the .gitignore

However new versions can still be taken as inspiration and used as an example to add any plugins you might want to your own config (:

## Contributing and Todos

- anyone is more than welcome to create issues with any ideas or suggestions

- can make pull requests for any fixes or plugins you would like to add, but please include plugin config for lua spec and test first

- add plugin in its own file inside oh-my-lazyvim/plugins directory

- please do not perform updates, lazy-lock should only have a change for the new plugin you are adding

- a big priority is creating strong LSP configs specific to each language and different frameworks

## Tips

use <C-]> to jump to tags in help docs (:
