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

### Change Bash to ZSH

```bash
$ sudo pacman -S zsh                    # Install ZSH (and extras)
$ zsh                                   # Make sure that ZSH has been installed correctly
$ chsh -l                               # List all installed shells
$ chsh -s /usr/bin/zsh                  # WAY 1) Set new default shell (zsh) for your user
$ usermod --shell /usr/bin/zsh username # WAY 2) Set new default shell (zsh) for a user
$ nano /etc/passwd                      # WAY 3) Set new default shell (zsh) for a user
$ echo $SHELL                           # Comprobar la nueva shell
```

> - https://wiki.archlinux.org/title/zsh#Installation
> - https://wiki.archlinux.org/title/Command-line_shell#Changing_your_default_shell
> - [3 Ways to Change a Users Default Shell](https://www.tecmint.com/change-a-users-default-shell-in-linux/)

### ZSH: Better prompt -> Powerlevel10k

```bash
$ sudo pacman -S zsh-theme-powerlevel10k
$ p10k configure
```

### ZSH: Others

```bash
$ sudo pacman zsh-completions grml-zsh-config
```

### More tips: [General recommendations](https://wiki.archlinux.org/title/General_recommendations)
