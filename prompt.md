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