Prompt:

"Please create a reusable HeaderWidget (or NavBarWidget) for my Flutter union shop project, similar to how the FooterWidget is implemented. This header should be consistent across all pages and include the following features:

Requirements:

File Location: Create lib/header_widget.dart or lib/navbar_widget.dart

Layout Structure:

Purple banner at the top with "Union Shop" text (matching existing design)
Main navigation bar below with:
Shop logo on the left (clickable, navigates to home)
Navigation links in the center: Home, Collections, Sale, About
Icon buttons on the right: Search, Account, Cart, Menu
Functionality:

All navigation links should be functional and use proper routing
Logo should navigate back to homepage
Accept BuildContext to enable navigation
Icons should have placeholder callbacks where not yet implemented
Responsive Design:

Should look good on mobile and desktop
Consider using MediaQuery for different screen sizes
On mobile (<600px): Show hamburger menu icon, hide text links
On desktop (>=600px): Show full text navigation links
Styling:

Match existing color scheme (purple: Color(0xFF4d2963))
Consistent spacing and padding
Proper text styling for links
Height around 100px total (banner + nav bar)
Reusability:

Should be a StatelessWidget
Easy to import and use in any page with: const HeaderWidget()
Self-contained with all navigation logic
Implementation:

Replace the existing hardcoded header in main.dart (HomeScreen) with this widget
Update about_page.dart to use this widget instead of AppBar
Update all other pages to use this consistent header
Please create this widget and help me integrate it across all existing pages (main.dart, about_page.dart, collections_page.dart, collection_products_page.dart, product_page.dart, sale_collection_page.dart).

---

## Prompt 2: Create Dummy Collections Data

"Please create a comprehensive dummy collections data structure for my Flutter union shop e-commerce app. I need realistic collections with detailed products that I can use throughout the application.

**Reference:** Similar to https://shop.upsu.net/collections/autumn-favourites - when a user clicks on a collection (e.g., "Clothing"), they should see all products that belong to that specific collection in a grid layout with filtering and sorting options.

### User Flow:
1. User visits `/collections` page → sees grid of all 7 collections (with images, names, product count)
2. User clicks on "Clothing" collection → navigates to `/collection-products?collection=clothing`
3. User sees all products that belong to the Clothing collection → can filter/sort them
4. User clicks a product → navigates to `/product/:id` for detailed view

### Requirements:

**File Structure:**
- Create `lib/models/collection_model.dart` - Define Collection class
- Create `lib/models/product_model.dart` - Define Product class  
- Create `lib/data/collections_data.dart` - Dummy collections data with all products

**Collection Model:**
```dart
class Collection {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int productCount;
  final List<String> tags; // e.g., ['clothing', 'winter', 'essential']
}
```

**Product Model:**
```dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String collectionId; // IMPORTANT: Links product to its collection
  final List<String> sizes; // e.g., ['S', 'M', 'L', 'XL']
  final List<String> colors; // e.g., ['Black', 'White', 'Purple']
  final bool isOnSale;
  final double? salePrice;
  final int discountPercentage;
  final String category; // 'Clothing', 'Accessories', 'Stationery', 'Electronics'
  final bool inStock;
  final int stockQuantity;
}
```

**Collections to Create (7 total):**

1. **Clothing Collection** (id: 'clothing')
   - 8-10 products: T-shirts, Hoodies, Jackets, Pants, Sweatshirts
   - Mix of casual and formal union-branded apparel
   - Price range: £11-£60
   - Some items on sale
   - Example products: "Classic Hoodie" (£25), "Union T-Shirt" (£11), "Sweatshirt" (£23)

2. **Accessories Collection** (id: 'accessories')
   - 6-8 products: Hats, Scarves, Belts, Watches, Sunglasses, Lanyards
   - Union-branded accessories
   - Price range: £2.75-£40
   - Include variety of styles
   - Example: "Classic Beanie Hat" (£12), "Lanyard" (£2.75)

3. **Stationery Collection** (id: 'stationery')
   - 8-10 products: Notebooks, Pens, Pencil Cases, Folders, Planners, A5 Notepads
   - Student-focused items
   - Price range: £1-£25
   - Some bundled items
   - Example: "A5 Notepad" (£3), "Pen" (£1)

4. **Electronics Collection** (id: 'electronics')
   - 5-7 products: Headphones, USB Drives, Power Banks, Phone Cases, Laptop Sleeves
   - Tech accessories for students
   - Price range: £10-£80
   - Include some premium items

5. **Backpacks Collection** (id: 'backpacks')
   - 4-6 products: Laptop Bags, Backpacks, Messenger Bags, Duffel Bags
   - Various sizes and styles
   - Price range: £20-£70
   - Emphasize durability and capacity

6. **Best Sellers Collection** (id: 'bestsellers')
   - 6-8 products: Mix of top items from other collections
   - Most popular products (products can belong to multiple collections)
   - Variety of categories
   - Price range: £5-£50
   - Include: Classic Hoodie, Keep Cup, Pen, etc.

7. **New Arrivals Collection** (id: 'newarrivals')
   - 5-7 products: Recently added items
   - Fresh designs and trending items
   - Mixed categories
   - Price range: £10-£55

**Additional Requirements:**

- **IMPORTANT:** Each product MUST have a `collectionId` that matches one of the 7 collection IDs above
- Some products can appear in multiple collections (e.g., "Classic Hoodie" in both "Clothing" and "Best Sellers")
- Use real product names and descriptions (creative but realistic)
- Use existing asset images where available: `assets/images/ClassicHoodie.webp`, `assets/images/unitshirt.webp`, `assets/images/Hat.webp`, `assets/images/backpack.webp`, `assets/images/laptopbag.webp`, `assets/images/notebook.webp`, `assets/images/pencilcase.webp`, `assets/images/bottle.webp`
- For missing images, use placeholder paths like `assets/images/[product-name].webp`
- Include detailed descriptions (2-3 sentences per product)
- Make prices realistic for UK university shop
- Include 20-30% of products with sale pricing
- Mark some items as "Sold out" (inStock: false)
- Ensure each collection's `productCount` matches the actual number of products with that `collectionId`

**Data Structure Example:**
```dart
// In collections_data.dart
final List<Product> allProducts = [
  Product(
    id: 'p1',
    name: 'Classic Hoodie',
    collectionId: 'clothing', // Links to Clothing collection
    price: 25.00,
    isOnSale: false,
    // ... other fields
  ),
  Product(
    id: 'p2',
    name: 'Beanie Hat',
    collectionId: 'accessories', // Links to Accessories collection
    price: 12.00,
    // ...
  ),
  // ... 50-60 more products
];

final List<Collection> collections = [
  Collection(
    id: 'clothing',
    name: 'Clothing',
    description: 'Shop all your union apparel essentials',
    productCount: 10, // Count of products where collectionId == 'clothing'
    // ...
  ),
  // ... other collections
];
```

**Integration:**

After creating the data structure:
1. Update `collections_page.dart` to display all 7 collections using the new `collections` list
2. **Update `collection_products_page.dart`** to:
   - Accept collection ID as parameter (from route)
   - Filter `allProducts` where `product.collectionId == collectionId`
   - Display collection name and description at top
   - Show product count (e.g., "10 products")
   - Display filtered products in grid
   - Add "Filter by" and "Sort by" dropdowns
3. Update `product_page.dart` to accept and display full Product model with all details
4. Update `sale_collection_page.dart` to filter products where `isOnSale == true`
5. Update `main.dart` to showcase featured products from Best Sellers collection

**Key Point:** The collection_products_page.dart should work like https://shop.upsu.net/collections/autumn-favourites - showing ONLY the products that belong to the selected collection.

Please create these models and data, then help me integrate them across all relevant pages to replace the current hardcoded placeholder data."

---

## Prompt 3: Fix Product Page Navigation After Collections Implementation

"The product page is not working after implementing the collections feature. There's a type mismatch in how route arguments are being passed between pages.

**Current Problem:**
The product page (`lib/product_page.dart`) is failing to load when navigating from any page (homepage, collections, sale page). The issue is on **line 21** where the route arguments are being received incorrectly.

**Root Cause:**
- All navigation calls pass arguments as a **Map**: `{'productId': product.id}`
- Product page tries to receive arguments as a **String** directly
- This causes a type casting error

**The Fix Needed:**

In `lib/product_page.dart` at line 21, change from:
```dart
// CURRENT (BROKEN):
final String productId = ModalRoute.of(context)?.settings.arguments as String? ?? 'p1';
```

To:
```dart
// FIXED:
final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
final String productId = args?['productId'] as String? ?? 'p1';
```

**Why This Fix:**
- Properly extracts the `productId` from the Map being passed
- Maintains null safety with fallback to 'p1'
- Works with all three navigation sources (main.dart, collection_products_page.dart, sale_collection_page.dart)
- More scalable - allows passing additional parameters in future (e.g., `fromCart`, `referrer`)

**Files Already Correct (No Changes Needed):**
- ✅ `lib/main.dart` (line 247) - Passes `{'productId': product.id}`
- ✅ `lib/collection_products_page.dart` (line 61) - Passes `{'productId': product.id}`
- ✅ `lib/sale_collection_page.dart` (line 21) - Passes `{'productId': product.id}`

**Expected Result:**
After this fix, all navigation flows will work:
- Homepage featured products → Product detail page ✅
- Collections → Collection products → Product detail page ✅
- Sale page → Product detail page ✅

Please apply this 2-line change to fix the product page navigation issue."

---

## Prompt 4: Create Authentication UI (Login & Signup Forms)

"Please implement the Authentication UI for my Flutter union shop project. This is a BASIC feature (3%) that requires login and signup forms with **non-functioning** buttons (no backend integration needed at this stage).

**Current Status:**
- `lib/auth_page.dart` already exists but needs forms implementation
- Route `/auth` may need to be added to main.dart

### Requirements:

**Acceptance Criteria:**
- ✅ Login form with email and password fields
- ✅ Signup/register form with name, email, password, and confirm password fields
- ✅ Form validation UI (visual only - doesn't need to actually validate)
- ✅ Submit buttons (non-functioning - just show a SnackBar message)
- ✅ Toggle/link between login and signup forms
- ✅ "Forgot Password?" link (dummy - can show SnackBar)
- ✅ Social login buttons for Google and Facebook (non-functioning - visual only)
- ✅ Consistent styling with app theme (purple: Color(0xFF4d2963))

### Implementation Specifications:

**File:** `lib/auth_page.dart`

**Layout Structure:**
1. **Top Section:**
   - App logo or branding
   - "Welcome to Union Shop" title
   - Subtitle based on mode (Login/Signup)

2. **Form Section (Toggle between Login/Signup):**
   
   **Login Form:**
   - Email TextField with email icon
   - Password TextField with lock icon and visibility toggle
   - "Remember Me" checkbox (optional)
   - "Forgot Password?" link
   - "Login" button
   - Divider with "OR"
   - Social login buttons (Google, Facebook icons)
   - "Don't have an account? Sign Up" link

   **Signup Form:**
   - Full Name TextField with person icon
   - Email TextField with email icon
   - Password TextField with lock icon and visibility toggle
   - Confirm Password TextField with lock icon
   - Terms & Conditions checkbox (optional)
   - "Sign Up" button
   - Divider with "OR"
   - Social login buttons (Google, Facebook icons)
   - "Already have an account? Login" link

**State Management:**
- Use StatefulWidget
- Boolean to toggle between login/signup mode
- TextEditingControllers for all form fields
- Boolean for password visibility toggles

**Button Behaviors (Non-Functioning):**
- Login button → Show SnackBar: "Login functionality coming soon!"
- Sign Up button → Show SnackBar: "Signup functionality coming soon!"
- Forgot Password link → Show SnackBar: "Password reset coming soon!"
- Social buttons → Show SnackBar: "Social login coming soon!"
- Toggle link → Switch between login/signup forms

**Styling Guidelines:**
- Use consistent padding (16-24px)
- Purple primary color for buttons: Color(0xFF4d2963)
- White background with subtle shadows for form container
- Rounded corners for text fields and buttons (8px)
- Icons in text fields (email, lock, person)
- Proper spacing between form elements
- Mobile-first responsive design

**Form Validation (Visual Only):**
- Add decorations with hints
- Error text properties (can remain null for now)
- Input borders that show purple when focused
- Optional: Add visual indicators without actual validation

**Navigation:**
- Add route in main.dart: `'/auth': (context) => const AuthPage()`
- Make account icon in navbar navigate to auth page
- After "login/signup" (non-functional), can show SnackBar

### Example Structure:

```dart
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoginMode = true; // Toggle between login/signup
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _toggleMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
    });
  }

  void _handleSubmit() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isLoginMode 
          ? 'Login functionality coming soon!' 
          : 'Signup functionality coming soon!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Logo & Title
              // Form fields based on _isLoginMode
              // Toggle link
              // Social buttons
            ],
          ),
        ),
      ),
    );
  }
}
```

### Tasks to Complete:

1. ✅ Update `lib/auth_page.dart` with StatefulWidget structure
2. ✅ Add mode toggle boolean (_isLoginMode)
3. ✅ Create TextEditingControllers for all fields
4. ✅ Build login form UI (email, password fields)
5. ✅ Build signup form UI (name, email, password, confirm password)
6. ✅ Add password visibility toggles
7. ✅ Add "Forgot Password?" link with SnackBar
8. ✅ Add toggle link between login/signup
9. ✅ Add Login/Signup buttons with SnackBar messages
10. ✅ Add social login buttons (Google, Facebook - visual only)
11. ✅ Style forms with consistent branding
12. ✅ Add route to main.dart for `/auth`
13. ✅ Link account icon in navbar to auth page
14. ✅ Test form layout on mobile view
15. ✅ Test toggling between login and signup modes

### Assets Needed:
- No images required (use Icons.email, Icons.lock, Icons.person)
- Optional: Google/Facebook logo icons (can use text or Icon widgets)

### Expected Result:
A polished authentication page with login and signup forms that toggle smoothly, styled consistently with the app theme. All buttons show appropriate SnackBar messages indicating the feature is coming soon. No actual authentication logic needed at this stage.

Please implement this authentication UI following the specifications above."