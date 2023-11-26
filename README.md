# dotfiles

See this link for instructions:

https://www.elliotdenolf.com/posts/bootstrap-your-dotfiles-with-dotbot

For Powerline install:

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


For ssh directory:

```
chmod 600 ~/.ssh/*
chmod 700 ~/.ssh/ 
```

For awesome:
```
$ sudo apt install compton nitrogen xcape xdotool ripgrep rofi pulseaudio libfuse2 i3lock


```

Note: pulseaudio may need another plugin-type package.

all widgets require the awesome-wm-widgets github repo cloned into the '.config/awesome/' dir!

For nvim:

Download a appimage from the internet and make sure libfuse2 is installed. Put the appimage at `/usr/local/bin/`. You may need to run these commands.

```

$ sudo chmod a+x nvim.appimage 
$ sudo ln -s nvim.appimage nvim

## or ##

$ sudo apt install build-essential cmake gettext

```

If you choose the second option go to the 'neovim' website and install from source.

If you have trouble with awesome-wm-widgets, try checking out this version:

```
git checkout f190f137
```
