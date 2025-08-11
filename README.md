# Django REST API - Проект с оружием

Этот проект представляет собой простой REST API для управления оружием в игре, построенный на Django и Django REST Framework.

## Что делает API

- **Модель**: `Weapon` (Оружие)
  - `power` - сила оружия (число)
  - `rarity` - редкость оружия (текст) 
  - `value` - ценность оружия (число)

- **Эндпоинты**:
  - `GET /demo/` - получить список всех оружий
  - `GET /weapon/<id>/` - получить конкретное оружие по ID

## Переменные окружения

Проект использует переменные окружения для конфигурации:

- `DJANGO_SECRET_KEY` - секретный ключ Django (по умолчанию: 'dev-secret-change-me')
- `DJANGO_DEBUG` - режим отладки (0/1, по умолчанию: 1)
- `DJANGO_ALLOWED_HOSTS` - разрешенные хосты (по умолчанию: localhost,127.0.0.1)
- `DJANGO_DB_NAME` - путь к файлу SQLite (по умолчанию: db.sqlite3)

## Запуск в Docker

### 1. Сборка образа
```bash
docker build -t django-weapon-api .
```

### 2. Запуск контейнера
```bash
docker run --rm -p 8000:8000 \
  -e DJANGO_DEBUG=0 \
  -e DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1 \
  django-weapon-api
```

### 3. Проверка работы
Откройте браузер или используйте curl:
```bash
curl http://localhost:8000/demo/
```

## Локальный запуск (без Docker)

### 1. Создание виртуального окружения
```bash
python -m venv .venv
# Windows:
.venv\Scripts\activate
# Linux/Mac:
source .venv/bin/activate
```

### 2. Установка зависимостей
```bash
pip install -r requirements.txt
```

### 3. Миграции базы данных
```bash
python manage.py migrate
```

### 4. Запуск сервера
```bash
python manage.py runserver
```

## Тестирование API

### С помощью VS Code REST Client
Используйте файл `requests.http` в VS Code с расширением REST Client.

### С помощью curl
```bash
# Получить список всех оружий
curl http://localhost:8000/demo/

# Получить оружие с ID=1
curl http://localhost:8000/weapon/1/
```

### С помощью Postman
1. Создайте новый запрос
2. Установите метод GET
3. Введите URL: `http://localhost:8000/demo/`
4. Нажмите Send

## Структура проекта

```
api/
├── api/                 # Основные настройки Django
│   ├── settings.py     # Настройки с поддержкой переменных окружения
│   ├── urls.py         # Главные URL маршруты
│   └── wsgi.py         # WSGI конфигурация
├── demo/               # Приложение с API
│   ├── models.py       # Модель Weapon
│   ├── serializers.py  # Сериализатор для API
│   └── views.py        # Представления API
├── Dockerfile          # Конфигурация Docker
├── requirements.txt    # Зависимости Python
├── .dockerignore       # Файлы, исключаемые из Docker
└── README.md          # Этот файл


## Безопасность

- В продакшене обязательно измените `DJANGO_SECRET_KEY`
- Установите `DJANGO_DEBUG=0` в продакшене
- Настройте `DJANGO_ALLOWED_HOSTS` для вашего домена


