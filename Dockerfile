FROM python:3.9

# Step 1: Workdir should be /app (not /app/backend)
WORKDIR /app

# Step 2: Copy only the requirements.txt from backend folder
COPY backend/requirements.txt /app/

# Step 3: Install system dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Step 4: Install Python packages
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the full backend folder into /app/
COPY backend /app/

# Step 6: Expose port
EXPOSE 8000

# Step 7: Start the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
