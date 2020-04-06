# Entra en la Bios (tecla ?)

### Detecta tu sistema
| Bios (or Legacy)        | UEFI                       |
|-------------------------|----------------------------|
| MRB (Master Boot Rcord) | GPT (GUID Partition Table) |
| Antiguo                 | Nuevo                      |

- [ ] Enable UEFI
- [ ] Disable Secure Boot
- [ ] Disable Fast Boot

# 1. Install Windows

# 2. Install [Manjaro](https://manjaro.org/download)

### Arranca desde USB (tecla F12)

- **Driver**
  - **free**: Si no tienes GPU
  - **nonfree**: Si tienes GPU Nvidia (o AMD)

### Particiones

|                           | Size   | Type | File system | Mount point | Flags     |
|---------------------------|--------|------|-------------|-------------|-----------|
| Partición de arranque     | 100 MB | GPT  | fat32       | /boot/efi   | boot, esp |
| Partición SWAP (opcional) | 16 GB  | GPT  | linuxswap   |             | swap      |
| Partición para Manjaro    | Resto  | GPT  | ext4        | /           | root      |



# 3. Prepare Majaro

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
