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

**Subtasks:**
- [x] 1. Create `home_page.dart` file in `lib/` directory (exists in main.dart)
- [x] 2. Design app logo/branding header widget
- [x] 3. Create featured section widget (e.g., banners carousel)
- [x] 4. Build collection preview cards widget
- [x] 5. Add "New Arrivals" section with hardcoded products
- [x] 6. Add "Bestsellers" section with hardcoded products
- [x] 7. Add "Sale" section preview
- [x] 8. Gather/generate 6-10 product images for homepage
- [x] 9. Implement basic mobile-first layout with Column/ListView
- [x] 10. Add navigation hooks to collections and product pages

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

**Subtasks:**
- [x] 1. Verify `about_page.dart` already exists (or create if needed)
- [x] 2. Write company description and mission statement
- [x] 3. Add shop story/background section
- [ ] 4. Create team members section (3-5 dummy profiles)
- [x] 5. Add contact information section (email, phone, address)
- [ ] 6. Include location/map placeholder
- [ ] 7. Add shop values or principles section
- [ ] 8. Gather/generate images for about page (team, shop, etc.)
- [x] 9. Implement scrollable layout with sections
- [x] 10. Link about page from footer and/or navbar
- [ ] 11. Test readability and layout on mobile

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

**Subtasks:**
- [x] 1. Verify `footer_widget.dart` already exists (or create if needed)
- [x] 2. Create "Quick Links" section (Home, Collections, Sale, About)
- [x] 3. Create "Customer Service" section (Contact, FAQ, Shipping, Returns)
- [x] 4. Create "Contact Us" section (email, phone, address)
- [x] 5. Create "Social Media" section with dummy icons/links
- [x] 6. Add copyright text and year
- [ ] 7. Implement multi-column layout for desktop
- [ ] 8. Make footer responsive (stack columns on mobile)
- [x] 9. Add footer to at least homepage and about page
- [x] 10. Style footer with consistent branding colors
- [ ] 11. Test footer layout on mobile and desktop views

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

**Subtasks:**
- [x] 1. Verify `collections_page.dart` already exists (or create if needed)
- [x] 2. Define at least 6 collections (Clothing, Stationery, Electronics, Accessories, Sale, etc.)
- [x] 3. Gather/generate images for each collection
- [x] 4. Create collection card widget with image and title
- [x] 5. Implement grid layout (2 columns mobile, 3-4 desktop)
- [x] 6. Add hardcoded list of collections with data
- [x] 7. Make collection cards tappable (navigate to collection page)
- [x] 8. Add page title/header
- [x] 9. Implement basic styling and spacing
- [x] 10. Add route to navigation/routing config
- [ ] 11. Test grid layout on various screen sizes

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

**Subtasks:**
- [x] 1. Verify `collection_products_page.dart` already exists (or create if needed)
- [x] 2. Create product card widget (image, name, price)
- [x] 3. Add hardcoded list of 10-15 products for testing
- [x] 4. Implement product grid layout (2 columns mobile, 3-4 desktop)
- [x] 5. Create static "Sort by" dropdown (Price, Name, Newest)
- [x] 6. Create static filter chips (Size, Color, Price Range)
- [x] 7. Add collection title/header at top
- [x] 8. Add product count display
- [x] 9. Make product cards tappable (navigate to product page)
- [x] 10. Accept collection ID/name as route parameter
- [ ] 11. Test layout and navigation

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

**Subtasks:**
- [x] 1. Verify `product_page.dart` already exists (or create if needed)
- [x] 2. Create image gallery/carousel widget (3-5 images per product)
- [x] 3. Add product title and price display
- [x] 4. Create product description section
- [x] 5. Add static size dropdown (S, M, L, XL)
- [x] 6. Add static color dropdown or color selector chips
- [x] 7. Create quantity selector UI (- button, number, + button - static)
- [x] 8. Add "Add to Cart" button (non-functioning for now)
- [x] 9. Create product specifications section (Material, Care, etc.)
- [ ] 10. Add "Related Products" section (optional)
- [x] 11. Accept product ID as route parameter
- [ ] 12. Test layout and scrolling

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

**Subtasks:**
- [x] 1. Verify `sale_collection_page.dart` already exists (or create if needed)
- [x] 2. Create promotional banner widget ("Sale! Up to 50% Off")
- [x] 3. Create sale product card with discount badge
- [x] 4. Add hardcoded list of 8-12 sale products
- [x] 5. Display original price with strikethrough styling
- [x] 6. Display sale price prominently
- [x] 7. Calculate and show discount percentage on badges
- [x] 8. Implement product grid layout
- [ ] 9. Add sale timer/countdown widget (optional, can be static)
- [x] 10. Make product cards tappable (navigate to product page)
- [ ] 11. Test visual indicators for discounts

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

**Subtasks:**
- [x] 1. Verify `auth_page.dart` already exists (or create if needed)
- [ ] 2. Create login form with email and password TextFields
- [ ] 3. Create signup form with name, email, password, confirm password fields
- [ ] 4. Add "Login" and "Sign Up" buttons (non-functioning)
- [ ] 5. Add "Forgot Password?" link (dummy)
- [ ] 6. Add toggle/link between login and signup forms
- [ ] 7. Add social login buttons (Google, Facebook - non-functioning)
- [ ] 8. Style form fields and buttons consistently
- [ ] 9. Add "Remember Me" checkbox on login (optional)
- [ ] 10. Add Terms & Conditions checkbox on signup (optional)
- [ ] 11. Test form layout on mobile and desktop

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

**Subtasks:**
- [x] 1. Create custom navbar widget or customize AppBar
- [x] 2. Add shop logo/branding on the left
- [x] 3. Add navigation links (Home, Collections, Sale, About) - center/left
- [x] 4. Add search icon button - right side
- [x] 5. Add cart icon with badge counter - right side
- [x] 6. Add account/profile icon - right side
- [ ] 7. Implement hamburger menu icon for mobile (<600px)
- [ ] 8. Create Drawer widget with navigation links for mobile
- [ ] 9. Use MediaQuery to switch between mobile/desktop layouts
- [x] 10. Make navbar persistent across all pages
- [ ] 11. Test responsive behavior at different breakpoints
- [ ] 12. Ensure navbar is fixed at top (optional)

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

**Subtasks:**
- [x] 1. Create `lib/models/collection.dart` with Collection class
- [x] 2. Create `lib/services/collection_service.dart` (using collections_data.dart)
- [x] 3. Implement getCollections() method in service
- [ ] 4. Set up state management (Provider/Riverpod/Bloc)
- [x] 5. Update collections_page.dart to use service instead of hardcoded data
- [x] 6. Implement sorting dropdown (A-Z, Z-A, Newest, Most Popular)
- [ ] 7. Wire up sorting functionality to re-order collections
- [ ] 8. Implement filter chips or options (All, Featured, New)
- [ ] 9. Wire up filtering to show/hide collections
- [ ] 10. Implement pagination (load 6 at a time) OR infinite scroll
- [ ] 11. Add loading indicator while fetching data
- [ ] 12. Add error handling for data loading failures
- [ ] 13. Test all sorting and filtering combinations

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

**Subtasks:**
- [x] 1. Create `lib/models/product.dart` with Product class
- [x] 2. Create `lib/services/product_service.dart` (using collections_data.dart)
- [x] 3. Implement getProductsByCollection(collectionId) method
- [x] 4. Update collection_products_page.dart to use service
- [x] 5. Implement sorting dropdown (Price: Low-High, High-Low, Newest, Popular)
- [x] 6. Wire up sorting to re-order product list
- [x] 7. Implement filter panel/sheet (Price Range, Size, Color)
- [x] 8. Create price range slider widget
- [x] 9. Create size filter checkboxes (S, M, L, XL)
- [x] 10. Create color filter chips/swatches
- [x] 11. Wire up all filters to filter product list
- [x] 12. Display active filter count and applied filters
- [ ] 13. Add "Clear All Filters" button
- [ ] 14. Implement pagination (12 products per page) OR infinite scroll
- [x] 15. Display product count ("Showing X of Y products")
- [ ] 16. Add loading states and error handling
- [x] 17. Test all combinations of sort and filter

---#### 12. Functional Product Pages (6%)
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

**Subtasks:**
- [x] 1. Update product_page.dart to use ProductService
- [x] 2. Implement getProductById(id) method in ProductService
- [x] 3. Create functional image carousel (swipe/tap to change images)
- [ ] 4. Add image indicator dots for carousel
- [x] 5. Implement size dropdown with state management
- [x] 6. Implement color selector with state management
- [x] 7. Create quantity counter widget (-, count, +)
- [x] 8. Wire up increment button (+ quantity)
- [x] 9. Wire up decrement button (- quantity, min 1)
- [x] 10. Display selected variant information (e.g., "Size: M, Color: Blue")
- [ ] 11. Update price if different variants have different prices (optional)
- [x] 12. Ensure "Add to Cart" button is present (non-functional for now)
- [ ] 13. Add loading state while fetching product
- [ ] 14. Add error handling for product not found
- [x] 15. Test all interactive elements function correctly

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

**Subtasks:**
- [ ] 1. Create `lib/models/cart_item.dart` with CartItem class
- [ ] 2. Create `lib/services/cart_service.dart`
- [ ] 3. Set up global cart state (Provider/Riverpod/Bloc)
- [ ] 4. Implement addToCart(product, quantity, variant) method
- [ ] 5. Implement getCartItems() method
- [ ] 6. Implement getCartItemCount() method
- [ ] 7. Update navbar cart icon to show item count badge
- [ ] 8. Wire up "Add to Cart" button on product page
- [ ] 9. Show confirmation message/snackbar when item added
- [ ] 10. Create cart_page.dart with cart UI
- [ ] 11. Display all cart items with image, name, variant, quantity, price
- [ ] 12. Calculate and display subtotal
- [ ] 13. Calculate and display total (can add tax if desired)
- [ ] 14. Add "Checkout" button
- [ ] 15. Create mock checkout function (show success message)
- [ ] 16. Create order confirmation page or dialog
- [ ] 17. Maintain cart state during app session (in-memory)
- [ ] 18. Test adding multiple products to cart

---#### 14. Print Shack / Text Personalization (3%)
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

**Subtasks:**
- [ ] 1. Create `personalization_page.dart` and `personalization_about_page.dart`
- [ ] 2. Create personalization about page with service description
- [ ] 3. Design form with product type selector (e.g., T-Shirt, Mug, Poster)
- [ ] 4. Add text input field for custom text
- [ ] 5. Add font dropdown (3-5 font options)
- [ ] 6. Add color picker or color dropdown
- [ ] 7. Add size dropdown (Small, Medium, Large text size)
- [ ] 8. Create preview widget showing personalized item
- [ ] 9. Implement real-time preview updates as user types/selects
- [ ] 10. Change available fields based on product type selected
- [ ] 11. Add "Add to Cart" button for personalized item
- [ ] 12. Wire up adding personalized item to cart service
- [ ] 13. Link personalization page from navbar or collections
- [ ] 14. Test dynamic preview updates with all combinations

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

**Subtasks:**
- [ ] 1. Set up named routes in main.dart or router configuration
- [ ] 2. Define routes for all pages (/, /collections, /product/:id, etc.)
- [ ] 3. Wire up navbar links to navigate to correct pages
- [ ] 4. Wire up collection cards to navigate to collection page
- [ ] 5. Wire up product cards to navigate to product page
- [ ] 6. Implement deep linking with route parameters (collectionId, productId)
- [ ] 7. Test URL navigation (typing URLs directly)
- [ ] 8. Ensure back button works correctly on all pages
- [ ] 9. Add breadcrumbs on collection/product pages (optional)
- [ ] 10. Test navigation flow: Home → Collections → Collection → Product → Cart
- [ ] 11. Ensure navbar is consistent and functional on all pages
- [ ] 12. Add page transitions/animations (optional)
- [ ] 13. Test all navigation paths work correctly

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

**Subtasks:**
- [ ] 1. Define breakpoint constants (mobile: <600px, desktop: >=600px)
- [ ] 2. Update navbar to use MediaQuery for mobile/desktop switch
- [ ] 3. Update homepage layout for responsive grid (1-2-3 columns)
- [ ] 4. Update collections page grid (2 cols mobile, 3-4 cols desktop)
- [ ] 5. Update collection products page grid (2 cols mobile, 3-4 cols desktop)
- [ ] 6. Update product page layout for desktop (side-by-side vs stacked)
- [ ] 7. Make footer responsive (stacked on mobile, columns on desktop)
- [ ] 8. Ensure all images scale properly with constraints
- [ ] 9. Test text readability at all breakpoints
- [ ] 10. Ensure no horizontal scrolling on mobile
- [ ] 11. Test on Chrome mobile emulator (iPhone, Android)
- [ ] 12. Test on Chrome desktop at various widths (600px, 900px, 1200px)
- [ ] 13. Test on Flutter web and mobile simulators
- [ ] 14. Fix any layout issues found during testing

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

**Subtasks:**
- [ ] 1. Choose auth provider (Firebase Auth recommended)
- [ ] 2. Set up Firebase project and add to Flutter app
- [ ] 3. Install Firebase packages (firebase_core, firebase_auth)
- [ ] 4. Create `lib/models/user.dart` with User class
- [ ] 5. Create `lib/services/auth_service.dart`
- [ ] 6. Implement signup method with email/password validation
- [ ] 7. Implement login method with email/password validation
- [ ] 8. Implement Google Sign-In OAuth
- [ ] 9. Implement logout method
- [ ] 10. Set up global auth state (Provider/Riverpod)
- [ ] 11. Update auth_page.dart to use AuthService
- [ ] 12. Wire up signup form with validation
- [ ] 13. Wire up login form with validation
- [ ] 14. Show error messages for invalid credentials
- [ ] 15. Create account_page.dart for user dashboard
- [ ] 16. Display user info (name, email, photo) on account page
- [ ] 17. Create edit_profile_page.dart
- [ ] 18. Implement update profile functionality
- [ ] 19. Create order history section (mock data)
- [ ] 20. Implement password reset/recovery (email link)
- [ ] 21. Set up session persistence (Firebase handles automatically)
- [ ] 22. Implement route guards for protected pages
- [ ] 23. Redirect to login if user not authenticated
- [ ] 24. Test complete auth flow: signup → login → dashboard → logout
- [ ] 25. Test OAuth flow with Google Sign-In

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

**Subtasks:**
- [ ] 1. Install SharedPreferences or Hive for local storage
- [ ] 2. Enhance CartService with persistence methods
- [ ] 3. Implement saveCart() method (save to local storage)
- [ ] 4. Implement loadCart() method (load from local storage)
- [ ] 5. Load cart on app startup
- [ ] 6. Add quantity editor on cart page (increment/decrement buttons)
- [ ] 7. Implement updateQuantity(itemId, newQuantity) method
- [ ] 8. Wire up quantity buttons to update cart
- [ ] 9. Add remove button for each cart item
- [ ] 10. Implement removeItem(itemId) method
- [ ] 11. Wire up remove button to delete item from cart
- [ ] 12. Implement automatic price calculations
- [ ] 13. Calculate subtotal (sum of all item prices × quantities)
- [ ] 14. Calculate tax (e.g., 10% of subtotal)
- [ ] 15. Calculate total (subtotal + tax)
- [ ] 16. Update totals in real-time when cart changes
- [ ] 17. Create empty cart state UI with "Continue Shopping" button
- [ ] 18. Save cart to cloud for logged-in users (Firebase/Supabase)
- [ ] 19. Sync cart between devices for logged-in users
- [ ] 20. Add cart validation (check stock, price changes) - optional
- [ ] 21. Implement discount code input and validation - optional
- [ ] 22. Test cart persistence across app restarts
- [ ] 23. Test cart syncing for logged-in users

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

**Subtasks:**
- [ ] 1. Add search icon/button to navbar
- [ ] 2. Add search link to footer
- [ ] 3. Create `search_page.dart` or search overlay widget
- [ ] 4. Create search bar widget with TextField
- [ ] 5. Implement search in ProductService or create SearchService
- [ ] 6. Implement searchProducts(query) method
- [ ] 7. Search by product name (case-insensitive)
- [ ] 8. Search by product description
- [ ] 9. Search by collection/category
- [ ] 10. Wire up search bar to trigger search on submit
- [ ] 11. Display search results in grid layout
- [ ] 12. Show result count ("Found X products")
- [ ] 13. Create empty state UI ("No results found for 'query'")
- [ ] 14. Add suggestions or call-to-action on empty results
- [ ] 15. Navigate to search page with query parameter
- [ ] 16. Make result product cards tappable (navigate to product)
- [ ] 17. Add search suggestions/autocomplete (optional)
- [ ] 18. Implement recent searches feature (optional)
- [ ] 19. Add filter/sort options on search results page
- [ ] 20. Test search with various queries
- [ ] 21. Test empty search results handling

---

