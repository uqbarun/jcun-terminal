# Configuración

Probado en Ubuntu 20.04.4 LTS
1. Fuente tipográfica `fc-match JCUN:style=Italic`
2. Personalización el emulador del terminal *XTerm* `xrdb -q`
3. Prompt de bash `echo $PS1`
4. Instalar img2sixel `img2sixel -V`

# Fuente tipográfica

1. Descargar fuente *JCUN-Italic* de https://drive.google.com/file/d/1X_0mWgabwO54IWNtCmVsaIoNUWJtSGFE/view?usp=sharing
2. Instalar la fuente o copiarla a `~/.local/share/fonts` 
3. Correr `sudo fc-cache -f`
4. Verificar
```bash
fc-match JCUN:style=Italic
```
```bash
JCUN-Italic.ttf: "JCUN" "Italic"
```

# Personalización el emulador del terminal XTerm
Se asume que se ha instalado Xterm
1. En `vim ~/.Xresources`
```
*customization: -color
XTerm.vt100.faceName: JCUN:style=Italic
XTerm.vt100.faceSize: 18
XTerm.vt100.background: rgb:1e/1e/1e
XTerm.vt100.color0: rgb:1e/1e/1e
XTerm.vt100.color2: rgb:70/ff/00
XTerm.vt100.color4: rgb:0/ff/d1
XTerm*decTerminalID: vt340
XTerm*numColorRegisters: 256
```
2. Luego `xrdb ~/.Xresources`
3. Comprobamos con `xrdb -q`
4. Finalemnte `xterm`

Es posible aumentar el tamaño de la fuente con la bandera `fs`
```bash
xterm -fs 25
```

*Nota:* XTerm no soporta emojis
# Prompt de bash
Exportar esta variable a tu sesión de Bash
```bash
PS1='\[\033[32m\]JC\[\033[34m\]@\[\033[32m\]UN:\[\033[00m\]\w\[\033[34m\]# \[\033[00m\]'
```
Se recomienda salvar el valor de la variable original (que está `.bashrc`) antes de hacerla persistente. [¿Como crear variables de entorno globales persistentes?](https://platzi.com/tutoriales/1748-terminal/9232-como-crear-variables-de-entorno-globales-persistentes/)

# Instalar img2sixel
```bash
sudo apt install libsixel-bin
```
[Manual de img2sixel](https://github.com/saitoha/libsixel#img2sixel)
