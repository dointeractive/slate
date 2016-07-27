# Аутентификация

Для доступа к API Instamart пользователь должен пройти процедуру аутентификации и получить токен доступа.

## Аутентификация через емейл и пароль

> Пример кода для аутентификации пользователя с учетными данными "test@test.ru", "qwer":

```shell
curl 'http://api.instamart.ru/v1/sessions' \
  -X POST \
  -H 'Authorization: Basic dGVzdEB0ZXN0LnJ1OnF3ZXIK'
```
> Ответ будет содержать следующие данные

```json
{
  "access_token": "FWtn0HAjBD6rNxWwEV0Cj7JXSEPGJQ"
}
```

Аутентификация осуществляется методом [HTTP Basic Auth](https://en.wikipedia.org/wiki/Basic_access_authentication).

Получить токен можно, выполнив запрос:
`POST http://api.instamart.ru/v1/sessions`

Учетные данные пользователя (емейл и пароль) передаются в заголовке запроса вида:
`Authorization: Basic <DIGEST>`
где `<DIGEST>` формируется следующим способом: `base64(email + ':' + password)`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
email | Да | Емейл пользователя
password | Да | Пароль пользователя

## Аутентификация через социальные сети

> Пример кода для аутентификации пользователя через vkontakte 

```shell
curl 'http://api.instamart.ru/v1/XXX' \
  -X POST \
  -d uid=<UID> \
  -d provider=vkontakte
```
> Ответ будет содержать следующие данные

```json
{
  "access_token": "FWtn0HAjBD6rNxWwEV0Cj7JXSEPGJQ"
}
```

Получить токен можно, выполнив запрос:
`POST http://api.instamart.ru/v1/XXX`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
uid | Да | Идентификатор пользователя в социальной сети
provider | Да | Название социальной сети (vkontakte / facebook)
