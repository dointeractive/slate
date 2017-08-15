---
title: Документация Instamart API

language_tabs:
  - shell

toc_footers:
  - <a href='#'></a>

includes:
  - users
  - authentication
  - passwords
  - referrals
  - stores
  - retailers
  - addresses
  - ship_address_changes
  - categories
  - departments
  - products
  - search
  - orders
  - shipping_methods
  - delivery_windows
  - payment_tools
  - payments
  - order_reviews
  - flags
  - communication_methods
  - replacement_methods
  - errors

search: true
---

# Введение

Спецификация API Instamart

> API endpoint

```shell
http://api.instamart.ru
```


Instamart API построено в соответствии с архитектурой REST. Все URL в API имеют единую структуру и соответствуют отдельным ресурсам. Ответы API используют HTTP коды состояния для обозначения результата выполнения запроса. Мы используем встроенные механизмы HTTP, такие как HTTP методы, HTTP аутентификация и заголовки, которые поддерживаются всеми HTTP клиентами. Все запросы к API возвращают ответ в формате JSON, со всеми данными, включая ошибки.

Чтобы облегчить изучение API пользователю предоставляется тестовый API ключ.

