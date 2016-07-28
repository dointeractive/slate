# Ритейлеры

## Получить список ритейлеров

```shell
curl "https://api.instamart.ru/v1/retailers" \
  -H "Authorization: Basic <% key %>"
```

> Команда выше возвращает JSON:

```json
[
  {
    "id": 1,
    "name": "Metro",
    "logo": "http://instamart.ru/retailers/metro.png"
  },
  {
    "id": 2,
    "name": "Ашан",
    "logo": "http://instamart.ru/retailers/auchan.png"
  }
]
```

Получить список ритейлеров подключенных к Instamart можно выполнив запрос

### HTTP запрос

`GET https://api.instamart.ru/v1/retailers`
