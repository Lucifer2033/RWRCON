#!/bin/bash

# Путь к исполняемому файлу
FILE_PATH="./rwrcon"

# Функция для проверки статуса процесса
check_process_status() {
    # Получаем список процессов, соответствующих имени файла
    processes=$(pgrep -f "$FILE_PATH")

    if [ -z "$processes" ]; then
        # Процесс не найден, запускаем файл
        echo "Процесс остановлен, запуск файла..."
        "$FILE_PATH" &
    fi
}

# Основной цикл скрипта
while true; do
    # Проверяем статус процесса каждые 5 секунд
    check_process_status
    sleep 5
done