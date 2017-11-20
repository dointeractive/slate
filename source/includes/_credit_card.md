# Банковские карты

/credit_cards

## Запрос на получение списка карт

Получить список всех карт пользователя можно, выполнив запрос:

`GET https://api.instamart.ru/v2/credit_cards`

```shell
curl "https://api.instamart.ru/v2/credit_cards" \
  -H "Authorization: Token token=#{TOKEN}"
```

> Ответ будет содержать следующие данные:

```json
{
  "credit_cards": [
    {
      "id": 14959,
      "title": "Зарплатная",
      "name": "IVAN IVANOV",
      "year": "22",
      "month": "12",
      "last_digits": "1111"
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

## Запрос на получение карты по ID

```shell
curl "https://api.instamart.ru/v2/credit_cards/14959" \
  -H "Authorization: Token token=#{TOKEN}"
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "credit_card": {
    "id": 14959,
    "title": "Зарплатная",
    "name": "IVAN IVANOV",
    "year": "22",
    "month": "12",
    "last_digits": "1111"
  }
}
```

Получить карту можно, выполнив запрос:

`GET https://api.instamart.ru/v2/credit_cards/#{ID}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID карты

## Запрос на создание карты

```shell
curl "https://api.instamart.ru/v2/credit_cards" \
  -H "Authorization: Token token=#{TOKEN}"
  -X POST \
  -d "credit_card[title]=Зарплатная" \
  -d "credit_card[name]=IVAN IVANOV" \
  -d "credit_card[year]=22" \
  -d "credit_card[month]=12" \
  -d "credit_card[last_digits]=1111" \
  -d "credit_card[cryptogram_packet]=" \
```

> Ответ будет содержать следующие данные:

```json
{
  "credit_card": {
    "id": 14959,
    "title": "Зарплатная",
    "name": "IVAN IVANOV",
    "year": "22",
    "month": "12",
    "last_digits": "1111"
  }
}
```

Создать новую карту пользователя можно, выполнив запрос:

`POST https://api.instamart.ru/v2/credit_cards`

Параметр | Обязательный | Описание
--------- | ------- | -----------
credit_card[title] | - | Название карты
credit_card[name] | Да | Имя держателя карты
credit_card[year] | Да | Год
credit_card[month] | Да | Месяц
credit_card[last_digits] | Да | Последние 4 цифры номера карты
credit_card[cryptogram_packet] | Да | Криптограмма

### Получение криптограммы(cryptogram_packet)
Чтобы создать криптограмму, надо использовать [Cloudpayments SDK](https://cloudpayments.ru/Docs/MobileSDK)

## Запрос на удаление карты

```shell
curl "https://api.instamart.ru/v2/credit_cards/14959" \
  -H "Authorization: Token token=#{TOKEN}" \
  -X DELETE
```

> В случае успешного удаления сервер вернет пустой ответ с кодом 200

Удалить карту пользователя можно, выполнив запрос:

`DELETE https://api.instamart.ru/v2/credit_cards/#{ID}`

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID карты
