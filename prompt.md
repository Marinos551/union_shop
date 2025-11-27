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

### Requirements:

**File Structure:**
- Create `lib/models/collection_model.dart` - Define Collection class
- Create `lib/models/product_model.dart` - Define Product class  
- Create `lib/data/collections_data.dart` - Dummy collections data

**Collection Model:**
```dart
class Collection {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int productCount;
  final List<String> productIds; // References to products
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
  final String collectionId;
  final List<String> sizes; // e.g., ['S', 'M', 'L', 'XL']
  final List<String> colors; // e.g., ['Black', 'White', 'Purple']
  final bool isOnSale;
  final double? salePrice;
  final int discountPercentage;
  final String category; // 'Clothing', 'Accessories', 'Stationery', 'Electronics'
}
```

**Collections to Create (7 total):**

1. **Clothing Collection**
   - 8-10 products: T-shirts, Hoodies, Jackets, Pants
   - Mix of casual and formal union-branded apparel
   - Price range: £15-£60
   - Some items on sale

2. **Accessories Collection**
   - 6-8 products: Hats, Scarves, Belts, Watches, Sunglasses
   - Union-branded accessories
   - Price range: £8-£40
   - Include variety of styles

3. **Stationery Collection**
   - 8-10 products: Notebooks, Pens, Pencil Cases, Folders, Planners
   - Student-focused items
   - Price range: £2-£25
   - Some bundled items

4. **Electronics Collection**
   - 5-7 products: Headphones, USB Drives, Power Banks, Phone Cases, Laptop Sleeves
   - Tech accessories for students
   - Price range: £10-£80
   - Include some premium items

5. **Backpacks Collection**
   - 4-6 products: Laptop Bags, Backpacks, Messenger Bags, Duffel Bags
   - Various sizes and styles
   - Price range: £20-£70
   - Emphasize durability and capacity

6. **Best Sellers Collection**
   - 6-8 products: Mix of top items from other collections
   - Most popular products
   - Variety of categories
   - Price range: £5-£50

7. **New Arrivals Collection**
   - 5-7 products: Recently added items
   - Fresh designs and trending items
   - Mixed categories
   - Price range: £10-£55

**Additional Requirements:**

- Use real product names and descriptions (creative but realistic)
- Use existing asset images where available: `assets/images/ClassicHoodie.webp`, `assets/images/unitshirt.webp`, `assets/images/Hat.webp`, `assets/images/backpack.webp`, `assets/images/laptopbag.webp`, `assets/images/notebook.webp`, `assets/images/pencilcase.webp`, `assets/images/bottle.webp`
- For missing images, use placeholder paths like `assets/images/[product-name].webp`
- Include detailed descriptions (2-3 sentences per product)
- Make prices realistic for UK university shop
- Include 20-30% of products with sale pricing
- Ensure each collection has appropriate productCount

**Integration:**

After creating the data structure:
1. Update `collections_page.dart` to use the new collections data
2. Update `collection_products_page.dart` to filter products by collectionId
3. Update `product_page.dart` to accept and display full Product model
4. Update `sale_collection_page.dart` to filter products where `isOnSale == true`
5. Update `main.dart` to showcase featured products from collections

Please create these models and data, then help me integrate them across all relevant pages to replace the current hardcoded placeholder data."