# Ejercicios de iptables (ChatGPT)

## Ejercicio 1: Configuración básica de iptables

Listar las reglas actuales del firewall con:

    sudo iptables -L -v -n

Configurar una regla para bloquear todo el tráfico entrante excepto las conexiones SSH (puerto 22).

Guardar la configuración para que persista después de un reinicio.

## Ejercicio 2: Protección contra ataques con iptables

Bloquear una dirección IP específica (por ejemplo, 192.168.1.100).

Limitar el número de conexiones simultáneas a un puerto (por ejemplo, máximo 3 conexiones simultáneas en el puerto 80).

Implementar una regla para detectar y bloquear intentos de escaneo de puertos.

## Ejercicio 3: Registro y monitoreo de paquetes sospechosos

Configurar iptables para registrar todos los intentos de conexión al puerto 8080 en el archivo de logs del sistema.

Usar el comando tail -f /var/log/syslog o journalctl -f para monitorear intentos de conexión en tiempo real.

## Ejercicio 4: Reglas avanzadas de filtrado

Permitir solo conexiones desde la red interna (192.168.1.0/24) al puerto 3306 (MySQL).

Bloquear tráfico ICMP (ping) desde direcciones externas.

Configurar un límite de 10 paquetes por segundo en conexiones HTTP para mitigar ataques DoS.

## Ejercicio 5: Configuración de un firewall con iptables para un servidor web

Permitir tráfico HTTP (80) y HTTPS (443).

Bloquear todo el tráfico entrante excepto las conexiones establecidas.

Permitir acceso SSH solo desde una IP específica (ejemplo: 203.0.113.10).

Guardar y restaurar las reglas para que se apliquen después de un reinicio.

## Ejercicio 6: Simulación de ataques y defensa

Usar nmap para escanear puertos abiertos en un sistema y verificar las reglas del firewall.

Intentar hacer un ataque de fuerza bruta con Hydra y registrar los intentos en los logs.

Aplicar reglas de iptables para mitigar estos ataques en tiempo real.