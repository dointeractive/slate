# Продукты

## Получить список продуктов

```shell
curl "http://api.instamart.ru/v1/products?rid=1" \
  -H "Authorization: Basic <% key %>"
```

> Команда выше возвращает JSON:

```json
[
  {
    "id": 1,
    "name": "Бананы",
    "price": 1.79,
    "original_price": 1.99,
    "discount": 0.20,
    "weight": 500,
    "description": "Бананы желтые из Эквадора",
    "properties": [],
    "images": [
      {
        "mini_url": "http://s3.instamart.ru/products/1/mini/file.png",
        "small_url": "http://s3.instamart.ru/products/1/small/file.png",
        "product_url": "http://s3.instamart.ru/products/1/product/file.png"
      }
    ],
    "similar_products": []
  },
  { ... }
]
```

Получить список продуктов доступных в текущий момент в Instamart можно выполнив запрос

### HTTP запрос

`GET http://api.instamart.ru/v1/products`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
rid | Да | ID ритейлера для которого необходимо получить список товаров.
tid | -- | ID категории. Если указан - вернутся только товары из этой категории.  

<aside class="notice">
Не забудьте указать обязательный параметр идентификатор ритейлера
</aside>
