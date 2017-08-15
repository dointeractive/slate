# Пользователи

## Регистрация нового пользователя

> Пример кода для регистрации нового пользователя:

```shell
curl 'https://api.instamart.ru/v2/users' \
  -X POST \
  -d user[email]=#{EMAIL} \
  -d user[first_name]=#{FIRSTNAME} \
  -d user[last_name]=#{LASTNAME} \
  -d user[password]=#{PASSWORD}
```

Зарегистрировать нового пользователя можно, выполнив запрос:

`POST https://api.instamart.ru/v2/users`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
user[email] | Да | Емейл пользователя
user[password] | Да | Пароль
user[first_name] | Да | Имя пользователя
user[last_name] | Да | Фамилия пользователя
user[location] | Нет | Местоположение пользователя

## Изменение данных пользователя

> Пример кода для изменения местоположения пользователя:

```shell
curl 'https://api.instamart.ru/v2/users/test@test.com' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -X PUT \
  -d user[location]=Perm \
```

```json
{
  "user": {
    "email": "test@test.com",
    "first_name": "Ivan",
    "last_name": "Petrov",
    "location": "Perm"
  }
}
```

> Пример кода для изменения настроек способа связи пользователя и действия при отсутсвии товара:

```shell
curl 'https://api.instamart.ru/v2/users/test@test.com' \
  -H 'Authorization: Token token=#{TOKEN}' \
  -X PUT \
  -d user[config_attributes][communication_method]=sms \
  -d user[config_attributes][replacement_method]=collector
```

```json
{
  "user": {
    "email": "test@test.com",
    "first_name": "Ivan",
    "last_name": "Petrov",
    "config": {
      "communication_method": "sms",
      "replacement_method": "collector"
    }
  }
}
```

Изменить данные пользоватeля можно, выполнив следующий запрос:

`PUT https://api.instamart.ru/v2/users/#{EMAIL}`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
email | Да | Емейл пользователя
user[first_name] | - | Имя пользователя
user[last_name] | - | Фамилия пользователя
user[location] | - | Местоположение пользователя
user[config_attributes][communication_method] | - | Способ связи с пользователем
user[config_attributes][replacement_method] | - | Действия при отсутсвии товара

### Возможные варианты поля 'Способ связи с пользователем'

Можно получить с помощью API [Флаги способов связи при необходимости замены товара](#flaghi-sposobov-sviazi-pri-nieobkhodimosti-zamieny-tovara)

### Возможные варианты поля 'Действия при отсутсвии товара'

Можно получить с помощью API [Флаги действий в случае отсутсвия товара](#flaghi-dieistvii-v-sluchaie-otsutsviia-tovara)

## Получение данных пользователя

> Пример кода, чтобы определить зарегистрирован пользователь или нет:

```shell
curl 'https://api.instamart.ru/v2/users/test@test.com'
```
> Если пользователь существует, ответ будет содержать следующие данные:

```json
{
  "user": {
    "email": "test@test.com"
  }
}
```

> Если пользователя не существует, сервер вернет ответ с кодом 404.<br>Если в запросе указать заголовок Authorization, то ответ будет содержать дополнительные данные:

```shell
curl 'https://api.instamart.ru/v2/users/test@test.com'
  -H 'Authorization: Token token=#{TOKEN}'
```

```json
{
  "user": {
    "email": "test@test.com",
    "first_name": "Ivan",
    "last_name": "Petrov",
    "location": "Moscow",
    "config": {
      "communication_method": "sms"
    }
  }
}
```

Получить данные пользователя можно, выполнив запрос:
`GET https://api.instamart.ru/v2/users/#{EMAIL}`

Запрос к этому ресурсу можно выполнять как с указанием токена аутентификации так и без. Без указания токена сервер вернет ограниченное количество информации.

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
email | Да | Емейл пользователя
