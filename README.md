# dotfiles

See this link for instructions:

https://www.elliotdenolf.com/posts/bootstrap-your-dotfiles-with-dotbot

For Powerline install:

```
$ sudo apt install powerline fonts-powerline
```
For ssh directory:

```
chmod 600 ~/.ssh/*
chmod 700 ~/.ssh/ 
```

For awesome:
```
$ sudo apt install compton nitrogen xcape xdotool ripgrep rofi pulseaudio libfuse2


```

Note: pulseaudio may need another plugin-type package.

all widgets require the awesome-wm-widgets github repo cloned into the '.config/awesome/' dir!

For nvim:

Download a appimage from the internet and make sure libfuse2 is installed. Put the appimage at `/usr/local/bin/`. You may need to run these commands.

```

chmod a+x nvim.appimage 
ln -s nvim.appimage nvim

```

