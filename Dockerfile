FROM python:3.11-slim

WORKDIR /app

# System dependencies for OpenCV and ddddocr
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Bot code
COPY bot.py .

ENV BOT_PORT=8099

CMD ["python", "bot.py"]
