# Каталог

## Выдача для главной страницы

> Пример команды

```shell
curl 'https://api.instamart.ru/v2/departments?rid=1' \
```
> Ответ будет содержать следующие данные

```json
{
  "departments": [
    {
      "id": 1,
      "name": "Чай и кофе",
      "products_count": 668,
      "products": [
        {
          "id": 1,
          "name": "Чай Lipton Yellow Label",
          "price": 42,
          "original_price": 70,
          "discount": 28,
          "weight": 150.0,
          "human_volume": "10 пак x 6",
          "items_per_pack": 2,
          "images": [
            {
              "mini_url": "http:://instamart.ru/file.png?1370533476",
              "small_url": "http::/instamart.ru/file.png?1370533476",
              "product_url": "http::/instamart.ru/file.png?1370533476"
            }
          ]
        }
      ]
    }
  ]
}
```

Получить выдачу для главной страницы можно, выполнив следующий запрос:

`GET https://api.instamart.ru/v2/departments`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
`rid` | Да | ID ритейлера для которого необходимо получить список товаров.

## Выдача страницы категории

> Пример команды

```shell
curl 'https://api.instamart.ru/v2/departments/174?rid=1' \
```
> Ответ будет содержать следующие данные

```json
{ 
  "department": {
    "id": 1,
    "name": "Чай и кофе",
    "products_count": 668,
    "aisles": [
      {
        "name": "Чай",
        "product_counts": 327,
        "taxon_id": 267,
        "products": [
          {
            "id": 1,
            "name": "Чай Lipton Yellow Label",
            "price": 42,
            "original_price": 70,
            "discount": 28,
            "weight": 150.0,
            "human_volume": "10 пак x 6",
            "items_per_pack": 2,
            "images": [
              {
                "mini_url": "/file.png?1370533476",
                "small_url": "/file.png?1370533476",
                "product_url": "/file.png?1370533476"
              }
            ]
          }
        ]
      }
    ]
  }
}
```

Получить выдачу страницы каталога можно, выполнив следующий запрос:

`GET https://api.instamart.ru/v2/departments/#{DEPARTMENT_ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
`rid` | Да | ID ритейлера для которого необходимо получить список товаров.
DEPARTMENT_ID | Да | id категории
