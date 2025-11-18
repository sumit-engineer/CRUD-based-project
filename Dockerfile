# FROM python:3.9-slim-buster

# WORKDIR /app

# COPY requirements.txt .

# RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

# EXPOSE 8000

# CMD ["python", "manage.py"]


FROM python:3.10-slim

# ENV PYTHONUNBUFFERED=1      --- Old

# Set working directory
WORKDIR /app

# Install OS dependencies
# RUN apt-get update && apt-get install -y --no-install-recommends \     --- Old
#     build-essential \
#     && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt .
# RUN pip install --upgrade pip setuptools wheel    --- Old
RUN pip install --no-cache-dir -r requirements.txt

# Copy your project code
COPY . .

# Expose Django port
EXPOSE 8000

# Default command (runserver)
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]    --- Old
CMD ["python", "manage.py"]

