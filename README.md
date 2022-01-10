# meistuss_platform
meistuss Platform repository

## Создание образа из Dockerfile
Для изменения порта и дефолтного пути к контенту использовался шаблон для nginx, дабы менять данные параметры через environments в dockerfile.
```Dockerfile
# Был выбран nginx в качестве web
FROM nginx:latest

# Присвое значение переменной UID
ARG UID=1001

# Присвоение значения для ENV, описанных в файле темплейта
ENV NGINX_PORT=8000
ENV NGINX_ROOTDIR=/app

# Изменение UID для учетки nginx
RUN usermod -u ${UID} nginx

# Копирование темплейта
COPY default.conf.template /etc/nginx/templates/

# Копирвание контента в новый путь
COPY homework.html /app/
```