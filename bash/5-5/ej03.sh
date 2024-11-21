#Formato del archivo /etc/anacrontab

7 10 backup.weekly /home/joancadi/scripts/backup.sh

# A los 7 días, o en momento que se inicie el ordenador y se detecte que llevamos 
# más de 7 días sin realizar la copia, Cron llamará a Anacron y se iniciará el proceso 
# para realizar la copia de seguridad. Se realizará una pausa de 10 minutos y acto seguido 
# se realizará  la copia de seguridad


periodo_tarea: 
Indicamos la frecuencia en días con que queremos que se ejecute la tarea. 
Si la ejecución de la tarea tiene que ser diaria escribiremos 1 o @daily. 
Si es semanal escribiremos 7 o @weekly, si es mensual escribiremos 30 o @monthly
Si queremos que se ejecute cada dos días escribiremos 2.

• retardo_ejecución: 
Es un número entero que indica los minutos que transcurren desde que Anacron 
detecta que hay que ejecutar el comando o script hasta que se ejecuta. El retraso 
entre la detección de ejecución y la ejecución puede ser útil para evitar sobrecargas 
de CPU y memoria si se tienen que realizar muchas tareas de forma simultánea.

• Identificador: 
Un nombre cualquiera que describe e identifica la tarea que se ejecutará.
Este nombre nos servirá para por ejemplo buscar información en los logs.

• Comando: Detallamos el comando o script que queremos ejecutar.