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