# 🛒 MiniShop – Ruby on Rails Demo E-commerce App

This project is a demo e-commerce application built with Ruby on Rails, designed for learning and hands-on practice with real-world requirements.
It covers the complete flow from public storefront and user accounts to admin management, modern UI, SEO, accessibility, and production-ready details.

---

## Features

* User registration and login (Devise)
* Browse products and categories, including filtering
* Product detail pages with image uploads (ActiveStorage)
* Add products to a session-based cart
* Place orders with address and confirmation flow
* **Admin dashboard (mini CMS)** for managing products, categories, and orders
  * **Bonus:** Dashboard with stats/charts, bulk actions for management.
* User profile with order history
* API endpoints for products and orders (JSON)
* **Modern & Dynamic UI (TailwindCSS & Hotwire)**
  * Real-time updates for cart and product filters.
  * Enhanced UX with toast notifications and loading states.
  * Polished "empty-state" pages (e.g., for an empty cart).
* Basic tests (Minitest or RSpec)
* **SEO best practices:** meta tags, friendly URLs, sitemap, Open Graph
* **Accessibility:** semantic HTML, alt text, keyboard navigation
* **Error handling:** custom 404/500 pages
* **Legal & analytics:** cookies info, privacy policy, Google Analytics ready
* **Internationalization:** ready for multiple languages (i18n)

---

## Technologies

* Ruby on Rails 8+
* Hotwire (Turbo & Stimulus) for a modern, fast UI
* TailwindCSS
* Devise (authentication)
* ActiveStorage (image uploads)
* SQLite (default, easy to start) or PostgreSQL (recommended for production)
* Minitest or RSpec for tests
* [sitemap\_generator](https://github.com/kjvarga/sitemap_generator) (for sitemap.xml)
* i18n (for localization/multiple languages)

---

## Getting Started

```bash
bundle install
rails db:setup
rails server
```

---

## Project Structure & Roadmap

The project includes:

* **Public Storefront:** Home, categories, product listings, product details, add to cart, checkout.
* **User Area:** Registration/login, profile with order history.
* **Admin CMS:** Manage products, categories, orders. Separate admin navigation.
* **API:** Public JSON endpoints for products/orders.
* **SEO & Accessibility:** Dynamic titles/descriptions, friendly URLs, meta tags, a11y best practices.
* **Error & Legal:** Custom error pages, cookie info, privacy, analytics integration.
* **Ready for deployment:** Docs for Heroku, Fly.io, Render, etc.

See [`TODO.md`](./TODO.md) for a full, production-oriented checklist and step-by-step roadmap.

---

## License

MIT – use and modify for learning, personal or demo purposes.
