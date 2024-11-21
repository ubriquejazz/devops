#Formato del archivo /etc/crontab

1. el minuto (número de 0 a 59);
2. la hora (de 0 a 23);

3. el día del mes (de 1 a 31);
4. el mes (de 1 a 12);
5. el día de la semana 

6. el nombre de usuario bajo el que se ejecutará el programa (en el archivo /etc/crontab y 
en los fragmentos ubicados en /etc/cron.d/, pero no en los archivos de cada usuario)

7. el programa a ejecutar

# min hora dia mes dds programa 
# Descargar los datos todas las noches a las 19:25 
25 19 * * * $HOME/descargar.sh 

# ejecutar script.sh a las 08:00 en días de semana (Lunes a Viernes) 
00 08 * * 1-5 /scripts/script.sh 

# Reiniciar el proxy IRC luego de cada reinicio 
@reboot /usr/bin/resetproxyirc
