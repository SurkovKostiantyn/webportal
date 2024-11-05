# Dockerfile
FROM php:8.3-fpm

# Установка необходимых расширений
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

# Установка Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Установка рабочей директории
WORKDIR /var/www

# Копирование файлов приложения
COPY . .

# Установка зависимостей
RUN composer install

# Настройка прав доступа
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Копирование конфигурации Nginx
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Экспонирование порта
EXPOSE 9000

CMD ["php-fpm"]
