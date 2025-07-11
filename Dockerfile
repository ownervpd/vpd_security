# Wir starten mit einem offiziellen, schlanken Python-Image
FROM python:3.11-slim

# Wir installieren unsere System-Abhängigkeiten. Das ist der Befehl, den Render blockiert hat.
# Hier haben wir die volle Kontrolle.
RUN apt-get update && apt-get install -y libopus-dev ffmpeg

# Wir setzen das Arbeitsverzeichnis im Container
WORKDIR /app

# Wir kopieren die requirements.txt in den Container und installieren die Python-Pakete
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Wir kopieren den Rest unseres Bot-Codes in den Container
COPY . .

# Das ist der Befehl, der den Bot startet
CMD ["python", "main.py"]