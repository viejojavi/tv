#Instalar XUIone
apt-get update
apt-get upgrade
wget "https://update.xui.one/XUI_1.5.12.zip" -O /tmp/XUI_1.5.12.zip
cd /tmp
apt install zip unzip -y ; unzip XUI_1.5.12.zip
./install
wget "http://tvstarlife.art/xui_crack.tar.gz" -O /tmp/xui_crack.tar.gz
cd /tmp
tar -xf xui_crack.tar.gz
sh /tmp/install.sh

#Opciones xui
#Detener el panel XUI.ONE
#/home/xui/service stop
#Iniciar el panel XUI.ONE
#/home/xui/service start
#Actualizar base de datos
#/home/xui/status
#Lista de herramientas
#/home/xui/tools
#Crear “código de acceso” de rescate
#/home/xui/tools rescue
#Crear un “usuario administrador” de rescate
#/home/xui/tools user
#Volver a autrizar los balanceadores de carga en MySQL
#/home/xui/tools mysql
#Restaurar una base de datos en blanco
#/home/xui/tools database
#Borrar base de datos de migración
#/home/xui/tools migration
#Eliminar todas las IP bloqueadas
#/home/xui/tools flush
#Regenerar puertos desde MySQL
#/home/xui/tools ports
#Regenerar código de acceso desde MySQL
#/home/xui/tools access
#Generación rápida de copia de seguridad completa
#mysqldump -u root xui > xuiLT-backup.sql
#Restaurar la copia de seguridad seleccionada en la base de datos XUI
#mysql -u root xui < path/backup/file.sql
