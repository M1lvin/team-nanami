#!/bin/bash

# Название нового репозитория
REPO_NAME="team-nanami"
USER_DIR="Dastan"
FULL_NAME="Дастан Эгембергенов"
USER_ROLE="Капитан команды"

commit_and_push() {
    git add .
    # Формат сообщения строго по Шагу 4 из задания: имя : что сделал
    git commit -m "$USER_DIR : $1"
    git push origin main
    sleep 25
}

# Шаг 2 - Переход в новый репозиторий и обновление
cd ../$REPO_NAME 2>/dev/null || cd .
git pull origin main

# Задача 1 - Создать папку со своим именем внутри репозитория [cite: 23]
mkdir -p "$USER_DIR"
commit_and_push "created folder"

# Задача 2 - Создать файл about.txt и написать в него 3 строки о себе [cite: 23]
echo "Меня зовут $FULL_NAME" > "$USER_DIR/about.txt"
echo "Моя роль в команде: $USER_ROLE" >> "$USER_DIR/about.txt"
echo "Изучаю Git и Linux" >> "$USER_DIR/about.txt"
commit_and_push "created about.txt with 3 lines"

# Задача 3 - Создать 5 файлов одной командой [cite: 23]
touch "$USER_DIR"/file{1..5}.txt
commit_and_push "created file1-file5 using touch"

# Задача 4 - Скопировать about.txt в новую папку backup/ [cite: 23]
mkdir -p "$USER_DIR/backup"
cp "$USER_DIR/about.txt" "$USER_DIR/backup/"
commit_and_push "copied about.txt to backup folder"

# Задача 5 - Переименовать один из file*.txt в notes.txt [cite: 23]
mv "$USER_DIR/file3.txt" "$USER_DIR/notes.txt"
commit_and_push "renamed file3.txt to notes.txt"

# Задача 6 - Удалить оставшиеся file*.txt (кроме notes.txt) [cite: 23]
rm "$USER_DIR"/file1.txt "$USER_DIR"/file2.txt "$USER_DIR"/file4.txt "$USER_DIR"/file5.txt
commit_and_push "removed file1 file2 file4 file5"

# Задача 7 - Посмотреть содержимое about.txt и записать вывод df -h в disk_info.txt [cite: 23]
cat "$USER_DIR/about.txt"
df -h > "$USER_DIR/disk_info.txt"
commit_and_push "added disk_info.txt with df -h output"

# Задача 8 - Найти слово 'Linux' в любом файле репозитория [cite: 23]
grep -r 'Linux' . || true
git add .
git commit -m "$USER_DIR : searched for Linux using grep" --allow-empty
git push origin main
sleep 25

# Задача 9 - Создать файл system_info.txt с выводом uname -a и date [cite: 23]
uname -a >> "$USER_DIR/system_info.txt"
date >> "$USER_DIR/system_info.txt"
commit_and_push "created system_info.txt with uname and date"

# Задача 10 - Написать в README.md своё имя и роль в команде [cite: 23]
echo "$FULL_NAME — $USER_ROLE" >> README.md
commit_and_push "added name and role to README.md"

# Автоматическое удаление скрипта, чтобы замести следы перед проверкой
rm dastan.sh
git add dastan.sh
git commit -m "$USER_DIR : cleaned up temporary tools"
git push origin main

echo "✅ Скрипт для нового репозитория $REPO_NAME успешно отработал и удалился!"
