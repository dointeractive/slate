# Список фаворитов

## Получение списка фаворитов

```shell
curl "<%= config[:host] %>/lists/favorites" \
  -H "Authorization: Token token=#{TOKEN}"
```

> Ответ будет содержать следующие данные:

```json
{
  "list": {
    "id": 1,
    "name": "Избранное",
    "image_url": "http://instamart.ru/lists/1/list/file.png",
    "list_items": [
      {
        "id": 22,
        "product_id": 12345,
        "name": "Бананы",
        "quantity": 3,
        "position": 0,
        "price": 54.79,
        "original_price": 55.79,
        "human_volume": "500 г.",
        "available": true,
        "images": [
          {
            "mini_url": "http://instamart.ru/products/22/mini/file.png",
            "small_url": "http://instamart.ru/products/22/small/file.png",
            "product_url": "http://instamart.ru/products/22/product/file.png"
          }
        ]
      }
    ]
  }
}
```

Получить список всех фаворитов можно, выполнив запрос:

`GET <%= config[:host] %>/lists/favorites`

## Добавление позиции в список фаворитов

```shell
curl "<%= config[:host] %>/lists/favorites/items" \
  -H "Authorization: Token token=#{TOKEN}" \
  -X POST \
  -d "list_item[product_id]=12345"
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "list_item": {
    "id": 22,
    "product_id": 12345,
    "name": "Бананы",
    "quantity": 3,
    "position": 0,
    "price": 54.79,
    "original_price": 55.79,
    "human_volume": "500 г.",
    "available": true,
    "images": [
      {
        "mini_url": "http://instamart.ru/products/22/mini/file.png",
        "small_url": "http://instamart.ru/products/22/small/file.png",
        "product_url": "http://instamart.ru/products/22/product/file.png"
      }
    ]
  }
}
```

Добавить продукт в список фаворитов можно, выполнив запрос:

`POST <%= config[:host] %>/lists/favorites`

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ИД списка
list_item[product_id] | Да | ИД продукта

## Редактирование позиции продукта в списке

```shell
curl "<%= config[:host] %>/lists/favorites/22?rid=1" \
  -d list_item[position]=5 \
  -X PUT
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "list_item": {
    "id": 22,
    "product_id": 12345,
    "name": "Бананы",
    "quantity": 3,
    "position": 5,
    "price": 54.79,
    "original_price": 55.79,
    "human_volume": "500 г.",
    "available": true,
    "images": [
      {
        "mini_url": "http://instamart.ru/products/22/mini/file.png",
        "small_url": "http://instamart.ru/products/22/small/file.png",
        "product_url": "http://instamart.ru/products/22/product/file.png"
      }
    ]
  }
}
```

Чтобы изменить позицию в списке, необходимо выполнить запрос:

`PUT <%= config[:host] %>/lists/favorites/#{LID}?rid=#{RID}`

Параметр | Обязательный | Описание
--------- | ------- | -----------
LID | Да | ИД позиции списка
RID | Да | ID текущего ритейлера
list_item[quantity] | Да | Количество товара для добавления в корзину
list_item[position] | Да | Позиция в списке

## Удаление позиции продукта в списке

```shell
curl "<%= config[:host] %>/lists/favorites/22" \
  -X DELETE
```
> Ответ вернет результат с кодом 200

Чтобы удалить позициб списка, необходимо выполнить запрос:

`DELETE <%= config[:host] %>/lists/favorites/#{LID}`

Параметр | Обязательный | Описание
--------- | ------- | -----------
LID | Да | ИД позиции списка

## Добавление позиции продукта из списка в корзину
Добавление продукта из списка в корзину осуществляется с помощью [API Добавление позиции заказа](#dobavlieniie-pozitsii-zakaza)

## Добавление всех позиции продуктов из списка в корзину

```shell
curl "<%= config[:host] %>/lists/1/orders?rid=1" \
  -X POST
```
> Ответ вернет результат с кодом 200

Чтобы добавить все активные продукты из списка в корзину, необходимо выполнить запрос:

`POST <%= config[:host] %>/lists/favorites/orders?rid={RID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
RID | Да | ID текущего ритейлера
