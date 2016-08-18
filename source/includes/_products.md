# Продукты

## Список продуктов

```shell
curl "https://api.instamart.ru/v1/products?rid=1" 
```

> Команда выше возвращает JSON:

```json
[
  {
    "id": 1,
    "name": "Бананы",
    "price": 54.79,
    "original_price": 55.79,
    "discount": 1.0,
    "weight": 500.0,
    "description": "Бананы желтые из Эквадора",
    "images": [
      {
        "mini_url": "http://instamart.ru/products/1/mini/file.png",
        "small_url": "http://instamart.ru/products/1/small/file.png",
        "product_url": "http://instamart.ru/products/1/product/file.png"
      }
    ]
  },
  { ... }
]
```

Получить список продуктов доступных в текущий момент в Instamart можно выполнив запрос

### HTTP запрос

`GET https://api.instamart.ru/v1/products`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
rid | Да | ID ритейлера для которого необходимо получить список товаров.
tid | -- | ID категории. Если указан - вернутся только товары из этой категории.  

<aside class="notice">
Не забудьте указать обязательный параметр идентификатор ритейлера
</aside>


## Карточка продукта

```shell
curl "https://api.instamart.ru/v1/products/1"
```

> Команда выше возвращает JSON:

```json
{
  "id": 1,
  "name": "Бананы",
  "price": 54.79,
  "original_price": 55.79,
  "discount": 1.0,
  "weight": 500.0,
  "description": "Бананы желтые из Эквадора",
  "properties": [
    {
      "name": "Калорийность",
      "value": "96"
    }
  ],
  "images": [
    {
      "mini_url": "http://instamart.ru/products/1/mini/file.png",
      "small_url": "http://instamart.ru/products/1/small/file.png",
      "product_url": "http://instamart.ru/products/1/product/file.png"
    }
  ],
  "similar_products": [
    {
      "id": 2,
      "name": "Бананы мини",
      "price": 1.79,
      "original_price": 1.99,
      "discount": 0.20,
      "weight": 500.0,
      "description": "Бананы мини",
      "properties": [...],
      "images": [...]
    }
  ]
}
```

Получить данные для карточки продукта, можно выполнив запрос

### HTTP запрос

`GET https://api.instamart.ru/v1/products/#{PRODUCT_ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
product_id | Да | ID продукта

