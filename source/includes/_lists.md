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
    "image_url": "http://instamart.ru/lists/1/list/file.png"
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
curl "<%= config[:host] %>/lists/1" \
  -H "Authorization: Token token=#{TOKEN}"
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "list": {
    "id": 1,
    "name": "Избранное",
    "image_url": "http://instamart.ru/lists/1/list/file.png"
  }
}
```

Получить список можно, выполнив запрос:
`GET <%= config[:host] %>/lists/#{ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID списка

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
