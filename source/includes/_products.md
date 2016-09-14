# Продукты

## Список продуктов

```shell
curl "https://api.instamart.ru/v2/products?rid=1"
```

> Команда выше возвращает JSON:

```json
{
  "products": [
    {
      "id": 1,
      "sku": 100000,
      "name": "Бананы",
      "price": 54.79,
      "original_price": 55.79,
      "discount": 1.0,
      "weight": 500.0,
      "human_volume": "500 г."
      "items_per_pack": 1,
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
  ],

  "meta": {
    "current_page": 1,
    "next_page": 2,
    "total_pages": 2,
    "is_last_page": false
  }
}
```

Получить список продуктов доступных в текущий момент в Instamart можно выполнив запрос

### HTTP запрос

`GET https://api.instamart.ru/v2/products`

API ограничивает максимальное число возвращаемых продуктов 20 объектами. Для доступа к остальным продуктам реализован интерфейс пагинации.
Каждый запрос к `/v2/products` помимо самих продуктов также возвращает объект `meta`, указывающий номер текущей страницы продуктов, номер следующией страницы и общее количество страниц. Получить конкретную страницу с данными можно, указав параметр `p`.

### Параметры запроса

Параметр | Обязательный | Описание
-------- | ------- | -----------
rid | Да | ID ритейлера для которого необходимо получить список товаров.
tid | Да | ID категории из которой необходимо вернуть товары.
p | -- | Номер страницы

<aside class="notice">
Не забудьте указать обязательный параметр идентификатор ритейлера
</aside>


## Карточка продукта

```shell
curl "https://api.instamart.ru/v2/products/6"
```

> Команда выше возвращает JSON:

```json
{
  "product": {
    "id": 1,
    "sku": "10001",
    "name": "Бананы",
    "price": 54.79,
    "original_price": 55.79,
    "discount": 1.0,
    "items_per_pack": 1,
    "human_volume": "500 г.",
    "weight": 500.0,
    "description": "Бананы желтые из Эквадора",
    "properties": [
      {
        "name": "energy_value",
        "presentation": "Калорийность",
        "value": "96"
      }
    ],
    "images": [
      {
        "mini_url": "http://instamart.ru/products/6/mini/file.png",
        "small_url": "http://instamart.ru/products/6/small/file.png",
        "product_url": "http://instamart.ru/products/6/product/file.png"
      }
    ],
    "related_products": [
      {
        "id": 2,
        "name": "Бананы мини",
        "price": 1.79,
        "original_price": 1.99,
        "discount": 0.20,
        "weight": 500.0,
        "items_per_pack": 1,
        "human_volume": "500 г.",
        "description": "Бананы мини",
        "properties": [...],
        "images": [...]
      }
    ]
  }
}
```

Получить данные для карточки продукта, можно выполнив запрос

### HTTP запрос

`GET https://api.instamart.ru/v2/products/#{PRODUCT_ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
product_id | Да | ID продукта

