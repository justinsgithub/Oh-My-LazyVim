# 💤 Oh My LazyVim 🔌

> The last NeoVim config you'll never need.

## Important 

> new release v2

git pull will not be good if using version before this, better to start with fresh git clone or stick with previous version, can still learn from the additions / future additions to the current version

made some changes to project based on feedback which changed directory structure back to match original LazyVim structure

new builtin colorscheme "theme-daddy" which is used by default, can easily customize by customizing your own theme, or just use as a template or example to learn from


## About

This is a config built with [LazyVim](https://github.com/LazyVim/LazyVim).

The goal of this project is to create as large and every battery you can think of included config as possible... while minimizing abstractions to keep full customizability / extensibility.

I've always found it much faster to take out the things you don't need (like as fast as enabled = false).

As opposed to having to go install the tool(s) I need, figure out how to configure them properly, and then also set up keymaps for them.

The goal is to include every good plugin out there along with alternatives where you might want the choice, as well as great support for every popular programming language feasible.

The idea is to make creating the perfect and most powerful config you can think of as simple as commenting and uncommenting or enabling / disabling plugins right from their plugin spec, thanks to the power of [lazy.nvim](https://github.com/folke/lazy.nvim)

Refer to the [LazyVim documentation](https://lazyvim.github.io/installation) to get started, but clone this repo instead if you want a more feature-rich config to start from (:

`git clone https://github.com/justinsgithub/oh-my-lazyvim ~/.config/nvim`

## Usage

The config files are structured to allow keeping up to date with new plugins and features in this repo while not messing up your own customizations / changes.

Do not modify any files in the lua/_oml directory. The files are organized to where you should be
able to make any changes and customizations you want without touching any files in that directory.

## Contributing and Todos

- anyone is more than welcome to create issues with any ideas or suggestions

- can make pull requests for any fixes or plugins you would like to add, but please include plugin config for lua spec and test first

- add plugin in its own file inside oh-my-lazyvim/plugins/{category}/\_{myplugin}.lua directory, in the category directory you think fits best


- a big priority is iicreating strong LSP configs specific to each language and different frameworks
