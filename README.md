# dotfiles

See this link for instructions:

https://www.elliotdenolf.com/posts/bootstrap-your-dotfiles-with-dotbot

## For Powerline install:

```
$ sudo apt install powerline fonts-powerline
```
put this in your `.bashrc` file after installing powerline:

```
# Powerline configuration
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi
```
## For Fonts 

```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Ubuntu.zip

mkdir ~/.local/share/fonts

## then move the .ttf files to the fonts dir
fc-cache -v -f 
fc-list | grep UbuntuNerd

```

## For ssh directory:

```
chmod 600 ~/.ssh/*
chmod 700 ~/.ssh/ 
```

## For awesome:
```
$ sudo apt install compton nitrogen xcape xdotool ripgrep rofi pulseaudio libfuse2 i3lock-fancy


```

Note: pulseaudio may need another plugin-type package.

all widgets require the awesome-wm-widgets github repo cloned into the '.config/awesome/' dir!

## For nvim:

The neovim project can be found on line here. At the time of this writing the Ubuntu repo has neovim 0.7.2-8. This is not very recent, so some plugins will not work. Use a version of neovim above 0.8 or 0.9 from the github site.

```
https://github.com/neovim/neovim
```

On Ubuntu snaps can make installing nvim very easy. Use this command.

```
## from snap ##

$ sudo snap install nvim 

```

Or download a appimage from the internet and make sure libfuse2 is installed. Put the appimage at `/usr/local/bin/`. You may need to run these commands.

```
## from appimage ##

$ sudo chmod a+x nvim.appimage 
$ sudo ln -s nvim.appimage nvim

```
You can build the package from source. This option is not so difficult. You will need to install some of the following packages.

```
## from source ##

$ sudo apt install build-essential cmake gettext

```
## For awesome-wm-widgets

If you have trouble with awesome-wm-widgets, try checking out this version:

```
git checkout f190f137
```
