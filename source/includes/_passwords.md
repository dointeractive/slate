# Восстановление пароля

## Запрос на восстановление пароля

> Пример кода c запросом на "восстановление пароля"

```shell
curl 'https://api.instamart.ru/v1/passwords/reset' \
  -X POST \
  -d email=<EMAIL>
```

> Если пользователя не существует, то сервер вернет ответ с кодом 404

Отправить пользователю письмо с инструкцией "восстановления пароля" можно, выполнив запрос:
`POST https://api.instamart.ru/v1/passwords/reset`

Письмо будет содержать ссылку на приложение с параметром `reset_password_token`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
email | Да | Емейл пользователя


## Сброс пароля

> Пример кода c запросом сброса пароля

```shell
curl 'https://api.instamart.ru/v1/passwords' \
  -X POST \
  -d reset_password_token=<TOKEN>
  -d password=<PASSWORD>
  -d password_confirmation=<PASSWORD_CONFIRMATION>
```

Сбросить пароль пользователя можно, выполнив запрос:
`POST https://api.instamart.ru/v1/passwords`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
reset_password_token | Да | Токен для сброса пароля
password | Да | Пароль
password_confirmation | Да | Подтверждение пароля


