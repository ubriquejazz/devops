#include <DHT.h>

// Configuración del sensor de temperatura
#define DHTPIN 2     // Pin digital al que está conectado el sensor DHT
#define DHTTYPE DHT11 // Cambia a DHT22 si usas ese modelo
DHT dht(DHTPIN, DHTTYPE);

// Variables globales
String command = "";

void setup() {
  Serial.begin(9600); // Comunicación serial
  dht.begin();        // Inicializa el sensor
  Serial.println("Interprete de comandos listo. Escribe 'HELP' para ver los comandos disponibles.");
}

void loop() {
  // Verifica si hay datos disponibles en el puerto serie
  if (Serial.available()) {
    command = Serial.readStringUntil('\n'); // Lee el comando hasta un salto de línea
    command.trim();                         // Elimina espacios y caracteres extra
    handleCommand(command);                 // Procesa el comando
  }
}

// Función para manejar los comandos
void handleCommand(String command) {
  if (command.equalsIgnoreCase("HELP")) {
    Serial.println("Comandos disponibles:");
    Serial.println("  LEDON - Enciende el LED interno.");
    Serial.println("  LEDOFF - Apaga el LED interno.");
    Serial.println("  STATUS - Muestra el estado del LED.");
    Serial.println("  GET_TEMP - Obtiene la temperatura actual.");
  } else if (command.equalsIgnoreCase("LEDON")) {
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.println("LED encendido.");
  } else if (command.equalsIgnoreCase("LEDOFF")) {
    digitalWrite(LED_BUILTIN, LOW);
    Serial.println("LED apagado.");
  } else if (command.equalsIgnoreCase("STATUS")) {
    if (digitalRead(LED_BUILTIN) == HIGH) {
      Serial.println("LED está encendido.");
    } else {
      Serial.println("LED está apagado.");
    }
  } else if (command.equalsIgnoreCase("GET_TEMP")) {
    float temp = dht.readTemperature(); // Lee la temperatura en grados Celsius
    if (isnan(temp)) {
      Serial.println("Error al leer la temperatura.");
    } else {
      Serial.print("Temperatura actual: ");
      Serial.print(temp);
      Serial.println(" °C");
    }
  } else {
    Serial.println("Comando no reconocido. Escribe 'HELP' para ver los comandos disponibles.");
  }
}