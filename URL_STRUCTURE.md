# URL Structure Change - Product Slugs

## Summary
Changed product URLs from using IDs to using product names (slugs).

## Examples

### Before (IDs):
- `/product/p1` → Classic Hoodie
- `/product/p2` → Union T-Shirt  
- `/product/p6` → Classic Beanie Hat

### After (Slugs):
- `/product/classic-hoodie` → Classic Hoodie
- `/product/union-t-shirt` → Union T-Shirt
- `/product/classic-beanie-hat` → Classic Beanie Hat

## How it works:

1. **Slug Generation**: Product names are converted to URL-friendly slugs
   - Lowercase
   - Spaces become hyphens
   - Special characters removed
   - Example: "Classic Hoodie" → "classic-hoodie"

2. **Product Lookup**: When you visit a URL, the app finds the product by slug
   - `/product/classic-hoodie` → Looks for product with `slug == "classic-hoodie"`
   - Finds and displays "Classic Hoodie"

3. **All Navigation Updated**:
   - Home page product cards
   - Collection pages
   - Sale page
   - Search results
   - All use `product.slug` instead of `product.id`

## URL Examples for All Products:

| Product Name | URL |
|--------------|-----|
| Classic Hoodie | /product/classic-hoodie |
| Union T-Shirt | /product/union-t-shirt |
| Classic Sweatshirt | /product/classic-sweatshirt |
| Varsity Jacket | /product/varsity-jacket |
| Zip-Up Hoodie | /product/zip-up-hoodie |
| Classic Beanie Hat | /product/classic-beanie-hat |
| Baseball Cap | /product/baseball-cap |
| Bucket Hat | /product/bucket-hat |
| Snapback Cap | /product/snapback-cap |
| Visor | /product/visor |
| Laptop Backpack | /product/laptop-backpack |
| Drawstring Bag | /product/drawstring-bag |
| Tote Bag | /product/tote-bag |
| Messenger Bag | /product/messenger-bag |
| Duffel Bag | /product/duffel-bag |
| Spiral Notebook | /product/spiral-notebook |
| Pencil Case | /product/pencil-case |
| Water Bottle | /product/water-bottle |
| Sticky Notes Set | /product/sticky-notes-set |
| Pen Set | /product/pen-set |
| Track Jacket | /product/track-jacket |
| Polo Shirt | /product/polo-shirt |
| Joggers | /product/joggers |
| Tank Top | /product/tank-top |
