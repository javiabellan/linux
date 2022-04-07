

# Index

| General                            | Programs          | Programmig              |
|------------------------------------|-------------------|-------------------------|
| [The Shell](#the-shell)            | [GIT](#git)       | [Debugging](#debugging) |
| [IO Redirection](#io-redirection)  | [](#vim)       | [Profiling](#profiling) |
| [Pipes](#pipes)                    | [TMUX](#tmux)     | [Makefile](#makefile)   |
| [Scripts](#scripts)                | [ZSH](#zsh)       | [Cryptography](#cryptography)   |
| [Alias](#alias)                    | [SSH](#ssh)       |                         |
|                                    | [Pacman](#pacman) |                         |


### Shells

| Terminal        | Promt | Hashbang/Shebang | Configuration file |
|-----------------|:------|------------------|--------------------|
| `sh`            |  `$`  | `#!/bin/sh`      |                    |
| `bash`          |  `$`  | `#!/bin/bash`    | `.bashrc`          |
| `zsh`           |  `$`  | `#!/bin/zsh`     |                    |
| `csh` or `tcsh` |  `%`  | `#!/bin/csh`     |                    |

# Hard drives

1. See available drives
   - Option 1: `lsblk`
   - Option 2: `fdisk -l`
   - Option 3: `ls /dev/sd??`
2. Mount
   1. `sudo mkdir /hdd`
   2. `sudo mount -t auto /dev/sda1 /hdd`
3. Umount
   - `umount /hdd`


# [Ruby](https://wiki.archlinux.org/title/ruby) 

> Ruby gems are installed inside `.local/share/gem/ruby/3.0.0/gems/`

https://stackoverflow.com/questions/69724440/jekyll-crash-on-generation-segmentation-fault

### Install Jekyll (a Ruby gem)

1) On the home directory:

```bash
sudo pacman -S ruby ruby-rdoc gcc make

# Install the bundler
gem install bundle
```

2) On the project directory (the one containing the `Gemfile` file)

```bash
# install gems of the Gemfile (jekyll, ...)
bundle install

# Lauch page locally
bundle exec jekyll serve --livereload
bundle exec jekyll serve --livereload --watch --baseurl "" --trace`
```

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

> - `tree`
> - `broot`
> - `nnn`
> - `ranger`


### Disk usage
- `du`: **d**isk **u**sage
  - `du -sh */ | sort -rh`
- `dust`
- `duf`
- `df /`


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
  - https://ferd.ca/awk-in-20-minutes.html

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

> https://programminghistorian.org/en/lessons/json-and-jq
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
- `touch` Create a new file or changes the Last Modified time of an existing file.
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








### Search

- `find`: search on many paths
  - `find /etc`
  - `find {where} -name {what} -type {what type}`
  - `find . -name src -type d` Find all directories named src
  - `find . -path '*/test/*.py' -type f` Find all python files that have a folder named test in their path
  - `find . -mtime -1` Find all files modified in the last day
  - `find . -size +500k -size -10M -name '*.tar.gz'` Find all zip files with size in range 500k to 10M
  - `find . -name '*.tmp' -exec rm {} \;` Delete all files with .tmp extension
  - `find . -name '*.png' -exec convert {} {}.jpg \;` Find all PNG files and convert them to JPG
- [`fd`](https://github.com/sharkdp/fd): a simple, fast, and user-friendly alternative to `find`.
- `updatedb` and `locate`: indexed search.
  - `updatedb` compiles some sort of indexed database for quickly searching. Usually updated daily via `cron`
  - `locate` uses the database for quickly searching.

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
Protocolo para dejar el ordenador lejos (hasta 100 metros de distancia) y conetar todo (video, USB) por un cable Ethernet (categoría 5E para distancias cortas o categoria 6 o 7 para distancias largas).


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





# ZSH

Change to zsh: `sudo chsh -s /usr/bin/zsh javi`
curl -L http://install.ohmyz.sh | sh






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



# Static program analisis

```bash
pyflakes my_program.py
mypy my_program.py
```




# Documents

- `pandoc`: Conversion between markup formats
- `aspell`: A spell checker designed to eventually replace Ispell


# iso image to USB

1. `sudo fdisk -l` buscar localización del USB (sdb, sdc, etc.).
2. `sudo dd bs=4M if=/path/to/downloaded/iso of=/dev/sdx status=progress oflag=sync` Copiar (reemplazar sdx por la correcta ubicación).


