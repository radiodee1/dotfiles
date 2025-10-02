# dotfiles

See this link for instructions:

https://www.elliotdenolf.com/posts/bootstrap-your-dotfiles-with-dotbot

## For Powerline install:

```bash
$ sudo apt install powerline fonts-powerline
```
put this in your `.bashrc` file after installing powerline:

```bash
# Powerline configuration
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi
```
## For Fonts: 

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Ubuntu.zip
## or ##
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip

mkdir ~/.local/share/fonts

## then move the .ttf files to the fonts dir
fc-cache -v -f 
fc-list | grep UbuntuNerd
## then a restart may be necessary.
## from gnome-terminal preferences choose the Ubuntu Mono font.
```

## For ssh directory:

```bash
chmod 600 ~/.ssh/*
chmod 700 ~/.ssh/ 
```

## For awesome:
```bash
$ sudo apt install compton nitrogen xcape xdotool ripgrep rofi pulseaudio libfuse2 i3lock-fancy mpd mpc lxpolkit lxappearance

## for all WM 
$ sudo apt install network-manager-applet

## for sway/wayland
$ sudo apt install sway waybar
$ sudo apt install pipx 
$ sudo apt install sway-notification-center wtype  
```

Note: pulseaudio may need another plugin-type package.

all widgets require the awesome-wm-widgets github repo cloned into the '.config/awesome/' dir!

## For nvim:

The neovim project can be found on line here. At the time of this writing the Ubuntu repo has neovim 0.7.2-8. This is not very recent, so some plugins will not work. Use a version of neovim above 0.8 or 0.9 from the github site.

```bash
https://github.com/neovim/neovim
```

On Ubuntu snaps can make installing nvim very easy. Use this command.

```bash
## from snap ##

$ sudo snap install nvim 
$ sudo apt install fzf
```

Or download a appimage from the internet and make sure libfuse2 is installed. Put the appimage at `/usr/local/bin/`. You may need to run these commands.

```bash
## from appimage ##

$ sudo chmod a+x nvim.appimage 
$ sudo ln -s nvim.appimage nvim

```
You can build the package from source. This option is not so difficult. You will need to install some of the following packages.

```bash
## from source ##

$ sudo apt install build-essential cmake gettext

```

The custom Markdown and MarkdownInPlace commands use pandoc. To use pandoc you must install it.

```bash
$ sudo apt install pandoc 
```

Install UV. Some instructions say:

```
$ curl -LsSf https://astral.sh/uv/install.sh | sh 

$ uv tool install --upgrade pynvim

```

More from the terminal 
```
npm install -g @vue/language-server
npm install -g @vue/typescript-plugin
```

## Mounting NAS 

The NAS is a pretty specific piece of hardware. The scripts here are not for everyone. Basically they are to allow me to use the NAS with little trouble. The NAS requires the root user's environment to mount and the regular user's environment to set up permissions and access, etc. Use the list below as a guide for mounting.

- The nas needs an IP address. Set the ip address by running the shell script `./smb-setup-edit.sh` with one parameter, which is the required ip address. This puts the ip address in a temp file. If your ip address ever changes, run this script again.

```bash
./smb-setup-edit.sh 192.168.0.123
```

- Run the same script without any parameter and the mount point for the nas will be created. This mount point is `$HOME/mnt/smb/edit`. 

- Run the `smb-mount-edit.sh` script with one parameter, the smb password. The script will ask you for your sudo password. Then the script launches the mount process. Do not run this script as super user!

- Unmount the smb share with the `smb-umount-edit.sh` script. It takes no parameters.

## Extra Considerations

Set up kitty as gnome-terminal.

- Install kitty
- set as alternative.
- choose.

```bash 
sudo apt install kitty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 50
sudo update-alternatives --config x-terminal-emulator
```

## Google Chrome

Reset Chrome for awesome wm 

```bash
cd ~/.config/
rm -fr google-chrome
```

Then you need to log in to your account on Google Chrome again.

## Music mpd

```bash
# try this...
touch .config/mpd/sticker.sql

```
A `mpd.conf` file is included in the dotfiles repo.

## Node 

look into `nvm`, which stands for `node version manager`. https://github.com/nvm-sh/nvm 

## lxpolkit 

Add this to .config/sway/config 

```
exec_always bash -c "xhost +SI:localuser:root"
```

## Davinci Resolve

```
sudo apt install ocl-icd-opencl-dev ocl-icd-dev mesa-opencl-icd pocl-opencl-icd  
```

## Some grub commands 

```
sudo grub-install ## <-- this command can take arguments
sudo update-grub
```
