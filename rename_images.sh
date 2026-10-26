#!/bin/sh
# Нормализация имён картинок: .JPG -> .jpg (регистр важен для GitHub Pages).
# Запускать из корня репозитория. git mv -f корректно работает даже
# на Windows/macOS, где файловая система нечувствительна к регистру.
set -e
for f in \
  bianca charlotte claire coldone gustavo huilen jenks john kaure kim \
  liam lucy maggie_i mary meyer molina nette peter phil rachel randall \
  stefan tahaaki vampiress vladimir waitress yvette ; do
  if git ls-files --error-unmatch "images/$f.JPG" >/dev/null 2>&1; then
    git mv -f "images/$f.JPG" "images/$f.jpg"
    echo "переименовано: images/$f.JPG -> images/$f.jpg"
  fi
done
echo "Готово. Теперь: git commit -m 'Normalize image filenames' && git push"
