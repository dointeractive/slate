# Жалобы на товар

## Получение списка стандартных жалоб

```shell
curl "https://api.instamart.ru/v1/flags"
```
> Эта комманда возвращает следующий JSON:

```json
[
  {
    "id": 1,
    "name": "Неверное описание"
  }
]
```

Стандартный список ошибок можно загрузить, выполнив запрос:

`GET https://api.instamart.ru/v1/flags`

## Отправка жалобы

> Пример отправки стандартной жалобы из списка:

```shell
curl "https://api.instamart.ru/v1/products/1/flags"
  -H "Authorization: Token token=<% TOKEN %>"
  -X POST
  -d flag_id=1
```

> Пример отправки собственной жалобы

```shell
curl "https://api.instamart.ru/v1/products/1/flags"
  -H "Authorization: Token token=<% TOKEN %>"
  -X POST
  -d "description=Слишком высокая цена"
```

Чтобы отправить жалобу на товар, выполните следующий запрос, указав `id` жалобы:

`POST https://api.instamart.ru/v1/products/<PRODUCT_ID>/flags`

Также, используя этот же адрес, можно отправить свой текст жалобы, указав его в параметре `description`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
product_id | Да | id продукта
flag_id | Да (если не указан `description`) | id жалобы 
description | Да (если не указан `flag_id`) | текст жалобы
