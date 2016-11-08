# Ритейлеры

## Получение списка ритейлеров

```shell
curl "https://api.instamart.ru/v2/retailers" \
```

> Команда выше возвращает JSON:

```json
{
  "retailers": [
    {
      "id": 1,
      "name": "Metro",
      "color": "#003d7a",
      "logo": "https://www.metrogroup.de/~/assets/mag/images/teasers/metro-logo.png",
      "available": true,
      "environment": "production"
    }
  ]
}
```

Получить список ритейлеров подключенных к Instamart можно выполнив запрос

### HTTP запрос

`GET https://api.instamart.ru/v2/retailers`
