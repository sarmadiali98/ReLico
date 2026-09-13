#include <Arduino.h>
#include <DHT.h>

// Pin definitions
#define DHT_PIN 27
#define LDR_PIN 34
#define PIR_PIN 35

// DHT sensor type
#define DHT_TYPE DHT22

// Create DHT object
DHT dht(DHT_PIN, DHT_TYPE);

void setup() {
  // Initialize serial communication at 115200 baud
  Serial.begin(115200);
  
  // Initialize DHT sensor
  dht.begin();
  
  // Configure input pins
  pinMode(LDR_PIN, INPUT);
  pinMode(PIR_PIN, INPUT);
  
  // Wait for sensor stabilization
  delay(2000);
}

void loop() {
  // Read temperature and humidity from DHT22
  float temp = dht.readTemperature();
  float humidity = dht.readHumidity();
  
  int light = digitalRead(LDR_PIN);
  
  // Read motion sensor (0 = no motion, 1 = motion detected)
  int motion = digitalRead(PIR_PIN);
  
  // Send data as JSON format for easy parsing
  Serial.print("{\"temp\":");
  Serial.print(isnan(temp) ? 0 : temp);
  Serial.print(",\"humidity\":");
  Serial.print(isnan(humidity) ? 0 : humidity);
  Serial.print(",\"light\":");
  Serial.print(light);
  Serial.print(",\"motion\":");
  Serial.print(motion);
  Serial.println("}");
  
  // Send data every 1 second
  delay(1000);
}
