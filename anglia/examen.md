## Examen: Configuración de Servicios en Linux

**Duración**: 1 hora

**Instrucciones**: Responda a todas las preguntas. Algunas preguntas son de selección múltiple, otras requieren respuesta breve. Se valorará la claridad y precisión.

### Parte 1 
Preguntas de Selección Múltiple (5 puntos por pregunta)

    ¿Qué archivo contiene la configuración del servicio inetd en una máquina Linux?
    a) /etc/inetd.d
    b) /etc/inetd.conf
    c) /usr/local/inetd/config
    d) /var/log/inetd.conf

    ¿Qué comando se utiliza para reiniciar el servicio inetd después de modificar su configuración?
    a) service inetd restart
    b) systemctl reload inetd
    c) kill -HUP [PID]
    d) inetd --restart

    ¿Qué daemon se utiliza para gestionar el protocolo SMB en Linux?
    a) vsftpd
    b) nmbd
    c) smbd
    d) httpd

    ¿Qué puerto utiliza el protocolo SMTP para el envío de correos electrónicos?
    a) 80
    b) 110
    c) 25
    d) 21

    En el servicio Apache, ¿qué directiva se utiliza para definir la ubicación de los archivos web por defecto?
    a) ServerRoot
    b) DocumentRoot
    c) ServerName
    d) DirectoryIndex

---

    ¿Qué daemon se utiliza para gestionar el protocolo SMTP en Linux?
    a) vsftpd
    b) sendmail
    c) smbd
    d) httpd

    ¿Qué puerto utiliza el protocolo SMTP para el envío de correos electrónicos?
    a) 80
    b) 110
    c) 25
    d) 21

    ¿Qué comando se utiliza para verificar si el daemon sendmail está en ejecución?
    a) ps aux | grep sendmail
    b) service sendmail status
    c) netstat -an | grep 25
    d) Todas las anteriores
    
### Parte 2 
Respuesta Corta (10 puntos por pregunta)

- Explica cómo crear un nuevo usuario en el sistema Linux y asignarle permisos para ejecutar scripts en el directorio /home/ncs.

- Describe el proceso para habilitar y probar el servicio FTP en un sistema Slackware utilizando inetd.

- Menciona dos diferencias clave entre los protocolos POP3 e IMAP para la gestión de correo electrónico.

- ¿Qué hace el comando chmod 775 sobre un archivo? Explica el significado de cada número en los permisos resultantes.

### Parte 3
Ejercicio Práctico (35 puntos)

- Configuración básica de Apache y PHP
Imagina que has instalado Apache en tu máquina Linux. Indica los pasos necesarios para:

- Modificar el archivo de configuración para que Apache interprete archivos PHP.
Reiniciar el servicio para aplicar los cambios.
Verificar que el servicio está en ejecución y accesible desde el navegador.

### Valoración:

- Parte 1 (Selección Múltiple): 25 puntos
- Parte 2 (Respuesta Corta): 40 puntos
- Parte 3 (Ejercicio Práctico): 35 puntos

