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
  - taxons
  - departments
  - products
  - search
  - replacement_policies
  - orders
  - shipping_methods
  - delivery_windows
  - payment_tool_types
  - payment_tools
  - payments
  - order_reviews
  - app_reviews
  - credit_card
  - flags
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

