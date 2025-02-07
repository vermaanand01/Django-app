# Use official Python 3.9 image
FROM python:3.9

# Set working directory inside container
WORKDIR /app/backend

# Copy and install system dependencies
COPY requirements.txt /app/backend/

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/backend

# Expose port 8000
EXPOSE 8000

# Default command for running the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
