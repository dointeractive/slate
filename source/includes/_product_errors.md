# Ошибки продуктов

## Создание новой ошибки

```shell
curl "<%= config[:host] %>/product_errors" \
  -H "Authorization: Token token=#{TOKEN}" \
  -X POST \
  -d "product_error[product_id]=111" \
  -d "product_error[is_picture]=true" \
  -d "product_error[is_description]=true" \
  -d "product_error[is_price]=true" \
  -d "product_error[customer_comment]=Все неверно" \
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "product_error": {
    "id": 1,
    "user_id": 1,
    "product_id": 111,
    "is_picture": true,
    "is_description": true,
    "is_price": true,
    "customer_comment": "Все неверно"
  }
}
```

Добавить новую ошибку продукта можно, выполнив запрос:

`POST <%= config[:host] %>/product_errors`

Параметр | Обязательный | Описание
--------- | ------- | -----------
product_error[product_id] | Да | ID продукта с ошибкой
product_error[is_picture] | - | Неверное изображение (true/false). По-умолчанию false
product_error[is_description] | - | Неверное описание (true/false). По-умолчанию false
product_error[is_price] | - | Неверная цена (true/false). По-умолчанию false
product_error[customer_comment] | - | Комментарий пользователя
