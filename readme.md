
# Index


- [The Shell](#the-shell)
- [IO Redirection](#io-redirection)
- [Pipes](#pipes)
- [Scripts](#scripts)
- [SSH](#ssh)
- [Pacman](#pacman)
- [Alias](#alias)
- [Debugging](#debugging)
- [Profiling](#profiling)


---

# The Shell

```bash
############## Programas
echo $PATH  # Sitios donde la shell busca programas
which echo  # En que path está el programa echo
man echo    # Muestra el manual de un programa
tldr echo   # Muestra el manual de ejemplos de un programa

############## Sitios
/sys        # Los ficheros representan los propios devices del ordenador
  # se puede cambiar el brillo de la pantalla, los leds, etc
  cat /sys/class/thermal/thermal_zone*/temp # Ver temperatura CPU

############## Atajos & Signals
CTRL + l   # Clean terminal
CTRL + c   # Interrumpir programa (SIGINT)
CTRL + \   # Salir programa (SIGQUIT)
CTRL + z   # Pausar programa que se puede reunaudar (SIGSTOP)
jobs        # See all the jobs that are running or suspended.
my_command &  # When you append " &"  it becomes a "background job".
fg          # Bring the job to the foreground.
bg          # Send the job to the background.
stop {PID} or Ctrl + z          # Suspend the job.
kill {PID} or Ctrl + c          # Terminate the job.

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
  ls *.png  #   only png files
  ls *.??g  #   only png and jpg files
tree
broot
nnn
ranger

############# Files and dirs
mv {old_pth} {new_pth} # Move or rename a file
cp {from_pth} {to_pth} # Copy a file
rm {pth}               # Remove a file
  rm -r {pth}          # Remove a directory recusively
  rmdir {pth}          # Remove an empty directory
touch {new_file}       # Create a file
mkdir {pth}            # Make a directory
  mkdir My\ photos     # Make a directory with spaces
  mkdir "My photos"    # Make a directory with spaces
ln {from_pth} {to_pth} # Crear acceso directo
  ln {file} {hardlink} # Hard link
  ln -s {file_or_dir} {symlink} # Symbolic link
chmod +x {file}        # Atorgar permisos de ejecución
du {file}              # Disk usage of a file
ncdu {file}            # Interactive version of Disk usage
diff {file1} {file2}   # See differencs between files
tar {file1}            # compress file
find {where} -name {what} -type {what type}  # Find files


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

# IO Redirection
```bash
command >   filename    # Redirect stdout to a file.
command <   filename    # Redirect stdin to the command.
command >>  filename    # Redirect and append stdout to a file.
command 1>  filename    # Redirect stdout to file
command 1>> filename    # Redirect and append stdout to file
command 2>  errorsfile  # Redirect stderr to file
command 2>> errorsfile  # Redirect and append stderr to file
command &>  filename    # Redirect both stdout and stderr to file

command >   /dev/null   # When we dont care about the output of a command
```


# Pipes

```bash
echo hello >  hello.txt # Crea (o sobrescribe) un fichero con la salida del programa anterior
echo hello >> hello.txt # Añade (append) a un fichero la salida del programa anterior
ls -l | tail -n2        # Pipe: Imprime solo los ultimos 2 ficheros
ls -l | tail -n2 >  hello.txt # Pipe and file writting
ls | xargs rm  # | xargs is when the inputs is IN THE ARGUMENTS
rm $(ls)       # same of above
```


# Scripts

[Shebang line](https://en.wikipedia.org/wiki/Shebang_(Unix): First line, This is going to be the interpreter:
- `#!/bin/sh`:  Bourne shell script
- `#!/bin/bash`:  Bash shell script `./myScript.sh`
- `#!/usr/bin/python`:  Python script `./myScript.py`
- `#!/usr/bin/env python`:  Python script (more portable because looks for python comand)  `./myScript.py`


### Python script
```python
#!/usr/bin/python
import sys
for arg in reversed(sys.argv[1:]):
    print(arg)
```

### Bash script
```bash
############## Variables
myVar=someValue
echo $myVar
myVar = someValue      # No funciona con espacios
echo "Value is $myVar" # Imprime: Value is someValue
echo 'Value is $myVar' # Imprime: Value is $myVar


############## Functions
#!/bin/bash
mcd () {
    mkdir -p "$1"
    cd "$1"
}

# $0: The name of the script
# $1: The 1st argument
# $9: The 9th argument


########## command substitution
myDir=$(pwd) # The output of a command in a varaible
echo "we are in $(pwd)"
for file in $(ls)

```

### Images 
```bash
convert imagen.jpg imagen.png # Convertir una imagen de png a jpg
convert imagen.{png,jpg} # Expansion. Same of: convert imagen.jpg imagen.png
```

### Video 
```bash
ffmpeg
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

# Install [Manjaro](https://manjaro.org/download)

Entra en la Bios (tecla ?) y detecta tu sistema
| Bios (or Legacy)        | UEFI                       |
|-------------------------|----------------------------|
| MRB (Master Boot Rcord) | GPT (GUID Partition Table) |
| Antiguo                 | Nuevo                      |

- [ ] Enable UEFI
- [ ] Disable Secure Boot
- [ ] Disable Fast Boot


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


#### Update nvidia driver

```bash
sudo pacman -S linux54-nvidia-440xx     # Update nvidia driver
sudo mhwd -r pci video-nvidia-418xx
reboot
sudo mhwd -i pci video-nvidia-430xx
reboot
```


# Software


```bash
su

pacman -S git
pacman -S htop
pacman -S tree
pacman -S hdf5                       # General purpose library and file format for storing scientific data
pacman -S opencv opencv-samples      # Open Source Computer Vision Library
pacman -S graphviz                   # Graph visualization software
pacman -S openssh

pacman -S python-ipdb                # IPython-enabled Python Debugger
pacman -S python-pyflakes            # Static program analisis
pacman -S mypy                       # Optional static typing for Python 2 and 3

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
```bash
sudo systemctl status sshd  # Ver si esta encendido
sudo systemctl start sshd   # Encender
sudo systemctl stop sshd    # Apagar
sudo systemctl enable sshd  # Al arrancar por defecto: encendido
sudo systemctl disable sshd # Al arrancar por defecto: apagado
```

#### En el cliente. Conectar y redirigir puerto 8888 (juypter)
```bash
ssh javi@192.168.0.103 -L 8888:localhost:8888  # Conectar
jupyter notebook --no-browser                  # Abrir Jupyter
exit                                           # Desconectar
```

#### Key generation
```bash
# Gerenar claves publica y privada
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519

# Llevar la clave publica al cliente
cat .ssh/id_ed25519.pub | ssh foobar@remote 'cat >> ~/.ssh/authorized_keys'
```

#### Dejar un programa largo en ejecucion

Opcion simple
```bash
nohup COMMAND        # Run a command immune to hangups
nohup COMMAND > FILE # Ademas puede guardar su salida estandar en un fichero
```

Opción con programas que mantienen la sesion activa (`tmux` or `screen`)
1. `ssh` log in into your remote box. 
2. `tmux` or `screen`
3. Start the long process you want.
4. Leave/detach `tmux` or `screen` session, but leave your processes running.
   - Ctrl+A then Ctrl+D (para salir de screen)
   - Ctrl+B then Ctrl+D (para salir de tmux)
5. `exit` ssh
6. `ssh` log in into your remote box. 
7. `screen -r` "resume" your screen session, and you can see the output of your process.



# Debugging


#### The lazy way: `print()`


#### Python debugging: `ipdb`
Start the debugger:
- `python -m pdb  my_program.py`
- `python -m ipdb my_program.py`

Debugger commands:
- `s`: step
- `c`: countiue until ends or break
- `p var1`: print value of var1
- `p var1,var2`: print value of var1 and var2
- `p locals()`: print value of all vars
- `l`: list code and see lines
- `b 6`: create a break point at line 6
- `q`: Quit the debugger

#### C/C++ debugging
- [gdb](https://www.gnu.org/software/gdb/)


# Static program analisis
```bash
pyflakes my_program.py
mypy my_program.py
```


# Profiling

#### The lazy way: `time`

in python:
```python
import time

start = time.time()
# Long code here
print(time.time() - start)
```

On the shell: `$ time some_command`
- **`real`**: Real time. Other programs or internet connection affect.
- **`user`**: User time. Amount of time spent in the CPU running user code
- **`sys`**: Syestem time. Amount of time spent in the CPU running kernel code.

#### CPU profiler

There are two main types of CPU profilers:
- **Tracing profilers** keep a record of every function call your program makes.
  - No son muy fiables porque acompañan siempre al programa y esto puede interferir en el rendimiento
- **Sampling profilers** probe your program periodically (commonly every millisecond) and record the program’s stack.

[Here](https://jvns.ca/blog/2017/12/17/how-do-ruby---python-profilers-work-/) is a good intro article if you want more detail on this topic.

#### CPU line profilers

- [line_profiler](https://github.com/pyutils/line_profiler): `pip install line-profiler`
- [pprofile](https://github.com/vpelletier/pprofile): `pacman -S python-pprofile`

```python
import time

@profile
def my_fun():
  time.sleep(2)
  for i in range(3):
    print("print")
    time.sleep(1)
my_fun()
```

```bash
$ kernprof -l -v program_with_my_fun.py

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
     3                                           @profile
     4                                           def my_fun():
     5         1    2002083.0 2002083.0     40.0    time.sleep(2)
     6         4         36.0      9.0      0.0   for i in range(3):
     7         3        188.0     62.7      0.0     print("print")
     8         3    3002333.0 1000777.7     60.0      time.sleep(1)
```


#### Memory profiler

Install with `pip install memory-profiler` or `pacamn -S python-memory-profiler`

```python
@profile
def my_func():
    a = [1] * (10 ** 6)
    b = [2] * (2 * 10 ** 7)
    del b
    return a

my_func()
```


```bash
$ python -m memory_profiler mem.py

Line #    Mem usage    Increment   Line Contents
================================================
     1   38.637 MiB   38.637 MiB   @profile
     2                             def my_func():
     3   46.090 MiB    7.453 MiB       a = [1] * (10 ** 6)
     4  198.715 MiB  152.625 MiB       b = [2] * (2 * 10 ** 7)
     5   46.270 MiB    0.000 MiB       del b
     6   46.270 MiB    0.000 MiB       return a
```

# Alias

```bash
# Jupyter notebook
alias jn="jupyter notebook"

# Pacman
alias i="sudo pacman -S"   # i: install a package
alias s="pacman -Ss"       # s: search for a package
alias u="sudo pacman -Syu" # u: update the packages
alias r="sudo pacman -Rns" # r: remove a package
```

# Reference

- The Missing Semester MIT
  - [Curso 2020](https://missing.csail.mit.edu/2020)
  - [Curso 2019](https://missing.csail.mit.edu/2019)
- [Linuxjourney](https://linuxjourney.com/)
- [Linuxito](https://www.linuxito.com/)
