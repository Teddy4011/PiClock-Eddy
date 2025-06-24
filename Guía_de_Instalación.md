# 🚀 Guía de Instalación – PiClock por Teddy4011

Este instalador automático es compatible con **Raspbian Buster Legacy** y simplifica la instalación completa de PiClock.

---

## 📦 Descarga directa del Instalador

👉 [PiClock_Instalador.zip](https://github.com/Teddy4011/PiClock-Eddy/releases/download/v1.0/PiClock_Instalador.zip)

---

## 💻 Pasos de instalación

```bash
wget https://github.com/Teddy4011/PiClock-Eddy/releases/download/v1.0/PiClock_Instalador.zip
unzip PiClock_Instalador.zip
cd PiClock_Instalador
chmod +x instalar_piclock.sh
./instalar_piclock.sh

> ℹ️ Al finalizar la instalación, el script renombrará automáticamente los archivos de ejemplo:
>
> ```bash
> ApiKeys_example.py → ApiKeys.py  
> Config_example.py  → Config.py
> ```
>
> Esto garantiza que tengas los archivos listos para personalizar sin sobrescribir tus cambios si ya los habías creado antes.

nano ~/PiClock/Clock/ApiKeys.py
nano ~/PiClock/Clock/Config.py
cd ~/PiClock/Clock
python2 PyQtPiClock.py


---

## 👤 Autor

Proyecto mantenido por **Teddy4011**  
🎬 YouTube & GitHub Ready

---

## 🔁 Autoinicio de PiClock al encender

Para que PiClock se inicie automáticamente cuando enciendas tu Raspberry Pi:

1. Abre tu terminal y ejecuta:

```bash
mkdir -p ~/.config/lxsession/LXDE-pi/
nano ~/.config/lxsession/LXDE-pi/autostart
agrega la siguiente linea al nano y salva
@python2 /home/pi/PiClock/Clock/PyQtPiClock.py


---

¡Y listo! 🔧 Tu guía ahora incluirá ese paso tan importante para dejar el reloj funcionando siempre sin intervención. Si quieres luego te ayudo a convertir esa guía en una versión imprimible o PDF, o incluso incluirla como pantalla de ayuda en el reloj mismo 📘🕰️

¿Quieres que lo actualice también en el `README.md` para que esté duplicado en portada? ⏱️📦

Agrego guía de instalación con pasos completos



