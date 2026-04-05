FROM python:3.11-slim

WORKDIR /app

# Очистка кэша pip и установка последней версии wheel
RUN pip cache purge && \
    pip install --no-cache-dir --upgrade pip setuptools wheel

# Копирование requirements.txt
COPY requirements.txt .

# Принудительная установка зависимостей с очисткой кэша
RUN pip install --no-cache-dir --upgrade --index-url https://pypi.org/simple -r requirements.txt

# Копирование остального кода
COPY . .

# Запуск бота
CMD ["python", "bot.py"]