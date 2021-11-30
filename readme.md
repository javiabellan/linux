# Index

| General                            | Programs          | Programmig              |
|------------------------------------|-------------------|-------------------------|
| [The Shell](#the-shell)            | [GIT](#git)       | [Debugging](#debugging) |
| [IO Redirection](#io-redirection)  | [VIM](#vim)       | [Profiling](#profiling) |
| [Pipes](#pipes)                    | [TMUX](#tmux)     | [Makefile](#makefile)   |
| [Scripts](#scripts)                | [ZSH](#zsh)       | [Cryptography](#cryptography)   |
| [Alias](#alias)                    | [SSH](#ssh)       |                         |
|                                    | [Pacman](#pacman) |                         |

# Jekyll

### Install Jekyll (Ruby package)

```
sudo pacman -S ruby ruby-rdoc gcc make

gem update
gem install jekyll
gem install webrick
```

### Run Jekyll locally
`jekyll serve`
`jekyll serve --watch --baseurl "" --trace`

### Navigate
- `pwd`: **p**rint **w**orking **d**irectory
- `cd` **c**hange **d**irectory
  - `cd`: go to home
  - `cd ~`: go to home
  - `cd /`: go to root
  - `cd -`: go to previous dir
- `ls`: **l**i**s**t directories
  - `ls -a`: show hidden too
  - `ls -l`: show long (more info: permissions, size, date)
  - `ls -lh: Human readable size
  - `ls -S: Sort files by size 
  - `ls *.png`: only png files
  - `ls *.??g`: only png and jpg files
- `du`: **d**isk **u**sage
  - `du -sh */ | sort -rh`
  
> - `tree`
> - `broot`
> - `nnn`
> - `ranger`

### See files

- **`cat`**: con**cat**enate and print files.
- **`less`**: Interactive file viwer. Load the file dynamically (faster)
  - `less -N` Add line number
- **`more`**:
- **`head`**: shows the beginning of a file (defaults to first 10 lines).
   - `head -n5`: only 5 lines
- **`tail`**: shows the ending of a file (defaults to last 10 lines).
   - `tail -n5`: only 5 lines
- **`hexdump`**: Para ver ficheros binarios
- **`xxd`**: make a hexdump or do the reverse.
- `xdg-open  myFile.txt`: Open a file with default program


### See content

- **`sort`**: Sorting
  - `sort -r`: Reverse order
  - `sort -n`: Numerically
  - `sort -rn`: Numerically reversed
  - `sort --field-separator=',' --key=2,1,3 {file}`: Sort a CSV file by 2nd, 1st and 3rd columns.
  - `sort -R`: Randomly (each time is different). Similar to **`shuf`**
- **`uniq`** See **uniq**ues. **need to `sort` first**.
  - `uniq -c`: Count uniques
- **`wc`:** count lines, words and chars
  - `wc -l`: count only lines
  - `wc -w`: count only words
  - `wc -c`: count only chars
- **`column`**: Display in **column**s
  - `column iris.csv -t -s ,`
  - `column file.csv -s "," -t | less -#2 -N -S`: CSV viewer
- **`cut`**: Selecting fields (columns) (default is to delimit by tab).
  - `cut -d',' -f1`: Delimiter="," Field (col)=1st
  - `cut -d, -f 2`: Delimit by coma (CSV). Select 2nd field.
  - `cut -d, -f 2,3`: Delimit by coma (CSV). Select 2nd and 3rd fields.
  - `cut -d, -f-4,6-`: Delimit by coma (CSV). Select all except 5th field.
  - `cut -c 5-`: skip the first 4 characters of each line (start on the 5th char).
- **`paste`**: join 2 (or more) files line by line
- **`split`**: split a file into pieces (less useful)
- **`nl`**: prepend line numbers
- **`tr`** Translate (replace) patterns.
  - `tr '\t' ,` Replace tabs with commas (TSV to CSV)
  - `tr '[:upper:]' '[:lower:]'` **tr**anslate from upper to lower characters
  - `tr -d " "` **D**elete some pattern
  - `tr -s " "` **S**queeze multiple occurrences (convert a consecutive repeated character into a single one)
- **`grep`**: print lines matching a pattern
- **`egrep`**: can handle extended regular expressions (EREs)
- **`sed`**: stream editor for filtering and transforming text. replace (and much more). useful for search and replace - one liners
- **`awk`**: pattern scanning and text processing language, useful for tab-delimited data - one liners (default is to delimit by spaces)
  - `awk '{print "First column " $1 " second column " $2}'`
  - `awk -F "|" '{print $1}'` Use awk as the `cut` command to get a specific column by saying the separator
  - https://stackoverflow.com/tags/awk/info

### Parsing PDF: [`Xpdf`](https://www.xpdfreader.com) or [`poppler`](https://poppler.freedesktop.org)

- **Xpdf**
  - `xpdf`: PDF viewer (click for a screenshot)
  - `pdftotext`: converts PDF to text
  - `pdftops`: converts PDF to PostScript
  - `pdftoppm`: converts PDF pages to netpbm (PPM/PGM/PBM) image files
  - `pdftopng`: converts PDF pages to PNG image files
  - `pdftohtml`: converts PDF to HTML
  - `pdfinfo`: extracts PDF metadata
  - `pdfimages`: extracts raw images from PDF files
  - `pdffonts`: lists fonts used in PDF files
  - `pdfdetach`: extracts attached files from PDF files
- **Poppler**
  - `pdfattach`
  - `pdfdetach`
  - `pdffonts`
  - `pdfimages`
  - `pdfinfo`
  - `pdfseparate`
  - `pdfsig`
  - `pdftocairo`
  - `pdftohtml`
  - `pdftoppm`
  - `pdftops`
  - **`pdftotext`**: Portable Document Format (PDF) to text converter
     - `pdftotext [options] someFile.pdf`
  - `pdfunite`
- **textutil**: Only in MacOS (Usado por Pascual Perez)
  - `textutil -convert txt ~/Desktop/DrectorioDeArchivosEnPDF/*.pdf`

### Parsing HTML: [`pup`](https://github.com/ericchiang/pup)

- **Filter by tag**: `cat robots.html | pup 'title'`
- **Filter by tag with id**: `cat robots.html | pup 'span#See_also'`
- **Filter by tag with class**: `cat robots.html | pup 'table.someClass'`
- **Filter by tag with attribute**: `cat robots.html | pup 'th[scope="row"]'`

### Parsing JSON: `jq`

- **HTML table to csv**: `cat wiki.html | pup "table.wikitable tbody tr json{}" | jq '.[] | .children | "\(.[0].text),\(.[1].text),\(.[2].text)"' -r`
- table.json jq -r '.tbody.tr[1:][] | [.td[]["$t"]] | @csv'

> https://www.datascienceatthecommandline.com/2e/chapter-5-scrubbing-data.html


### Compare files

- `diff {file1} {file2}`: See differencs between files
- `sdiff {file1} {file2}`: side-by-side merge of file differences
- `cmp {file1} {file2}`: See differencs between files
- `comm`: select or reject lines **comm**on to two files


### Multimedia

- [**ImageMagick**](http://www.imagemagick.org/script/index.php)
- **`youtube-dl`**:
- **`ffmepg`**: Video and audio
- **`convert`**: Images
  - `convert imagen.jpg imagen.png` # Convertir una imagen de png a jpg
  - `convert imagen.{png,jpg}` # Expansion. Same of: convert imagen.jpg imagen.png
  - `convert image.jpg -crop 703x470+3+5 output.jpg` Crop image with *width x height + left + top* format:
- **`sox`**: **so**und e**x**change, the Swiss Army knife of audio manipulation.
  - `play -n synth sin 1270 0.2 sin 1300 sin 1337 0.2 remix 1-3 repeat 0 vol 0.8 chorus 0.5 0.9 42 0.5 5 0.8 -t bandpass -c 1300 0.5q` # You can use sox to try to replicate the sound of the BroodX Cicadas using a mix of 3 tones around 1300 Hz.

# Generate data
- touch
- echo "bla bla bla" > file.txt
- seq
  - seq 10
  - seq 3 9
- primes 1 100

# Plotting

- `gnuplot`
  - `gnuplot -e "set terminal jpeg; plot [-5:5] sin(x)" | display`
  - `gnuplot -e "set terminal jpeg; plot [-5:5] sin(x)" > sin.jpg`
  - `primes 1 100 | gnuplot -p -e 'plot "/dev/stdin"'`
- `feedgnuplot`
  - https://github.com/dkogan/feedgnuplot/blob/master/guide/guide.org 



# Regular Expressions
- `*`: Matches zero or more.
- `{a,b,c}`: [**Brace Expansion**](https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html). Examples:
  - `ls some_dir/{subdir_A,subdir_B}`
  - `mkdir {old,new,dist,bugs}`
- [**Pattern Matching**](https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html)
  - `?(pattern-list)`: Matches zero or one occurrence of the given patterns.
  - `*(pattern-list)`: Matches zero or more occurrences of the given patterns.
  - `+(pattern-list)`: Matches one or more occurrences of the given patterns.
  - `@(pattern-list)`: Matches one of the given patterns.
  - `!(pattern-list)`: Matches anything except one of the given patterns.


> #### Reference
> `man re_format`
> https://remram44.github.io/regex-cheatsheet/regex.html





### Search
- `find`: non-indexed search
  - `find /etc`
  - `find {where} -name {what} -type {what type}`
- `locate`: indexed search

#### See current date
- `date`
- `cal`


# SQL

- **[Q](http://harelba.github.io/q)**: SQL over CSVs


---

# Set NTP time

```bash
sudo pacman -S ntp
sudo timedatectl set-ntp true
```

# HDBaseT
protocolo para dejar el ordenador lejos (hasta 100 metros de distancia) y conetar todo (video, USB) por un cable Ethernet (categoría 5E para distancias cortas o categoria 6 o 7 para distancias largas).


# The Shell


```bash
############## Programas
printf "dfadf" # Sitios donde la shell busca programas
echo $PATH  # Sitios donde la shell busca programas
which echo  # En que path está el programa echo
man echo    # Muestra el manual de un programa
tldr echo   # Muestra el manual de ejemplos de un programa
lsb_release -a # Ver mi sistema operativo

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
my_command_2 && my_command_2 # Do my_command_2 only if my_command_2 was success
fg          # Bring the job to the foreground.
bg          # Send the job to the background.
stop {PID} or Ctrl + z          # Suspend the job.
kill {PID} or Ctrl + c          # Terminate the job.

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
tar {file1}            # compress file






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


# Alias

```bash
# ZSH pluggins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


# General
alias l='lsd'
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

# Disk usage of current dir
alias du='du -sh -- * | sort -h -r'


# Jupyter notebook
alias jn="jupyter notebook"

# Pacman
alias i="sudo pacman -S"        # install a package
alias s="pacman -Ss"            # search for a package
alias u="sudo pacman -Syu"      # update the packages
alias r="sudo pacman -Rns"      # remove a package

alias install="sudo pacman -S"  # install a package
alias search="pacman -Ss"       # search for a package
alias update="sudo pacman -Syu" # update the packages
alias remove="sudo pacman -Rns" # remove a package

# Others
alias title="figlet" # r: remove a package

# Git
function commit() {
    git add .
    msg=$@ # Every argument
    git commit -m "$msg"
    git push
}

# Data wraling
alias uniq="sort | uniq" # uniq reqires previous sorting
alias lc="wc --lines" # lines count
alias wc="wc --words" # words count
alias cc="wc --chars" # chars count
```



















# Jupyter

### [Jupyter extensions](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html)

1. `sudi pip install jupyter_contrib_nbextensions`
2. `sudo jupyter contrib nbextension install`



# Git

### Undo local changes
```bash
git checkout .  # Revert modified files (in this . directory)
git clean -fd   # Remove new untracked files (-f) and new directories (-d): 
```

### Save Github credential
```bash
git config --global credential.helper store  # Almacena en ~/.git-credentials -> https://USER:PASS@github.com
```



# Vim

### Modos
- `:` -> **Command-line**: for running a command
- **Normal**: for moving around a file and making edits
- `i` -> **Insert**: for inserting text
- **Replace**: for replacing text
- **Visual** (plain, line, or block): for selecting blocks of text


### Command-line

Command mode can be entered by typing `:` in Normal mode. Your cursor will jump
to the command line at the bottom of the screen upon pressing `:`. This mode
has many functionalities, including opening, saving, and closing files, and
[quitting Vim](https://twitter.com/iamdevloper/status/435555976687923200).

- `:q` quit (close window)
- `:w` save ("write")
- `:wq` save and quit
- `:e {name of file}` open file for editing
- `:ls` show open buffers
- `:help {topic}` open help
    - `:help :w` opens help for the `:w` command
    - `:help w` opens help for the `w` movement

# TMUX

https://hackernoon.com/using-tmux-to-improve-your-terminal-experience-jt4932zv

The most popular terminal multiplexer these days is [`tmux`](https://www.man7.org/linux/man-pages/man1/tmux.1.html).
- tmux can have several **sessions**.
- a **session** can have several **windows** (like tabs)
- a **window** can have several **panes** (like a divided terminal)

#### Commands:

- **Outside tmux**
  - `tmux`: starts a new session.
  - `tmux new -s NAME`: starts it with that name.
  - `tmux ls`: lists the current sessions.
  - `tmux a`: attaches the last session.
  - `tmux -t sesName`: attaches to specific session.

- **Inside tmux**:
  - `[Ctrl+b] c`: Creates a new window. To close it you can just terminate the shells doing `<C-d>`
  - `[Ctrl+b] 0`: Go to window 0
  - `[Ctrl+b] 1`: Go to window 1
  - `[Ctrl+b] 2`: Go to window 2
  - `[Ctrl+b] p`: Go to the previous window
  - `[Ctrl+b] n`: Go to the next window
  - `[Ctrl+b] ,`: Rename the current window
  - `[Ctrl+b] w`: List current windows
  - `[Ctrl+b] d`: Detaches the current session (remains active in background)
  - `[Ctrl+d]`: Kill the current window (kill the sesion if is it the only window)


- **Panes**: Like vim splits, panes let you have multiple shells in the same visual display.
  - `[Ctrl+b] "` Split the current pane horizontally
  - `[Ctrl+b] %` Split the current pane vertically
  - `[Ctrl+b] <direction>` Move to the pane in the specified _direction_. Direction here means arrow keys.
  - `[Ctrl+b] z` Toggle zoom for the current pane
  - `[Ctrl+b] [` Start scrollback. You can then press `<space>` to start a selection and `<enter>` to copy that selection.
  - `[Ctrl+b] <space>` Cycle through pane arrangements.




# ZSH

Change to zsh: `sudo chsh -s /usr/bin/zsh javi`
curl -L http://install.ohmyz.sh | sh




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
exit                                           # Desconectar o CTL+
```

#### Key generation
```bash
# Gerenar claves publica y privada
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519

# Llevar la clave publica al cliente
cat .ssh/id_ed25519.pub | ssh foobar@remote 'cat >> ~/.ssh/authorized_keys'
```

- `-o`: Save the private-key using the new OpenSSH format rather than the PEM format. Actually, this option is implied when you specify the key type as ed25519.
- `-a`: It’s the numbers of KDF (Key Derivation Function) rounds. Higher numbers result in slower passphrase verification, increasing the resistance to brute-force password cracking should the private-key be stolen.
- `-t`: Specifies the type of key to create, in our case the Ed25519.
- `-f`: Specify the filename of the generated key file. If you want it to be discovered automatically by the SSH agent, it must be stored in the default `.ssh` directory within your home directory.


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



# Jupyter Lab Server

#### On the Remote Server
1. Get the IP address of your server: `$ hostname -I  # 192.168.0.120`
2. Configure Jupyter Lab Password
   - `$ jupyter notebook --generate-config`
   - `$ jupyter notebook password`
   - `Enter password:  ****`
   - `Verify password: ****`
3. Starting Jupyter Lab `$ jupyter-lab --ip 0.0.0.0 --port 8888 --no-browser`

#### On client
1. Navigate to `http://<your-routers-public-ip>:8888`
2. Enter password


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

# YAY

https://www.chrisatmachine.com/Linux/03-AUR-yay/



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
muy_fun() # Long code here
print(time.time() - start)
```

in jupyter:

```python
%time muy_fun()
%timeit -r 2 -n 5 muy_fun() # -r: number of runs, -n: number of loops
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

In jupyter

```python
%load_ext line_profiler

%lprun -f func_to_profile func_to_profile(params)
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




# Makefile

#### `Makefile` file:
```make
TargetFile: DepencyFile1, DepencyFile2
	command1
	command2
```

#### Latex example `Makefile`
```make
paper.pdf: paper.tex plot-data.png
	pdflatex paper.tex

plot-%.png: %.dat plot.py
	./plot.py -i $*.dat -o $@
```

#### Run it with `make`

If the DepencyFiles has not changed, the commands for TargetFile will not be executed.





# Cryptography

#### Hash function: MD5, SHA-1, SHA-256
- Non invertible
- Collision redundant

```bash
md5 myFile.txt
shasum myFile.txt
sha1sum myFile.txt
```

#### Symetric cryptography (1 key)

1. keygen() -> key
2. encrypt(plaintext, key) -> ciphertext
3. decrypt(ciphertext, key) -> plaintext


```bash
# AES
openssl aes-256-cbc -salt -in aaa.py -out aaa.py.enc # Encription
openssl aes-256-cbc -d -in aaa.py.ec -out aaa2.py    # Decryption
```

#### Asymmetric cryptography (public & private keys)


1. keygen() -> public key, private key
   - La clave pública solo se usa para cifrar (la usará el otro)
   - La clave privada solo se usa para descifrar (la usaré yo)
2. encrypt(plaintext, public key) -> ciphertext
3. decrypt(ciphertext, private key) -> plaintext

En general todo aque que quiera que LE LLEGEN los mensajes privados, debe comunicar su public key.
Si AMBOS extremos comunican su public key, la comunicación será cifrada

Ejemplos:
- RSA
- ED25519: more secure

```bash
# RSA
```

#### Hybrid cryptography

Presmisa:
- La Symetric cryptography es rápida
- La Asymmetric cryptography es lenta

Entoces:
Usar la Asymmetric cryptography SOLO PARA INTERCAMBIAR LA CLAVE SIMETRICA. Asi ya se tiene una Symetric cryptography que es más rápida que la Asymmetric




#### Asymmetric cryptography for signing

1. keygen() -> public key, private key
2. sign(message, private key) -> signature
3. verify(message, signature, public key) -> bool  (whether or not the signature is valid)



# Documents

- `pandoc`: Conversion between markup formats
- `aspell`: A spell checker designed to eventually replace Ispell


# iso image to USB

0. `su` Permisos de superusuario.
1. `fdisk -l` buscar localización del USB (sdb, sdc, etc.).
2. `dd if=/path/to/downloaded/iso of=/dev/sdx` Copiar (reemplazar sdx por la correcta ubicación).



# Firewall

```bash
# iptables is already installed. I like ufw.

pacman -S ufw                # Install ufw
ufw enable                   # Enable it only once, when package is installed
ufw status verbose           # Check its status
systemctl start ufw          # Start the firewall
systemctl enable ufw         # Enable the start-up with the system [option a]
systemctl enable ufw.service # Enable the start-up with the system [option b]
```


# Reference

- https://www.datascienceatthecommandline.com/index.html
- https://github.com/rufuspollock/command-line-data-wrangling
- https://adamdrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html
- [Why is using a shell loop to process text considered bad practice?](https://unix.stackexchange.com/questions/169716/why-is-using-a-shell-loop-to-process-text-considered-bad-practice)
- [Documentación de Alvaro Sainz-Pardo](http://docs.alvarosainzpardo.com)
- [Manjaro](https://manjaro.org)
- [Suck less](https://suckless.org)
- The Missing Semester MIT
  - [Curso 2020](https://missing.csail.mit.edu/2020)
  - [Curso 2019](https://missing.csail.mit.edu/2019)
- [Linuxjourney](https://linuxjourney.com/)
- [Linuxito](https://www.linuxito.com/)

