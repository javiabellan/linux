

## [Lecture 1: Course Overview + The Shell](https://www.youtube.com/watch?v=Z56Jmr9Z34Q)

```bash
############## Programas
echo $PATH  # Sitios donde la shell busca programas
which echo  # En que path está el programa echo
man echo    # Muestra el manual de un programa

############## Sitios
/sys        # Los ficheros representan los propios devices del ordenador
  se puede cambiar el brillo de la pantalla, los leds, etc

############## Atajos
CTRL + l   # Clean terminal
CTRL + c   # Parar programa

############# Navigate
pwd         # prin working directory
cd          # change directory
  cd        #   go to home
  cd ~      #   go to home
  cd /      #   go to root
  cd -      #   go to previous dir
ls          # list directories
  ls -a     #   show hidden too
  ls -l     #   show long (more info)

############# Files and dirs
mv {old_pth} {new_pth} # Move or rename a file
cp {from_pth} {to_pth} # Copy a file
rm {pth}               # Remove a file
  rm -r {pth}          # Remove a directory recusively
  rmdir {pth}          # Remove an empty directory
mkdir {pth}            # Make a directory
  mkdir My\ photos     # Make a directory with spaces
  mkdir "My photos"    # Make a directory with spaces


############# Pipes
echo hello >  hello.txt # Crea (o sobrescribe) un fichero con la salida del programa anterior
echo hello >> hello.txt # Añade (append) a un fichero la salida del programa anterior
ls -l | tail -n2        # Pipe: Imprime solo los ultimos 2 ficheros
ls -l | tail -n2 >  hello.txt # Pipe and file writting


############# Print content of files
head hellow.txt
tail hellow.txt
  tail -n1 hellow.txt # La ultima linea
cat hellow.txt
xdg-open  hellow.txt # Open a file with default program

############# Fechas
date
cal
```


# Pacman
```bash
pacman -S {pkg}    # Install package
pacman -Syu        # Update packages. Update database (-y) and upgrade packages (-u)
pacman -Ss {pkg}   # Search for a new package

pacman -Q          # Display all installed packages
pacman -Qe         # Display only packages explicitly installed
pacman -Qn         # Display only packages installed from main repositories
pacman -Qm         # Display only packages installed from AUR
pacman -Qdt        # Display orphaned dependencies
pacman -Qs {pkg}   # Search local repository for package

pacman -R {pkg}    # Remove package {pkg}
pacman -Rs {pkg}   # Remove package as well as unneeded dependencies (-s)
pacman -Rns {pkg}  # Remove package, dependencies (-s), and system config files (-n)
```

# Entra en la Bios (tecla ?)

### Detecta tu sistema
| Bios (or Legacy)        | UEFI                       |
|-------------------------|----------------------------|
| MRB (Master Boot Rcord) | GPT (GUID Partition Table) |
| Antiguo                 | Nuevo                      |

- [ ] Enable UEFI
- [ ] Disable Secure Boot
- [ ] Disable Fast Boot

## 1. Install Windows

## 2. Install [Manjaro](https://manjaro.org/download)

1. Inserta USB de Manjaro con el PC apagado
2. Elije partición de arraque al encender (tecla F12)
   - Y elije arrancar desde USB en modo UEFI
3. Selecciona el **Driver**:
   - **free**: Si no tienes GPU
   - **nonfree**: Si tienes GPU Nvidia (o AMD)
4. Particiones

|                           | Size   | Type | File system | Mount point | Flags     |
|---------------------------|--------|------|-------------|-------------|-----------|
| Partición de arranque     | 100 MB | GPT  | fat32       | /boot/efi   | boot, esp |
| Partición SWAP (opcional) | 16 GB  | GPT  | linuxswap   |             | swap      |
| Partición para Manjaro    | Resto  | GPT  | ext4        | /           | root      |



## 3. Prepare Majaro

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

### Software
```
su

pacman -S git
pacman -S htop
pacman -S tree
pacman -S hdf5                       # General purpose library and file format for storing scientific data
pacman -S opencv opencv-samples      # Open Source Computer Vision Library
pacman -S graphviz                   # Graph visualization software
pacman -S openssh

pacman -S python-numpy               # Matrix manipulation
pacman -S python-scipy               # Scientific library for Python. Sparse matrices support
pacman -S python-pandas              # Deal with data
pacman -S python-scikit-learn        # Machine learning
pacman -S python-matplotlib          # Visualization
pacman -S python-seaborn             # Visualization
pacman -S python-nltk                # Natural language processing in Python
pacman -S python-tqdm                # Fast, Extensible Progress Meter
pacman -S python-pytorch-opt-cuda    # Pytorch
pacman -S python-tensorflow-opt-cuda # Tensorflow
```

# SSH

#### En el servidor:
```
sudo systemctl status sshd  # Ver si esta encendido
sudo systemctl start sshd   # Encender
sudo systemctl stop sshd    # Apagar
sudo systemctl enable sshd  # Al arrancar por defecto: encendido
sudo systemctl disable sshd # Al arrancar por defecto: apagado
```

#### En el cliente. Conectar y redirigir puerto 8888 (juypter)
```
ssh javi@192.168.0.103 -L 8888:localhost:8888  # Conectar
jupyter notebook --no-browser                  # Abrir Jupyter
exit                                           # Desconectar
```

## Other links

* Learn
  * [Linuxjourney](https://linuxjourney.com/)
* Blogs
  * [Linuxito](https://www.linuxito.com/)
* linux utils
  * [Fedora science programs](https://fedora-scientific.readthedocs.io/en/latest/)
