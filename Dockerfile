# Используем официальный образ Python
FROM python:3.12-slim

# Устанавливаем переменные окружения для Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файл с зависимостями
COPY requirements.txt /app/requirements.txt

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь проект в контейнер
COPY . /app

# Устанавливаем переменные окружения по умолчанию
ENV DJANGO_DEBUG=0 \
    DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1 \
    DJANGO_DB_NAME=/app/db.sqlite3

# Открываем порт 8000
EXPOSE 8000

# Команда для запуска приложения
CMD ["sh", "-c", "python manage.py migrate && gunicorn api.wsgi:application --bind 0.0.0.0:8000"]


