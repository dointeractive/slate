# Возможные замены продукта

## Список замен

```shell
curl "<%= config[:host] %>/products/1/replacements?rid=1&tid=1"
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
      "human_volume": "500 г.",
      "items_per_pack": 1,
      "description": "Бананы желтые из Эквадора",
      "images": [
        {
          "mini_url": "http://instamart.ru/products/1/mini/file.png",
          "small_url": "http://instamart.ru/products/1/small/file.png",
          "product_url": "http://instamart.ru/products/1/product/file.png"
        }
      ]
    }
  ],

  "meta": {
    "current_page": 1,
    "next_page": null,
    "total_pages": 1
  }
}
```

Получить список возможных замен для продукта можно, выполнив запрос:

### HTTP запрос

`GET <%= config[:host] %>/products/#{PRODUCT_ID}/replacements`

Параметр | Обязательный | Описание
--------- | ------- | -----------
product_id | Да | ID продукта
rid | Да | ID текущего ритейлера
tid | Да | ID текущей категории

### Структура ответа

Объект | Описание
--------- | -----------
products | Список продуктов
meta | Атрибуты пагинации

