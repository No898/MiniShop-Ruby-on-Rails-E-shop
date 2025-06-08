# ✅ TODO – MiniShop Rails E-commerce (Full Real-World Checklist)

## 1. Project Initialization

- [ ] Create new Rails project with Tailwind and SQLite  
      `rails new mini_shop --css=tailwind --database=sqlite3`
- [ ] Initialize git repository & add `.gitignore`
- [ ] Create README and this TODO checklist

---

## 2. Authentication & Users

- [ ] Add Devise gem to Gemfile, run `bundle install`
- [ ] Run `rails generate devise:install`
- [ ] Generate User model via Devise: `rails generate devise User`
- [ ] Add admin boolean to users:  
      `rails generate migration AddAdminToUsers admin:boolean`
- [ ] Run migrations
- [ ] Add default user/admin seed in `db/seeds.rb`
- [ ] Add logic to restrict admin features to admin users
- [ ] Implement user sign up, sign in, and sign out UI
- [ ] Add "Make admin" script or console command for user promotion

---

## 3. Database Models & Relations

- [ ] Design DB schema (draw or note models and relationships)
- [ ] Generate models:
    - [ ] Category (`name`, `description`)
    - [ ] Product (`name`, `description`, `price`, `category_id`, `image`)
    - [ ] Order (`user_id`, `address`, `status`, `total_price`)
    - [ ] OrderItem (`order_id`, `product_id`, `quantity`, `unit_price`)
- [ ] Add model relationships and validations
- [ ] Add sample seed data for products and categories

---

## 4. Admin Dashboard (CMS)

- [ ] Create admin namespace/routes (`namespace :admin`)
- [ ] CRUD controllers/views for:
    - Categories (admin only)
    - Products (admin only, with image upload)
- [ ] Admin dashboard home with quick stats/links
   - [ ] **Bonus:** Add charts for orders/revenue (e.g., with Chart.js)
- [ ] Orders overview (admin can see all, change status)
   - [ ] **Bonus:** Implement bulk actions for changing order statuses
- [ ] Admin-only navigation and layout (clear separation)

---

## 5. Public Storefront

- [ ] Home page: list featured or new products
- [ ] Category list page, with product count
- [ ] Product listing by category (filtering)
- [ ] Product detail page
- [ ] Add-to-cart button on product pages

---

## 6. Cart Logic

- [ ] Implement session-based cart structure
- [ ] Add "Add to cart" button (products)
- [ ] Cart page: list items, quantities, total price
- [ ] Ability to remove/update quantity in cart
- [ ] Cart persists until checkout or clear

---

## 7. Checkout & Orders

- [ ] Checkout form: collect shipping address
- [ ] Review order before confirmation
- [ ] Save order and order items to DB
- [ ] Empty cart after order
- [ ] Confirmation page with order summary
- [ ] Send confirmation email (optional, bonus)

---

## 8. User Profile

- [ ] User profile page (orders history, details)
- [ ] Order detail page with items and status

---

## 9. Product Images

- [ ] Install and configure ActiveStorage
- [ ] Attach image to Product model
- [ ] Show images on product pages and admin CRUD
- [ ] Add placeholder image when none uploaded

---

## 10. API Endpoints

- [ ] Build `/api/products` endpoint (index, show)
- [ ] Build `/api/orders` endpoint (admin only, or user's orders)
- [ ] Add authentication for API endpoints as needed

---

## 11. Styling & UX

- [ ] Use TailwindCSS for all styling
- [ ] Make site responsive for mobile/tablet/desktop
- [ ] Show helpful flash messages for all actions
- [ ] Consistent navigation and layout
- [ ] Admin area visually separated from public
- [ ] **Advanced UX with Hotwire:**
  - [ ] Implement dynamic "Add to cart" button without page reload (Turbo Streams)
  - [ ] Implement real-time product filtering on category pages (Turbo Frames)
- [ ] **Visual Feedback & Polish:**
  - [ ] Use modern "toast" notifications instead of classic flash messages
  - [ ] Add loading state indicators to key buttons (checkout, forms)
  - [ ] Design "empty state" pages (for empty cart, no orders, etc.)

---

## 12. Testing

- [ ] Model tests (validations, associations)
- [ ] Controller tests (admin CRUD, cart, checkout)
- [ ] Integration/system tests (sign up, order flow)
- [ ] Test API endpoints (JSON responses)

---

## 13. Error Handling & Monitoring

- [ ] Custom error pages (404, 500)
- [ ] Log errors (add Sentry/Rollbar if needed)
- [ ] Add notifications for critical failures (optional)

---

## 14. SEO & Social Sharing

- [ ] Set up dynamic `<title>` and `<meta description>` per page
- [ ] Add `<meta robots>`, `<link rel="canonical">` tags
- [ ] Add Open Graph (`og:`) and Twitter meta tags for sharing
- [ ] Use clean, human-friendly slugs/URLs (`/products/nice-tshirt`)
- [ ] Ensure all product/category images have descriptive `alt` text
- [ ] Generate `sitemap.xml` (gem: [sitemap_generator](https://github.com/kjvarga/sitemap_generator))
- [ ] Add and configure `robots.txt`
- [ ] Use semantic HTML (`header`, `nav`, `main`, `footer`, etc.)

---

## 15. Accessibility (a11y) & Performance

- [ ] Ensure sufficient color contrast and readable fonts
- [ ] All interactive elements are keyboard accessible
- [ ] Provide skip-to-content link
- [ ] Use labels for all form inputs
- [ ] All images have descriptive alt text
- [ ] Use ARIA attributes as needed
- [ ] Lazy-load product images
- [ ] Optimize image sizes for web
- [ ] Check Lighthouse accessibility and performance scores

---

## 16. Legal, Privacy & Analytics

- [ ] Add cookie consent bar/info (demo: just info is fine)
- [ ] Add Terms of Service and Privacy Policy page (basic)
- [ ] Display contact info (even as placeholder)
- [ ] Set up Google Analytics or other tracking
- [ ] Add conversion/event tracking for purchases

---

## 17. Internationalization (i18n)

- [ ] Set up Rails i18n (default EN, structure ready for more locales)
- [ ] Store texts in translation files
- [ ] Support currency/date formatting via i18n

---

## 18. Deployment & Documentation

- [ ] Add deployment instructions (Heroku, Fly.io, Render, or Railway)
- [ ] Set up ENV variables in `.env` or Rails secrets
- [ ] Add instructions for running seeds and image uploads
- [ ] Update README with final stack, setup, and screenshots

---

**Pro tip:**  
For teamwork or AI, split tasks into issues, keep PRs atomic (one feature/fix per PR), and document all custom logic in code comments or docs.

---
