# Категории с группами

> Пример кода для получения списка всех категорий

```shell
curl "<%= config[:host] %>/taxons?sid=1"
```
> Ответ будет содержать следующие данные:

```json
{
  "taxons": [
    {
      "id": 172,
      "type": "department",
      "name": "Продукты питания",
      "icon": {
        "mini_url":
          "http://im.dev/spree/taxons/172/mini/%D0%9F%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82%D1%8B_%D0%BF%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D1%8F.png?1453225215",
        "normal_url":
          "http://im.dev/spree/taxons/172/normal/%D0%9F%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82%D1%8B_%D0%BF%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D1%8F.png?1453225215"
      },
      "alt_icon": {
        "url": "http://instamart.ru/icons/1/original/%D1%87%D0%B0%D0%B8%CC%86-01.svg?1453649106"
      },
      "children": [
        {
          "id": 466,
          "type": "department",
          "name": "Чай и кофе",
          "icon": {
            "mini_url":
              "http://im.dev/spree/taxons/466/mini/%D0%A7%D0%B0%D0%B8%CC%86_%D0%B8_%D0%BA%D0%BE%D1%84%D0%B5.png?1453225181",
            "normal_url":
              "http://im.dev/spree/taxons/466/normal/%D0%A7%D0%B0%D0%B8%CC%86_%D0%B8_%D0%BA%D0%BE%D1%84%D0%B5.png?1453225181"
          },
          "alt_icon": {
            "url": "http://instamart.ru/icons/2/original/%D1%87%D0%B0%D0%B8%CC%86-02.svg?1453649106"
          },
          "children": [
            {
              "id": 187,
              "type": "taxon",
              "name": "Чай",
              "icon": {
                "mini_url":
                  "http://im.dev/spree/taxons/187/mini/%D1%87%D0%B0%D0%B8%CC%86-01.png?1453649106",
                "normal_url":
                  "http://im.dev/spree/taxons/187/normal/%D1%87%D0%B0%D0%B8%CC%86-01.png?1453649106"
              },
              "alt_icon": {
                "url": "http://instamart.ru/icons/3/original/%D1%87%D0%B0%D0%B8%CC%86-03.svg?1453649106"
              }
            },
            {
              "id": 188,
              "type": "taxon",
              "name": "Кофе",
              "icon": {
                "mini_url":
                  "http://im.dev/spree/taxons/188/mini/%D0%BA%D0%BE%D1%84%D0%B5-01.png?1453649151",
                "normal_url":
                  "http://im.dev/spree/taxons/188/normal/%D0%BA%D0%BE%D1%84%D0%B5-01.png?1453649151"
              },
              "alt_icon": {
                "url": "http://instamart.ru/icons/4/original/%D1%87%D0%B0%D0%B8%CC%86-04.svg?1453649106"
              }
            }
          ]
        }
      ]
    }
  ],
  "promoted_taxons": [
    {
      "id": 663,
      "type": "department",
      "name": "Спецпредложения",
      "icon": {
        "mini_url": "http://im.dev/assets/default_taxon.png",
        "normal_url": "http://im.dev/assets/default_taxon.png"
      },
      "alt_icon": {
        "url": "http://instamart.ru/icons/5/original/%D1%87%D0%B0%D0%B8%CC%86-05.svg?1453649106"
      },
      "children": [
        {
          "id": 665,
          "type": "department",
          "name": "Unilever",
          "icon": {
            "mini_url": "http://im.dev/assets/default_taxon.png",
            "normal_url": "http://im.dev/assets/default_taxon.png"
          },
          "alt_icon": {
            "url": "http://instamart.ru/icons/6/original/%D1%87%D0%B0%D0%B8%CC%86-06.svg?1453649106"
          },
          "children": [
            {
              "id": 911,
              "type": "taxon",
              "name": "Бакалея",
              "icon": {
                "mini_url":
                  "http://im.dev/spree/taxons/911/mini/%D0%91%D0%B0%D0%BA%D0%B0%D0%BB%D0%B5%D1%8F.png?1453225221",
                "normal_url":
                  "http://im.dev/spree/taxons/911/normal/%D0%91%D0%B0%D0%BA%D0%B0%D0%BB%D0%B5%D1%8F.png?1453225221"
              },
              "alt_icon": {
                "url": "http://instamart.ru/icons/7/original/%D1%87%D0%B0%D0%B8%CC%86-07.svg?1453649106"
              }
            }
          ]
        }
      ]
    }
  ]
}
```
API возвращает полную иерархию всех категорий(вместе с группой). Ответ содержит два объекта верхего уровня: `taxons` и `promoted_taxons`.
`taxons` – это список всех категорий сайта. `promoted_taxons` – список маркетинговых категорий "скидки", "новогоднее предложение" и пр.

`taxons` и `promoted_taxons` имеют древовидную структуру неограниченной вложенности.

Все объекты категорий имеют следующую структуру:

### Структура объекта Taxon

Атрибут | Описание
--------- | -----------
id | id категории
type | Тип категории: __department__ или __taxon__
name | Название категори
icon | Иконка категории
alt_icon | Альтернатинвая иконка категории
children | Список дочерних категорий

От значения поля `type` зависит способ отображения содержимого категории.
Если `type` содержит значение "department" – для отоброжения содержимого категории нужно использовать API `/v2/departments`. Если `type` содержит "taxon" – нужно использовать API `/v2/products`


Получить список всех категорий можно, выполнив запрос:

`GET <%= config[:host] %>/taxons`

### Параметры запроса

Параметр | Обязательный | Описание
--------- | ------- | -----------
`sid` | Да | ID магазина для которого необходимо получить список категорий.
