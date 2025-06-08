# 🛒 MiniShop – Ruby on Rails Demo E-commerce App

This project is a simple demo e-commerce application built with Ruby on Rails.  
It’s designed for learning and practice, focusing on real-world features like products, orders, users, a built-in admin CMS, and modern UI.

## Features

- User registration and login (Devise)
- Browse products and categories
- Add products to a cart (session-based)
- Place orders (checkout with address)
- **Admin dashboard (mini CMS)** for managing products, categories, and viewing orders  
- Product image uploads (ActiveStorage)
- Modern design using TailwindCSS

**Bonus/Optional:**
- API endpoints for products and orders
- Basic tests (Minitest)

---

## Technologies

- Ruby on Rails 8+
- TailwindCSS
- Devise (authentication)
- ActiveStorage (image uploads)
- Simple built-in admin CMS
- SQLite or PostgreSQL

---

## Getting Started

```bash
bundle install
rails db:setup
rails server
