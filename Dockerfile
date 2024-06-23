# Вказуємо базовий образ
FROM python:3.10-slim

# Встановлюємо залежності для PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev gcc

# Встановлюємо залежності Python
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Копіюємо файли проекту
COPY . /app

# Вказуємо робочий каталог
WORKDIR /app

# Відкриваємо порт 8000
EXPOSE 8000

# Команда для запуску FastAPI застосунку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

