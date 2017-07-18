# Категории с группами

> Пример кода для получения списка всех категорий

```shell
curl "<%= config[:host] %>/taxons?rid=1"
```
> Ответ будет содержать следующие данные:

```json
{
  "categories": [
    {
      "id": 172,
      "type": "department",
      "name": "Продукты питания",
      "icon": {
        "mini_url": "http://im.dev/spree/taxons/172/mini/%D0%9F%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82%D1%8B_%D0%BF%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D1%8F.png?1453225215",
        "normal_url": "http://im.dev/spree/taxons/172/normal/%D0%9F%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82%D1%8B_%D0%BF%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D1%8F.png?1453225215"
      },
      "children": [
        {
          "id": 466,
          "type": "department",
          "name": "Чай и кофе",
          "icon": {
            "mini_url": "http://im.dev/spree/taxons/466/mini/%D0%A7%D0%B0%D0%B8%CC%86_%D0%B8_%D0%BA%D0%BE%D1%84%D0%B5.png?1453225181",
            "normal_url": "http://im.dev/spree/taxons/466/normal/%D0%A7%D0%B0%D0%B8%CC%86_%D0%B8_%D0%BA%D0%BE%D1%84%D0%B5.png?1453225181"
          },
          "children": [
            {
              "id": 187,
              "type": "taxon",
              "name": "Чай",
              "icon": {
                "mini_url": "http://im.dev/spree/taxons/187/mini/%D1%87%D0%B0%D0%B8%CC%86-01.png?1453649106",
                "normal_url": "http://im.dev/spree/taxons/187/normal/%D1%87%D0%B0%D0%B8%CC%86-01.png?1453649106"
              }
            }
          ]
        }
      ]
    }
  ],

  "promoted_categoris": []
}
```
API возвращает полную иерархию всех категорий(вместе с группой). Ответ содержит два объекта верхего уровня: `categories` и `promoted_categories`.
`categories` – это список всех категорий сайта. `promoted_categories` – список маркетинговых категорий "скидки", "новогоднее предложение" и пр.
Все объекты категорий имеют следующую структуру:

### Структура объекта Category

Атрибут | Описание
--------- | -----------
id | id категории
type | Тип категории: __department__ или __taxon__
name | Название категори
children | Список дочерних категорий

От значения поля `type` зависит способ отображения содержимого категории.
Если `type` содержит значение "department" – для отоброжения содержимого категории нужно использовать API `/v2/departments`. Если `type` содержит "taxon" – нужно использовать API `/v2/products`


Получить список всех категорий можно, выполнив запрос:

`GET <%= config[:host] %>/taxons`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
`rid` | Да | ID ритейлера для которого необходимо получить список категорий.
