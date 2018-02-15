# Crear un usb de una iso

0. `su` Permisos de superusuario.
1. `fdisk -l` buscar localización del USB (sdb, sdc, etc.).
2. `dd if=/path/to/downloaded/iso of=/dev/sdx` Copiar (reemplazar sdx por la correcta ubicación).
