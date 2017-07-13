# Списки

## Получение всех списков

```shell
curl "<%= config[:host] %>/lists" \
  -H "Authorization: Token token=#{TOKEN}"
```

> Ответ будет содержать следующие данные:

```json
{
  "lists": [
    {
      "id": 1,
      "name": "Избранное",
      "image_url": "http://instamart.ru/lists/1/list/file.png"
    }
  ],
  "meta": {
    "current_page": 1,
    "next_page": null,
    "total_pages": 1,
    "per_page": 10
  }
}
```

Получить список всех списков можно, выполнив запрос:

`GET <%= config[:host] %>/lists`

## Создание нового списка

```shell
curl "<%= config[:host] %>/lists" \
  -H "Authorization: Token token=#{TOKEN}" \
  -X POST \
  -d "list[name]=Избранное" \
  -d "list[image]=@file.jpg"
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "list": {
    "id": 1,
    "name": "Избранное",
    "image_url": "http://instamart.ru/lists/1/list/file.png",
    "list_items": []
  }
}
```

Добавить новый список можно, выполнив запрос:

`POST <%= config[:host] %>/lists`

Параметр | Обязательный | Описание
--------- | ------- | -----------
list[name] | Да | Название
list[image] | Да | Изображение

## Получение списка по номеру

```shell
curl "<%= config[:host] %>/lists/1?rid=1" \
  -H "Authorization: Token token=#{TOKEN}"
```

> В случае если данные были указаны верно, сервер вернет ответ:

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

Получить список можно, выполнив запрос:
`GET <%= config[:host] %>/lists/#{ID}?rid={RID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID списка
RID | Да | ID текущего ритейлера


### Структура объекта ListItem

Атрибут | Описание
--------- | -----------
id | ID позиции списка
product_id | ID продукта
name | название продукта
quantity | количество товара для добавление в корзину
position | позиция в списке
price | цена со скидкой
original_price | цена без скидки
human_volume | объем продукта
available | доступна ли позиция для текущего ритейлера
images | изображения продута

## Редактирование списка

```shell
curl "<%= config[:host] %>/lists/1" \
  -d list[name]=Фавориты \
  -X PUT
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "list": {
    "id": 1,
    "name": "Фавориты",
    "image_url": "http://instamart.ru/lists/1/list/file.png"
  }
}
```

Чтобы изменить список пользователя, необходимо выполнить запрос:

`PUT <%= config[:host] %>/lists/#{ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID списка
list[name] | Да | Название
list[image] | Да | Изображение

## Удаление списка

```shell
curl "<%= config[:host] %>/lists/1" \
  -X DELETE
```
> Ответ вернет результат с кодом 200

Чтобы удалить список, необходимо выполнить запрос:

`DELETE <%= config[:host] %>/lists/#{ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID списка

## Добавление позиции продукта в список

```shell
curl "<%= config[:host] %>/lists/1/lists_items" \
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

Добавить продукт в список можно, выполнив запрос:

`POST <%= config[:host] %>/lists/#{ID}/lists_items`

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ИД списка
list_item[product_id] | Да | ИД продукта

## Редактирование позиции продукта в списке

```shell
curl "<%= config[:host] %>/lists_items/1/lists_items/22?rid=1" \
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

`PUT <%= config[:host] %>/lists/#{ID}/lists_items/#{LID}?rid=#{RID}`

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ИД списка
LID | Да | ИД позиции списка
RID | Да | ID текущего ритейлера
list_item[quantity] | Да | Количество товара для добавления в корзину
list_item[position] | Да | Позиция в списке

## Удаление позиции продукта в списке

```shell
curl "<%= config[:host] %>/lists/1/lists_items/22" \
  -X DELETE
```
> Ответ вернет результат с кодом 200

Чтобы удалить позициб списка, необходимо выполнить запрос:

`DELETE <%= config[:host] %>/lists/#{ID}/lists_items/#{LID}`

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ИД списка
LID | Да | ИД позиции списка

## Добавление позиции продукта из списка в корзину
Добавление продукта из списка в корзину осуществляется с помощью [API Добавление позиции заказа](#dobavlieniie-pozitsii-zakaza)

## Добавление всех позиции продуктов из списка в корзину

```shell
curl "<%= config[:host] %>/lists/1/orders" \
  -X POST
```
> Ответ вернет результат с кодом 200

Чтобы добавить все активные продукты из списка в корзину, необходимо выполнить запрос:

`POST <%= config[:host] %>/lists/#{ID}/orders`
