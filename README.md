# PiClock-Eddy
🕰️ PiClock con Raspberry Pi – Instalación Paso a Paso (Raspbian Buster Legacy)
Autor: Eddy Fecha: Junio 2025 Descripción: Guía práctica para instalar PiClock en una Raspberry Pi con la imagen 2019-07-10-Raspbian-Buster-Lite usando Python 2 y PyQt4.

✅ Requisitos
Raspberry Pi con Raspbian Buster Legacy (2019)

Pantalla conectada

Conexión a Internet

Claves API de OpenWeatherMap y Google Maps

🔧 Paso 1 – Actualizar sistema
bash
sudo apt-get update
sudo apt-get upgrade -y
🐍 Paso 2 – Instalar dependencias
bash
sudo apt-get install python2 python-qt4 python-dateutil python-feedparser python-imaging python-requests python-tzlocal git -y
📦 Paso 3 – Clonar PiClock
bash
cd ~
git clone https://github.com/n0bel/PiClock.git
cd PiClock
🔑 Paso 4 – Configurar claves API
bash
cd Clock
cp ApiKeys-example.py ApiKeys.py
nano ApiKeys.py
Reemplaza las claves:

python
owm_api = 'TU_API_OPENWEATHERMAP'
googleapi = 'TU_API_GOOGLE_MAPS'
🌎 Paso 5 – Configurar ubicación
bash
cp Config-Example.py Config.py
nano Config.py
Cambia tu lat/lon:

python
primary_coordinates = 26.6359, -80.09615
🧪 Paso 6 – Prueba manual del reloj
bash
python2 PyQtPiClock.py
🔁 Paso 7 – Actualizar proyecto (opcional)
bash
cd ~/PiClock
git pull
python update.py
⚙️ Paso 8 – Arranque automático con systemd
bash
sudo nano /etc/systemd/system/piclock.service
Contenido del archivo:

ini
[Unit]
Description=PiClock auto start
After=graphical.target

[Service]
Type=simple
User=pi
Environment=DISPLAY=:0
Environment=XAUTHORITY=/home/pi/.Xauthority
WorkingDirectory=/home/pi/PiClock/Clock
ExecStart=/usr/bin/python2 /home/pi/PiClock/Clock/PyQtPiClock.py
Restart=always

[Install]
WantedBy=graphical.target
Activa el servicio:

bash
sudo systemctl daemon-reload
sudo systemctl enable piclock.service
sudo systemctl start piclock.service
💤 Paso 9 – Prevenir apagado de pantalla
bash
mkdir -p ~/.config/lxsession/LXDE-pi
nano ~/.config/lxsession/LXDE-pi/autostart
Agrega:

bash
@xset s off
@xset -dpms
@xset s noblank
📷 Paso 10 – ¡Listo!
Tu PiClock arranca automáticamente al prender la Raspberry. ¡Perfecto para mostrar el clima, reloj y radar en tiempo real!

🎬 Enlace al Video de YouTube
🔗 [Próximamente…]

☕ Créditos
Gracias a n0bel por el proyecto original de PiClock, y a toda la comunidad Raspberry por hacerlo crecer ❤️
