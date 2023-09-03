#!/bin/bash

# Đường dẫn gốc cần tải từ đó
base_url="https://www.oxfordlearnersdictionaries.com/definition/english/"

# Tên tệp tin chứa danh sách từ
word_list_file="5k.txt"

# Thư mục để lưu trữ các tệp kết quả
output_directory="5k"

# Tạo thư mục nếu nó không tồn tại
if [ ! -d "$output_directory" ]; then
  mkdir "$output_directory"
fi

# Lặp qua từng từ trong danh sách từ và tải về
while IFS= read -r word; do
  # Tạo URL cho từng từ
  url="${base_url}${word}"

  # Gửi yêu cầu GET đến URL, cho phép chuyển hướng và lưu nội dung vào tệp tin
  curl -L -o "${output_directory}/${word}.html" "$url"

  # Kiểm tra xem tải thành công hay không
  if [ $? -eq 0 ]; then
    echo "Đã tải xong: $word"
  else
    echo "Lỗi khi tải: $word"
  fi
done < "$word_list_file"
