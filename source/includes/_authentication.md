# Аутентификация

Для доступа к API Instamart пользователь должен пройти процедуру аутентификации и получить токен доступа.

## Аутентификация через емейл и пароль

> Пример кода для аутентификации пользователя с учетными данными "test@test.ru", "qwer":

```shell
curl 'https://api.instamart.ru/v2/sessions' \
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
`POST https://api.instamart.ru/v2/sessions`

Учетные данные пользователя (емейл и пароль) передаются в заголовке запроса вида:
`Authorization: Basic #{DIGEST}`
где `#{DIGEST}` формируется следующим способом: `base64(email + ':' + password)`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
email | Да | Емейл пользователя
password | Да | Пароль пользователя

## Аутентификация через социальные сети

> Пример кода для аутентификации пользователя через vkontakte 

```shell
curl 'https://api.instamart.ru/v2/auth_providers/vkontakte/sessions' \
  -X POST \
  -d uid=0
  -d session[first_name]=fname
  -d session[last_name]=lname
  -d session[email]=mail@example.com
```
> Ответ будет содержать следующие данные

```json
{
  "access_token": "FWtn0HAjBD6rNxWwEV0Cj7JXSEPGJQ"
}
```

Получить токен можно, выполнив запрос:
`POST https://api.instamart.ru/v2/auth_providers/#{PROVIDER_ID}/sessions`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
session[provider_id] | Да | Название социальной сети (vkontakte / facebook)
session[uid] | Да | Идентификатор пользователя в социальной сети
session[first_name] | Да (в первый раз) | Имя пользователя
session[last_name] | Да (в первый раз) | Фамилия пользователя
session[email] | Да (в первый раз) | Емейл пользователя
