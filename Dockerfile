FROM python:3.9

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && pip install mysqlclient \
    && pip install -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

COPY backend /app/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

