# Ритейлеры

## Получить список ритейлеров

```shell
curl "http://api.instamart.ru/v1/retailers"
  -H "Authorization: Basic <% key %>"
```

> Команда выше возвращает JSON:

```json
[
  {
    "id": 1,
    "name": "Metro",
    "logo": "http://s3.instamart.ru/retailers/metro.png"
  },
  {
    "id": 2,
    "name": "Ашан",
    "logo": "http://s3.instamart.ru/retailers/auchan.png"
  }
]
```

Получить список ритейлеров подключенных к Instamart можно выполнив запрос

### HTTP запрос

`GET http://api.instamart.ru/v1/retailers`
