# Union Shop - Project Requirements

## Project Overview

This is a Flutter-based e-commerce mobile application assessment that replicates the functionality of an online shop. The project focuses on **functionality over visual design** and should primarily target mobile view with responsive desktop support.

### Key Constraints
- Mobile-first design (desktop responsiveness required but secondary)
- Use copyright-free or AI-generated images only
- Hardcoded/dummy data acceptable where specified
- No real monetary transactions required
- Focus on feature implementation over pixel-perfect design

---

## Feature Requirements

### BASIC Features (40%)

#### 1. Static Homepage (5%)
**Description:** Homepage layout with static content focusing on mobile view.

**Acceptance Criteria:**
- Display app branding/logo
- Show featured sections (e.g., new arrivals, bestsellers, sale items)
- Include category/collection preview cards
- Hardcoded data is acceptable
- Mobile-optimized layout
- Basic visual appeal without extensive styling

**Technical Specifications:**
- Widget: `HomePage` or similar
- Route: `/` or `/home`
- Assets: Featured product images, banners

---

#### 2. About Us Page (5%)
**Description:** Separate static page with company information.

**Acceptance Criteria:**
- Distinct page separate from homepage
- Company/shop description and mission
- Contact information or location details
- Team information (can be dummy data)
- Simple, readable layout

**Technical Specifications:**
- Widget: `AboutPage`
- Route: `/about`
- Navigation: Accessible from navbar or footer

---

#### 3. Footer Widget (4%)
**Description:** Footer with dummy links and information.

**Acceptance Criteria:**
- Present in at least one page
- Contains multiple sections (e.g., Quick Links, Contact, Social Media)
- Dummy links acceptable (don't need to navigate)
- Displays shop information
- Responsive layout

**Technical Specifications:**
- Widget: `FooterWidget`
- Reusable component
- Dummy data for links and contact info

---

#### 4. Collections Page (5%)
**Description:** Page displaying various product collections.

**Acceptance Criteria:**
- Display multiple collection cards/tiles
- Each collection shows image and title
- Hardcoded collection data acceptable
- Grid or list layout
- Visual distinction between collections

**Technical Specifications:**
- Widget: `CollectionsPage`
- Route: `/collections`
- Data: List of collection objects with name, image, description
- Collections examples: Clothing, Stationery, Electronics, Accessories, etc.

---

#### 5. Dummy Collection Page (5%)
**Description:** Page displaying products within a specific collection with non-functioning widgets.

**Acceptance Criteria:**
- Display products belonging to one collection
- Show product grid/list with images, names, prices
- Include dropdown menus (e.g., sort by, filter)
- Include filter options (e.g., size, color, price range)
- Widgets don't need to function yet
- Hardcoded product data acceptable

**Technical Specifications:**
- Widget: `CollectionProductsPage`
- Route: `/collections/:collectionId` or `/collection/:name`
- Data: List of product objects
- UI Elements: Dropdowns, filter buttons (static)

---

#### 6. Dummy Product Page (4%)
**Description:** Product detail page with dropdowns, buttons, and widgets (non-functioning).

**Acceptance Criteria:**
- Display product images (image gallery or carousel)
- Show product name, price, description
- Include size/color/variant dropdowns (static)
- Include quantity selector (static)
- Include "Add to Cart" button (non-functioning)
- Display product specifications or details
- Hardcoded product data acceptable

**Technical Specifications:**
- Widget: `ProductPage`
- Route: `/product/:productId`
- Data: Product object with images, name, price, description, variants
- UI Elements: Image carousel, dropdowns, buttons (static)

---

#### 7. Sale Collection Page (4%)
**Description:** Page showing sale products with discounted prices and promotional messaging.

**Acceptance Criteria:**
- Display sale/discounted products
- Show original and sale prices
- Include promotional banners or messaging
- Visual indicators for discounts (e.g., badges, strikethrough)
- Widgets don't need to function
- Hardcoded data acceptable

**Technical Specifications:**
- Widget: `SaleCollectionPage`
- Route: `/sale` or `/collections/sale`
- Data: Product objects with original and sale prices
- UI Elements: Discount badges, promotional banners

---

#### 8. Authentication UI (3%)
**Description:** Login and signup pages with relevant forms (non-functioning).

**Acceptance Criteria:**
- Login form with email/password fields
- Signup/register form with required fields
- Form validation UI (doesn't need to actually validate)
- Submit buttons (non-functioning)
- Links between login/signup pages
- Optional: Social login buttons (non-functioning)

**Technical Specifications:**
- Widget: `AuthPage` or `LoginPage` and `SignupPage`
- Route: `/auth`, `/login`, `/signup`
- UI Elements: Text fields, buttons, links
- No backend integration required at this stage

---

#### 9. Static Navbar (5%)
**Description:** Top navigation bar on desktop view that collapses to menu on mobile.

**Acceptance Criteria:**
- Horizontal navigation bar on desktop
- Collapses to hamburger menu on mobile
- Contains shop logo/branding
- Navigation links (can be non-functioning initially)
- Search icon/button (can be non-functioning initially)
- Cart icon with optional badge
- Account/login icon
- Responsive behavior between desktop and mobile

**Technical Specifications:**
- Widget: `NavBar` or `AppBar` custom widget
- Responsive: Use MediaQuery or LayoutBuilder
- Mobile: Drawer or side menu
- Desktop: Horizontal navigation bar

---

### INTERMEDIATE Features (35%)

#### 10. Dynamic Collections Page (6%)
**Description:** Collections page populated from data models or services with functioning widgets.

**Acceptance Criteria:**
- Collections loaded from data model/service (not hardcoded inline)
- Implement sorting functionality (e.g., A-Z, newest)
- Implement filtering options (e.g., by category)
- Implement pagination or infinite scroll
- All widgets must function properly
- State management for data loading

**Technical Specifications:**
- Data Model: `Collection` class
- Service: `CollectionService` or data provider
- State Management: Provider, Riverpod, Bloc, or setState
- Features: Sort, filter, paginate
- Navigate to individual collection pages


---

#### 11. Dynamic Collection Page (6%)
**Description:** Product listings within a collection populated from data models with functioning widgets.

**Acceptance Criteria:**
- Products loaded from data model/service
- Sorting functionality (e.g., price low-high, newest, popularity)
- Filtering options (e.g., price range, size, color)
- Pagination or infinite scroll
- All widgets must function
- Display product count and current filters
- Navigate to individual product pages

**Technical Specifications:**
- Data Model: `Product` class
- Service: `ProductService` or data provider
- State Management: Provider, Riverpod, Bloc, or setState
- Features: Sort, filter, paginate
- Query products by collection ID


#### 12. Functional Product Pages (6%)
**Description:** Product pages populated from data models with functioning dropdowns and counters.

**Acceptance Criteria:**
- Product data loaded from data model/service
- Size/color/variant dropdowns function properly
- Quantity counter/selector works (increment/decrement)
- Image gallery or carousel functions
- Display selected variant information
- Update price based on selected variant (if applicable)
- Add to cart button present (doesn't need to work yet)
- Navigate between products

**Technical Specifications:**
- Data Model: `Product` class with variants
- Service: `ProductService`
- State Management: Track selected variant, quantity
- UI Components: Functional dropdowns, counter widget, image carousel

---

#### 13. Shopping Cart (6%)
**Description:** Add items to cart, view cart page, and basic cart functionality.

**Acceptance Criteria:**
- Add items to cart from product pages
- Cart icon shows item count
- Cart page displays all added items
- Show product image, name, variant, quantity, price
- Display subtotal and total
- Checkout button places order (no real payment)
- Order confirmation message or page
- Cart persists during app session

**Technical Specifications:**
- Data Model: `CartItem` class
- Service: `CartService` with state management
- State Management: Global cart state (Provider, Riverpod, Bloc)
- Cart Page: Display items, totals
- Checkout: Mock order placement



#### 14. Print Shack / Text Personalization (3%)
**Description:** Text personalization page with dynamically updating form based on selected fields.

**Acceptance Criteria:**
- Dedicated personalization page with associated about/info page
- Form with multiple input fields (e.g., text, font, color, size)
- Preview updates dynamically as user types/selects options
- Different personalization options change available fields
- Visual preview of personalized item
- Add personalized item to cart

**Technical Specifications:**
- Widget: `PersonalizationPage` and `PersonalizationAboutPage`
- Route: `/personalization` or `/print-shack`
- State Management: Track form inputs and update preview
- Form Fields: Text input, dropdowns for fonts/colors/sizes
- Preview: Live rendering of personalization

---

#### 15. Full Navigation (3%)
**Description:** Complete navigation across all pages via buttons, navbar, and URLs.

**Acceptance Criteria:**
- All pages accessible via navigation
- Navbar links work on all pages
- Buttons and cards navigate to correct destinations
- Deep linking works (URL navigation)
- Back button functionality
- Breadcrumbs or navigation indicators where appropriate
- Smooth transitions between pages

**Technical Specifications:**
- Routing: Named routes or generated routes
- Navigation: Navigator.push, Navigator.pop
- Deep Linking: Route parameters for collections/products
- Navbar: Consistent across all pages

---

#### 16. Responsiveness (5%)
**Description:** Adaptive layout for both mobile and desktop views.

**Acceptance Criteria:**
- App functions properly on mobile view
- App functions properly on desktop view
- Layout adapts based on screen size
- Navigation changes between mobile/desktop
- Grid layouts adjust column counts
- Images scale appropriately
- Text remains readable at all sizes
- No horizontal scrolling on mobile
- Test on Flutter web and mobile simulators (not real devices required)

**Technical Specifications:**
- Use MediaQuery for breakpoints
- Use LayoutBuilder for adaptive widgets
- Implement responsive grid layouts
- Mobile breakpoint: < 600px
- Desktop breakpoint: >= 600px
- Test on various screen sizes in emulator

---

### ADVANCED Features (25%)

#### 17. Authentication System (8%)
**Description:** Full user authentication and account management.

**Acceptance Criteria:**
- User registration with validation
- User login with validation
- Third-party authentication (Google, Facebook, or other)
- Account dashboard page
- Display user information (name, email, profile picture)
- Edit profile functionality
- View order history (can be mock data)
- Logout functionality
- Password reset/recovery (basic implementation)
- Session persistence (user stays logged in)
- Protected routes (redirect to login if not authenticated)

**Technical Specifications:**
- Authentication: Firebase Auth, Supabase, or custom backend
- OAuth: Google Sign-In, Facebook Login packages
- Data Model: `User` class
- Service: `AuthService`
- State Management: Global auth state
- Storage: Secure storage for tokens/session
- Routes: Login, signup, account dashboard, edit profile


---

#### 18. Cart Management (6%)
**Description:** Full cart functionality including editing, removal, calculations, and persistence.

**Acceptance Criteria:**
- View all items in cart
- Edit item quantity (increase/decrease)
- Remove items from cart
- Automatic price calculations (subtotal, taxes, total)
- Update totals when quantities change
- Cart persists across app sessions (local storage)
- Cart persists for logged-in users (server/cloud storage)
- Empty cart state with call-to-action
- Cart validation (stock availability, price changes)
- Apply discount codes (optional)

**Technical Specifications:**
- Service: Enhanced `CartService`
- Storage: SharedPreferences or Hive for local persistence
- Cloud Storage: Firebase/Supabase for user carts
- Calculations: Subtotal, tax (fixed %), total
- State Management: Real-time cart updates
- UI: Editable quantities, remove buttons, totals display

---

#### 19. Search System (4%)
**Description:** Complete search functionality in navbar and footer.

**Acceptance Criteria:**
- Search bar in navbar
- Search bar or link in footer
- Search page/overlay with results
- Search products by name, description, or category
- Display search results in grid/list
- Handle empty search results gracefully
- Search suggestions or autocomplete (optional)
- Filter search results
- Navigate to product pages from results
- Recent searches (optional)

**Technical Specifications:**
- Widget: `SearchPage` or search overlay
- Route: `/search` with query parameter
- Service: `SearchService` or filter products locally
- Algorithm: Text matching, fuzzy search (optional)
- UI: Search bar, results grid, empty state
- State Management: Search query and results



