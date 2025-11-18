# FROM python:3.9-slim-buster

# WORKDIR /app

# COPY requirements.txt .

# RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

# EXPOSE 8000

# CMD ["python", "manage.py"]

# Lightweight Python base image
FROM python:3.10-slim

# Prevent python from buffering stdout
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install OS dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Copy your project code
COPY . .

# Expose Django port
EXPOSE 8000

# Default command (runserver)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

