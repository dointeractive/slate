# Заказы

## Создание нового заказа

> Пример команды:

```shell
curl 'https://api.instamart.ru/v2/orders' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -X POST
```
> Ответ будет содержать следующие данные:

```json
{
  "number": "R307128032",
  "item_total": 0.0,
  "total": 0.0,
  "ship_total": 0.0,
  "state": "cart",
  "adjustment_total": 0.0,
  "user_id": 1,
  "created_at": "2014-07-06T18:52:33.724Z",
  "updated_at": "2014-07-06T18:52:33.752Z",
  "completed_at": null,
  "payment_total": 0.0,
  "shipment_state": null,
  "payment_state": null,
  "email": "test@example.com",
  "special_instructions": null,
  "total_quantity": 0,
  "ship_address": null,
  "line_items": [],
  "payments": [],
  "shipments": [],
  "adjustments": []
}
```

<aside class="warning">
  not implemented
</aside>

Создать новый заказ можно, выполнив следующий запрос:

`POST https://api.instamart.ru/v2/orders`

## Получить текущий заказ

> Пример команды:

```shell
curl 'https://api.instamart.ru/v2/orders/current' \
  -H 'Authorization: Token token=#{TOKEN}' 
```

> Ответ будет содержать следующие данные:

```json
{
  "number": "R307128032",
  "item_total": 0.0,
  "total": 0.0,
  "ship_total": 0.0,
  "state": "cart",
  "adjustment_total": 0.0,
  "user_id": 1,
  "created_at": "2014-07-06T18:52:33.724Z",
  "updated_at": "2014-07-06T18:52:33.752Z",
  "completed_at": null,
  "payment_total": 0.0,
  "shipment_state": null,
  "payment_state": null,
  "email": "test@example.com",
  "special_instructions": null,
  "total_quantity": 0,
  "ship_address": null,
  "line_items": [],
  "payments": [],
  "shipments": [],
  "adjustments": []
}
```

<aside class="warning">
  not implemented
</aside>

Получить текущий заказ пользователя можно, выполнив запрос:
`GET https://api.instamart.ru/v2/orders/current`


## Получить список всех заказов

> Пример команды:

```shell
curl 'https://api.instamart.ru/v2/orders' \
  -H 'Authorization: Token token=#{TOKEN}' 
```

<aside class="warning">
  not implemented
</aside>

> Ответ будет содержать следующие данные:

```json
{
  "orders": [
    {
      "id": 1,
      "number": "R335381310",
      "item_total": 100.0,
      "total": 100.0,
      "state": "cart",
      "adjustment_total": -12.0,
      "user_id": null,
      "created_at": "2012-10-24T01:02:25Z",
      "updated_at": "2012-10-24T01:02:25Z",
      "completed_at": null,
      "payment_total": 0.0,
      "shipment_state": null,
      "payment_state": null,
      "email": null,
      "special_instructions": null,
      "total_quantity": 1,
      "token": "abcdef123456",
      "line_items": [],
      "adjustments": [],
      "payments": [],
      "shipments": []
    }
  ]
}
```

Получить все заказы пользователя можно, выполнив запрос:
`GET https://api.instamart.ru/v2/orders`

## Добавление позиции заказа

```shell
curl 'https://api.instamart.ru/v2/line_items' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -d line_item[product_id]=1 \
  -d line_item[quantity]=5
```
> В ответе вернется созданный `line_item`:

```json
{
  "id": 1,
  "quantity": 5,
  "price": 40.0,
  "description": "Nihil et itaque adipisci sed ea dolorum.",
  "retailer_id": 1,
  "product_id": 1,
  "total": 200.00,
  "weight": 500.0,
  "adjustments": [],
  "product": {
    "id": 1,
    "name": "Чай Lipton Yellow Label",
    "price": 42,
    "original_price": 70,
    "discount": 28,
    "weight": 100.0,
    "human_volume": "10 пак x 6",
    "items_per_pack": 2,
    "options_text": "",
    "images": [
      {
        "mini_url": "https::/instamart.ru/file.png?1370533476",
        "small_url": "https:://instamart.ru/file.png?1370533476",
        "product_url": "https://instamart.ru/file.png?1370533476"
      }
    ]
  }
}
```

<aside class="warning">
  not implemented
</aside>

> Добавление позиции к заказу может изменить поле shipments заказа:

```json
{
  "number": "R307128032",
  ...
  "line_items": [{
    ...
  }],
  "shipments": [
    {
      "id": 1,
      "number": "H123456789",
      "cost": 0,
      "shipped_at": null,
      "retailer_id": 1,
      "delivery_slot_id": null,
      "state": "pending",
      "shipping_method": null
    }
  ]
}
```


Добавить позицию к заказу, можно выполнив запрос:

`POST https://api.instamart.ru/v2/line_items`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
line_item[product_id] | Да | ID продукта
line_item[quantity] | Да | количество добавляемых позиций

<aside class="notice">
  После добавления новой позиции не забудьте перезагрузить заказ.
</aside>

## Редактирование позиции заказа

```shell
curl 'https://api.instamart.ru/v2/line_items/1' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -d line_item[quantity]=3 \
  -X PUT 
```
> Ответ будет содержать следующие данные:

```json
{
  "id": 1,
  "quantity": 3,
  "price": 40.0,
  "description": "Nihil et itaque adipisci sed ea dolorum.",
  "product_id": 1,
  "total": 120.0,
  "weight": 300.0,
  "adjustments": [],
  "product": {
    "id": 1,
    "name": "Чай Lipton Yellow Label",
    "price": 42,
    "original_price": 70,
    "discount": 28,
    "weight": 100.0,
    "human_volume": "10 пак x 6",
    "items_per_pack": 2,
    "options_text": "",
    "images": [
      {
        "mini_url": "https://instamart.ru/file.png?1370533476",
        "small_url": "https://instamart.ru/file.png?1370533476",
        "product_url": "https://instamart.ru/file.png?1370533476"
      }
    ]
  }
}
```
<aside class="warning">
  not implemented
</aside>

Чтобы, например, изменить количество единиц товара, необходимо выполнить запрос:

`PUT https://api.instamart.ru/v2/line_items/#{ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID позиции заказа
line_item[quantity] | Нет | Количество единиц товара

<aside class="notice">
  После редактирования позиции не забудьте перезагрузить заказ.
</aside>

## Удаление позиции заказа

```shell
curl 'https://api.instamart.ru/v2/line_items/1' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -X DELETE 
```
> Ответ вернет результат с кодом 200

> Удаление позиции может изменить shipments заказа:

```json
{
  "number": "R307128032",
  ...
  "line_items": [],
  "shipments": []
}
```

<aside class="warning">
  not implemented
</aside>

Чтобы удалить позицию заказа, необходимо выполнить запрос:

`DELETE https://api.instamart.ru/v2/line_items/#{ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID позиции заказа

<aside class="notice">
  После добавления новой позиции не забудьте перезагрузить заказ.
</aside>

## Оформление заказа

> Пример команды для выбора адреса доставки:

```shell
curl 'https://api.instamart.ru/v2/checkouts/#{NUMBER}' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -d "order[ship_address_id]=1"
```
> Если данные были указаны верно, ответ будет содержать json-документ заказа:

```json
{
  "number": "R307128032",
  "item_total": 0.0,
  "total": 0.0,
  "ship_total": 0.0,
  "state": "cart",
  "adjustment_total": 0.0,
  "user_id": 1,
  "created_at": "2014-07-06T18:52:33.724Z",
  "updated_at": "2014-07-06T18:52:33.752Z",
  "completed_at": null,
  "payment_total": 0.0,
  "shipment_state": null,
  "payment_state": null,
  "email": "test@example.com",
  "special_instructions": null,
  "total_quantity": 0,
  "ship_address": {
    "id": 1,
    "city": "Москва",
    "full_address": "Старая Басманная 3"
  },
  "line_items": [...],
  "payments": [],
  "shipments": [...],
  "adjustments": []
}
```

> Пример заполнения комментария к доставке:

```shell
curl 'https://api.instamart.ru/v2/checkouts/#{NUMBER}' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -d "order[special_instructions]=Вход со двора"
```

> Пример команды выбора интервала доставки:

```shell
curl 'https://api.instamart.ru/v2/checkouts/#{NUMBER}' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -d "order[shipments_attributes][1][delivery_slot_id]=1"
```

> Ответ вернет обновленный заказ:

```json
{
  "number": "R307128032",
  ...
  "line_items": [{
    ...
  }],
  "shipments": [
    {
      "id": 1,
      "number": "H123456789",
      "cost": 0,
      "shipped_at": null,
      "retailer_id": 1,
      "delivery_slot_id": 1,
      "state": "pending",
      "shipping_method": null
    }
  ]
}
```


> Пример команды выбора способа доставки:

```shell
curl 'https://api.instamart.ru/v2/checkouts/#{NUMBER}' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -d "order[shipments_attributes][1][shipping_method_id]=1"
```

> При выбранном способе доставки, ответ будет включать дополнительные данные:

```json
{
  "number": "R307128032",
  "item_total": 0.0,
  ...
  "shipments": [
    {
      "id": 1,
      "number": "H123456789",
      "cost": 500.0,
      "shipped_at": null,
      "state": "pending",
      "shipping_method": {
        "name": "Доставка"
      }
    }
  ]
}
```

> Пример выбора метода оплаты:

```shell
curl 'https://api.instamart.ru/v2/checkouts/#{NUMBER}' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -d "order[payment_attributes][payment_tool_id]=1"
```

> При выбранном методе оплаты, ответ будет содержать дополнительные поля:

```json
{
  "number": "R307128032",
  "item_total": 0.0,
  ...
}
```

> Пример выбора способа связи:

```shell
curl 'https://api.instamart.ru/v2/checkouts/#{NUMBER}' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -d "order[notification_attributes][notification_method_id]=1"
  -d "order[notification_attributes][phone]=74951112233"
```

<aside class="warning">
  not implemented
</aside>

Для оформления заказа используется ресурс `checkouts`. Чтобы заполнить информацию о заказе, необходимо выполнить запрос: 

`PUT https://api.instamart.ru/v2/checkouts/#{NUMBER}`

### Параметры запроса

При выполнение запроса следующие параметры не обязательны, но пока некоторые из них не будут указаны заказ нельзя будет завершить.

Параметр | Обязательный | Описание
--------- | ------- | -----------
NUMBER | Да | Номер заказа
SHIPMENT_ID | Да | id доставки
order[ship_address_id] | Да (для завершения) | Адрес доставки
order[coupon_code] | - | Промо код
order[special_instructions] | - | Комментарий к заказу
order[shipments_attributes][#{SHIPMENT_ID}][delivery_slot_id] | Да (для завершения) | id слота доставки
order[shipments_attributes][#{SHIPMENT_ID}][shipping_method_id] | Да (для завершения) | Метод доставки
order[payment_attributes][payment_tool_id] | Да (для завершения) | Источник оплаты
order[notification_attributes][notification_method_id] | Да (для завершения) | Способ связи
order[notification_attributes][phone] | Да (для завершения) | Телефон для связи
