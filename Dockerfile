FROM python:3.9

WORKDIR /app/backend

# Copy dependency file and install OS packages
COPY requirements.txt /app/backend
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . /app/backend

# Expose the Django default port
EXPOSE 8000

# Set the default command to run the development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

