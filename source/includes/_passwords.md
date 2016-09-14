# Восстановление пароля

## Запрос на восстановление пароля

> Пример кода c запросом на "восстановление пароля"

```shell
curl 'https://api.instamart.ru/v2/passwords/reset' \
  -X POST \
  -d password_reset[email]=#{EMAIL}
```

> Если пользователя не существует, то сервер вернет ответ с кодом 404

<aside class="warning">
  not implemented
</aside>

Отправить пользователю письмо с инструкцией "восстановления пароля" можно, выполнив запрос:
`POST https://api.instamart.ru/v2/passwords/reset`

Письмо будет содержать ссылку на приложение с параметром `reset_password_token`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
password_reset[email] | Да | Емейл пользователя

## Сброс пароля

> Пример кода c запросом сброса пароля

```shell
curl 'https://api.instamart.ru/v2/passwords' \
  -X POST \
  -d password_reset[reset_password_token]=#{TOKEN}
  -d password_reset[password]=#{PASSWORD}
  -d password_reset[password_confirmation]=#{PASSWORD_CONFIRMATION}
```

<aside class="warning">
  not implemented
</aside>

Сбросить пароль пользователя можно, выполнив запрос:
`POST https://api.instamart.ru/v2/passwords`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
password_reset[reset_password_token] | Да | Токен для сброса пароля
password_reset[password] | Да | Пароль
password_reset[password_confirmation] | Да | Подтверждение пароля
