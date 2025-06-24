chmod +x instalar_piclock.sh
./instalar_piclock.sh

#!/bin/bash
echo "🚀 Instalando PiClock en Raspbian Buster Legacy..."

# 1. Actualización
sudo apt-get update && sudo apt-get upgrade -y

# 2. Dependencias
sudo apt-get install python2 python-qt4 python-dateutil python-feedparser python-imaging python-requests python-tzlocal git -y

# 3. Clonar PiClock
cd /home/pi
git clone https://github.com/n0bel/PiClock.git
cd PiClock/Clock

# 4. Configuración de claves API y ubicación
cp ApiKeys-example.py ApiKeys.py
cp Config-Example.py Config.py

# 5. Crear servicio systemd
sudo tee /etc/systemd/system/piclock.service > /dev/null <<EOF
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
EOF

# 6. Activar el servicio
sudo systemctl daemon-reload
sudo systemctl enable piclock.service
sudo systemctl start piclock.service

# 7. Desactivar apagado de pantalla
mkdir -p ~/.config/lxsession/LXDE-pi
echo -e "@xset s off\n@xset -dpms\n@xset s noblank" >> ~/.config/lxsession/LXDE-pi/autostart

echo "✅ Instalación completada. Edita tus claves en: ~/PiClock/Clock/ApiKeys.py"
echo "🕰️ El reloj se iniciará automáticamente al arrancar tu Raspberry Pi."
