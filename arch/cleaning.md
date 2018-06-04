## Clean pacman package cache.

```
ls /var/cache/pacman/pkg/ | less # Ver paquetes (diponibles?)
du -sh /var/cache/pacman/pkg/    # Ver tamaño carpeta
sudo pacman -Sc                  # Remove old and unused pkgs
sudo pacman -Scc                 # Remove files from cache
paccache                         # ???
```

## Remove unused packges (orphans).
```
sudo pacman -Qtdq                # List orphans
sudo pacman -R $(pacman -Qtdq)   # Remove orphans
```

## Clean cache in your /home.
```
du -sh ~/.cache/                 # Ver tamaño carpeta
rm -rf ~/.cache/*                # Remove 
```

## Remove old config files.
Ver `~/.config/` y `~/.local/share/`



## Disk usage

Find largest files and directories.

```
sudo pacman -S ncdu              # Intall ncdu
```
Filelight is a GUI program
Baobab is other GUI program (gnome)


## Disk cleaning programs

Find and remove:

* duplicates
* empty files
* empty directories
* broken symlinks.

```
sudo pacman -S rmlint            # Intall rmlint
```

BleachBit is a GUI program


## Reference

https://youtu.be/3OoMvyHYWDY
