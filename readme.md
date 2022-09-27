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
