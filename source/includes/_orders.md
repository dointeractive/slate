# Заказы

## Создание нового заказа

> Пример команды

```shell
curl 'http://api.instamart.ru/v1/orders' \
  -H 'Authorization: Basic <TOKEN>' \
  -X POST
```
> Ответ будет содержать следующие данные

```json
{
  "id": 4,
  "number": "R307128032",
  "item_total": "0.0",
  "total": "0.0",
  "ship_total": "0.0",
  "state": "cart",
  "adjustment_total": "0.0",
  "user_id": 1,
  "created_at": "2014-07-06T18:52:33.724Z",
  "updated_at": "2014-07-06T18:52:33.752Z",
  "completed_at": null,
  "payment_total": "0.0",
  "shipment_state": null,
  "payment_state": null,
  "email": "spree@example.com",
  "special_instructions": null,
  "total_quantity": 0,
  "token": "n0kZnXjRfjnhZMY5ijhiOA",
  "ship_address": null,
  "line_items": [],
  "payments": [],
  "shipments": [],
  "adjustments": []
}
```

Создать новый заказ можно, выполнив следующий запрос:

`POST http://api.instamart.ru/v1/orders`

## Добавление позиции заказа

```shell
curl 'http://api.instamart.ru/v1/line_items' \
  -H 'Authorization: Basic <TOKEN>' \
  -d line_item[product_id]=1 \
  -d line_item[quantity]=5
```
> Ответ будет содержать следующие данные

```json
{
  "id": 1,
  "quantity": 5,
  "price": "40.00",
  "description": "Nihil et itaque adipisci sed ea dolorum.",
  "product_id": 1,
  "total": "200.00",
  "weight": "0.0",
  "adjustments": [],
  "product": {
    "id": 1,
    "name": "Чай Lipton Yellow Label",
    "price": 42,
    "original_price": 70,
    "discount": 28,
    "weight": "10 пак x 6",
    "items_per_pack": 2,
    "options_text": "",
    "images": [
      {
        "mini_url": "/file.png?1370533476",
        "small_url": "/file.png?1370533476",
        "product_url": "/file.png?1370533476"
      }
    ]
  }
}
```

Добавить позицию к заказу, можно выполнив запрос:

`POST http://api.instamart.ru/v1/line_items`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
`line_item[product_id]` | Да | ID продукта
`line_item[quantity]` | Да | количество добавляемых позиций
