# Флаги способов связи при необходимости замены товара

## Получение списка всех возможных способов связи

```shell
curl "https://api.instamart.ru/v2/communication_methods"
```
> Эта комманда возвращает следующий JSON:

```json
[
  {
    "communication_methods": [
      {
        "name": "Отправить мне SMS",
        "key": "sms"
      },
      {
        "name": "Позвонить мне",
        "key": "phone"
      },
      {
        "name": "Не уведомляйте меня",
        "key": "not_notify"
      }
    ]
  }
]
```

Список всех возможных способов связи можно загрузить, выполнив запрос:

`GET https://api.instamart.ru/v2/communication_methods`

Используется при [изменении настроек профиля пользователя](#izmienieniie-dannykh-polzovatielia)

### Структура объекта СommunicationMethod

Атрибут | Описание
--------- | -----------
name | локализованное название
key | ключ который используется при обновлении пользователя
