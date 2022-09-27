# Install Arch Linux in 1 line



```bash
archinstall --config https://raw.githubusercontent.com/javiabellan/linux/master/server-g3.json
archinstall --config shorturl.at/cdE08
```


if archinstall does not work due to archlinux-keyring, run the following commands:

```bash
killall gpg-agent
rm -rf /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux
```
[source](https://github.com/archlinux/archinstall/issues/1389#issuecomment-1190773779)


# After Installation

### Change bash to zsh

```bash
$ sudo pacman -S zsh   # Install ZSH
$ zsh                  # Make sure that ZSH has been installed correctly
$ chsh -l              # List all installed shells
$ chsh -s /usr/bin/zsh # Set new default shell (zsh) for your user
```

> - https://wiki.archlinux.org/title/zsh#Installation
> - https://wiki.archlinux.org/title/Command-line_shell#Changing_your_default_shell


### More tips: [General recommendations](https://wiki.archlinux.org/title/General_recommendations)
