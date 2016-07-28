# Пользователи

## Регистрация нового пользователя

> Пример кода для регистрации нового пользователя:

```shell
curl 'https://api.instamart.ru/v1/users/registrations' \
  -X POST \
  -d password=<PASSWORD> \
  -d first_name=<FIRSTNAME> \
  -d last_name=<LASTNAME>
```

Зарегистрировать нового пользователя можно, выполнив запрос:

`POST https://api.instamart.ru/v1/users/registrations`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
email | Да | Емейл пользователя
password | Да | Пароль
first_name | Да | Имя пользователя
last_name | Да | Фамилия пользователя

## Изменение данных пользователя

> Пример кода для изменения, местоположения пользователя:

```shell
curl 'https://api.instamart.ru/v1/users/test@test.com' \
  -H 'Authorization: Basic <TOKEN>' \
  -X PATCH \
  -d location=Perm
```
```json
{
  "email": "test@test.com",
  "first_name": "Ivan",
  "last_name": "Petrov",
  "location": "Perm"
}
```

Изменить данные пользоватeля можно, выполнив следующий запрос:

`PUT https://api.instamart.ru/v1/users/<EMAIL>`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
first_name | - | Имя пользователя
last_name | - | Фамилия пользователя
location | - | Местоположение пользователя

## Получение данных пользователя

> Пример кода, чтобы определить зарегистрирован пользователь или нет:

```shell
curl 'https://api.instamart.ru/v1/users/test@test.com'
```
> Если пользователь существует, ответ будет содержать следующие данные:

```json
{
  "email": "test@test.com"
}
```

> Если пользователя не существует, сервер вернет ответ с кодом 404.<br>Если в запросе указать заголовок Authorization, то ответ будет содержать дополнительные данные:

```shell
curl 'https://api.instamart.ru/v1/users/test@test.com'
  -H 'Authorization: Basic <TOKEN>'
```

```json
{
  "email": "test@test.com",
  "first_name": "Ivan",
  "last_name": "Petrov",
  "location": "Moscow"
}
```

Получить данные пользователя можно, выполнив запрос:
`GET https://api.instamart.ru/v1/users/<EMAIL>`

Запрос к этому ресурсу можно выполнять как с указанием токена аутентификации так и без. Без указания токена сервер вернет ограниченное количество информации.

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
email | Да | Емейл пользователя
