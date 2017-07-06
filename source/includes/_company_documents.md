# Реквизиты юридического лица

## Запрос на получение списка всех реквизитов юридических лиц

Получить список всех реквизитов юридических лиц можно, выполнив запрос:

`GET <%= config[:host] %>/company_documents`

```shell
curl "<%= config[:host] %>/company_documents" \
  -H "Authorization: Token token=#{TOKEN}"
```

> Ответ будет содержать следующие данные:

```json
{
  "company_documents": [
    {
      "id": 678,
      "name": "ООО Гугл",
      "inn": "1234567890",
      "kpp": "123456789",
      "bik": "123456789",
      "bank": "чудо банк",
      "correspondent_account": "12345678901234567890",
      "operating_account": "12345678901234567890",
      "address": "123123, г. Москва, ул. Тверская, 1",
      "payment_tool": {
        "id": 684,
        "name": "ООО Гугл, ИНН: 1234567890",
        "type": "sber_bank_invoice"
      }
    },
    {
      "id": 679,
      "name": "ООО Яндекс",
      "inn": "1234567890",
      "kpp": "123456789",
      "bik": "123456789",
      "bank": null,
      "correspondent_account": "12345678901234567890",
      "operating_account": "12345678901234567890",
      "address": "123123, г. Москва, ул. Тверская, 2",
      "payment_tool": {
        "id": 685,
        "name": "ООО Яндекс, ИНН: 1234567890",
        "type": "sber_bank_invoice"
      }
    }
  ]
}
```

## Запрос на создание нового реквизита юридического лица

```shell
curl "<%= config[:host] %>/company_documents" \
  -H "Authorization: Token token=#{TOKEN}"
  -X POST \
  -d "company_document[name]=ООО Название Компании" \
  -d "company_document[address]=123123, г. Москва, ул. Тверская, 1" \
  -d "company_document[inn]=1234567890" \
  -d "company_document[kpp]=123456789" \
  -d "company_document[bik]=123456789" \
  -d "company_document[correspondent_account]=12345678901234567890" \
  -d "company_document[operating_account]=12345678901234567890"
```

> Ответ будет содержать следующие данные:

```json
{
  "company_document": {
    "id": 680,
    "name": "ООО Название Компании",
    "inn": "1234567890",
    "kpp": "123456789",
    "bik": "123456789",
    "bank": "чудо банк",
    "correspondent_account": "12345678901234567890",
    "operating_account": "12345678901234567890",
    "address": "123123, г. Москва, ул. Тверская, 1",
    "payment_tool": {
      "id": 686,
      "name": "ООО Название Компании, ИНН: 1234567890",
      "type": "sber_bank_invoice"
    }
  }
}
```

Создать новый реквизит юридического лица можно, выполнив запрос:

`POST <%= config[:host] %>/company_documents`

Параметр | Обязательный | Описание
--------- | ------- | -----------
company_document[name] | Да | Юридическое лицо
company_document[inn] | Да | ИНН
company_document[kpp] | Да | КПП
company_document[bik] | Да | БИК
company_document[correspondent_account] | Да | Корреспондентский счет
company_document[operating_account] | Да | Расчетный счет
company_document[address] | - | Юридическое адресс
company_document[bank] | - | Банк

## Запрос на обновление реквизита юридического лица

```shell
curl "<%= config[:host] %>/company_documents/680" \
  -H "Authorization: Token token=#{TOKEN}" \
  -X PUT \
  -d "company_document[name]=ООО Новое Название Компании"
```

> В случае если данные были указаны верно, сервер вернет ответ:

```json
{
  "company_document": {
    "id": 680,
    "name": "ООО Новое Название Компании",
    "inn": "1234567890",
    "kpp": "123456789",
    "bik": "123456789",
    "bank": "чудо банк",
    "correspondent_account": "12345678901234567890",
    "operating_account": "12345678901234567890",
    "address": "123123, г. Москва, ул. Тверская, 1",
    "payment_tool": {
      "id": 686,
      "name": "ООО Название Компании, ИНН: 1234567890",
      "type": "sber_bank_invoice"
    }
  }
}
```

Изменить реквизит юридического лица можно, выполнив запрос:

`PUT <%= config[:host] %>/company_documents/#{ID}`

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID юридического лица
company_document[name] | Да | Юридическое лицо
company_document[inn] | Да | ИНН
company_document[kpp] | Да | КПП
company_document[bik] | Да | БИК
company_document[correspondent_account] | Да | Корреспондентский счет
company_document[operating_account] | Да | Расчетный счет
company_document[address] | - | Юридическое адресс
company_document[bank] | - | Банк



## Запрос на удаление юридического лица

```shell
curl "<%= config[:host] %>/company_documents/680" \
  -H "Authorization: Token token=#{TOKEN}" \
  -X DELETE
```

> В случае успешного удаления сервер вернет пустой ответ с кодом 200

Удалить юридическое лицо можно, выполнив запрос:

`DELETE <%= config[:host] %>/company_documents/#{ID}`

Параметр | Обязательный | Описание
--------- | ------- | -----------
ID | Да | ID юридического лица
