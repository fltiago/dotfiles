# Readme Me

Aw you get a new computer to set your configurations, really cool. Let's try to do this as fast as possible.

## Clone this repository

Add this repository to your home folder:

```bash
~ $ git clone git@github.com:fltiago/dotfiles.git
```

Great, now you have all files to configure your Vim, tmux and bash.

## Link all files to home files

To link all dotfiles use symlinks:

```bash
ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/tmux.conf .tmux.conf
```

Maybe you also need clone Vundle into `.vim` - [Vundle](https://github.com/VundleVim/Vundle.vim).

## Install Vundle

```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
So far so easy, right?

Open `.vimrc` file in home and run `:PluginInstall` command to install all depedencies. Alright, now we need to configure some things into tmux.

## Tmux Configurations

To use mouse options into tmux, if you are at OSx system you should intall:

```bash
$ brew install reattach-to-user-namespace
```

Also don't forget to install [Tmuxinator](https://github.com/tmuxinator/tmuxinator) which is a incredilbe plugin to open projects with all setup.
