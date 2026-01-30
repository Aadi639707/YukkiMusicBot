# Naya aur stable Python version use kar rahe hain
FROM python:3.10-slim-bullseye

# System updates aur zaroori tools install kar rahe hain
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    ffmpeg \
    git \
    python3-pip \
    gcc \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Working directory set kar rahe hain
WORKDIR /app/

# Saari files copy kar rahe hain
COPY . /app/

# Requirements install kar rahe hain (Speed ke liye cache disable kiya hai)
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

# Bot start karne ki command
CMD ["bash", "start"]
