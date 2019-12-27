# My Arch Linux (Manjaro)


### Update system
```
sudo pacman -Syu                        # Update and upgrade all packages
```

### Update nvidia driver

```
sudo pacman -S linux54-nvidia-440xx     # Update nvidia driver
sudo mhwd -r pci video-nvidia-418xx
reboot
sudo mhwd -i pci video-nvidia-430xx
reboot
```

## Other links

* Learn
  * [Linuxjourney](https://linuxjourney.com/)
* Blogs
  * [Linuxito](https://www.linuxito.com/)
* linux utils
  * [Fedora science programs](https://fedora-scientific.readthedocs.io/en/latest/)
