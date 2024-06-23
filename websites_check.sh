
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    
)

# Ім'я файлу логів
log_file="website_check.log"

# Функція для перевірки доступності вебсайту і запису результату у файл логів
check_website() {
    url=$1
    status_code=$(curl --head --silent --output /dev/null --write-out "%{http_code}" "$url")
    
    if [ $status_code -eq 200 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S"): Website $url is UP" >> "$log_file"
    else
        echo "$(date +"%Y-%m-%d %H:%M:%S"): Website $url is DOWN or returned a non-200 status code (HTTP status code: $status_code)" >> "$log_file"
    fi
}

# Очищення вмісту файлу логів перед початком перевірки
> "$log_file"

# Цикл для перевірки кожного вебсайту в списку
for site in "${websites[@]}"; do
    check_website "$site"
done

echo "Результати перевірки записані у файл логів: $log_file"





