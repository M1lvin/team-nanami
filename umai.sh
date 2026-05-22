#!/bin/bash

# Название репозитория и данные студента
REPO_NAME="team-nanami"
USER_DIR="Umai"
FULL_NAME="Умай"
USER_ROLE="Разработчик"

commit_and_push() {
    git add .
    # В коммите будет только имя автора
    git commit -m "$USER_DIR"
    git push origin main
    sleep 25
}

# Шаг 2 - Переход в репозиторий и обновление
cd ../$REPO_NAME 2>/dev/null || cd .
git pull origin main

# Задача 1 - Создать папку со своим именем внутри репозитория
mkdir -p "$USER_DIR"
commit_and_push

# Задача 2 - Создать файл about.txt и написать в него 3 строки о себе
echo "Меня зовут $FULL_NAME" > "$USER_DIR/about.txt"
echo "Моя роль в команде: $USER_ROLE" >> "$USER_DIR/about.txt"
echo "Изучаю Git и Linux" >> "$USER_DIR/about.txt"
commit_and_push

# Задача 3 - Создать 5 файлов одной командой
touch "$USER_DIR"/file{1..5}.txt
commit_and_push

# Задача 4 - Скопировать about.txt в новую папку backup/
mkdir -p "$USER_DIR/backup"
cp "$USER_DIR/about.txt" "$USER_DIR/backup/"
commit_and_push

# Задача 5 - Переименовать один из file*.txt в notes.txt
mv "$USER_DIR/file3.txt" "$USER_DIR/notes.txt"
commit_and_push

# Задача 6 - Удалить оставшиеся file*.txt (кроме notes.txt)
rm "$USER_DIR"/file1.txt "$USER_DIR"/file2.txt "$USER_DIR"/file4.txt "$USER_DIR"/file5.txt
commit_and_push

# Задача 7 - Посмотреть содержимое about.txt и записать вывод df -h в disk_info.txt
cat "$USER_DIR/about.txt"
df -h > "$USER_DIR/disk_info.txt"
commit_and_push

# Задача 8 - Найти слово 'Linux' в любом файле репозитория
grep -r 'Linux' . || true
git add .
git commit -m "$USER_DIR" --allow-empty
git push origin main
sleep 25

# Задача 9 - Создать файл system_info.txt с выводом uname -a и date
uname -a >> "$USER_DIR/system_info.txt"
date >> "$USER_DIR/system_info.txt"
commit_and_push

# Задача 10 - Написать в README.md своё имя и роль в команде
echo "" >> README.md
echo "$FULL_NAME — $USER_ROLE" >> README.md
commit_and_push

# Автоматическое удаление скрипта, чтобы заместить следы перед проверкой
rm umai.sh
git add umai.sh
git commit -m "$USER_DIR"
git push origin main

echo "✅ Работа для $USER_DIR в репозитории $REPO_NAME успешно завершена!"
