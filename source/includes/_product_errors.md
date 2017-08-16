# Ошибки продуктов

## Создание новой ошибки

```shell
curl "<%= config[:host] %>/product/111/errors" \
  -H "Authorization: Token token=#{TOKEN}" \
  -X POST \
  -d "product_error[error_flag_id]=1" \
  -d "product_error[error_comment]=Все неверно"
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "product_error": {
    "id": 1,
    "user_id": 1,
    "product_id": 111,
    "error_comment": "Все неверно",
    "error_flag": {
      "id": "1",
      "name": "Неверная картинка"
    }
  }
}
```

Добавить новую ошибку продукта можно, выполнив запрос:

`POST <%= config[:host] %>/products/#{PRODUCT_ID}/errors`

Параметр | Обязательный | Описание
--------- | ------- | -----------
product_error[error_flag_id] | Да | ID флага ошибки
product_error[error_comment] | - | Комментарий пользователя

## Получение списка флагов ошибок

```shell
curl "https://api.instamart.ru/v2/products/error_flags"
```
> Эта комманда возвращает следующий JSON:

```json
[
  {
    "error_flags": [
      {
        "id": 1,
        "name": "Неверное изображение"
      },
      {
        "id": 2,
        "name": "Неверное описание"
      },
      {
        "id": 3,
        "name": "Неверная цена"
      }
    ]
  }
]
```

Список всех возможных флагов ошибок продукта можно загрузить, выполнив запрос:

`GET https://api.instamart.ru/v2/products/error_flags`

### Структура объекта ErrorFlag

Атрибут | Описание
--------- | -----------
id | ID флага который надо использовать при создании ошибки
name | локализованное название
