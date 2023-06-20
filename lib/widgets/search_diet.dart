// import 'package:flutter/material.dart';
//
// class DietScreen extends StatefulWidget {
//   const DietScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DietScreen> createState() => _DietScreenState();
// }
//
// class _DietScreenState extends State<DietScreen> {
//   int selectedIndex = 0;
//   List<String> filteredItems = [];
//
//   void onTabSelected(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }
//
//   void filterSearchResults(String query) {
//     setState(() {
//       filteredItems = query.isEmpty
//           ? []
//           : items
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     filteredItems = items;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Rest of your code...
//
//     // Replace the DietBox widgets with filteredItems in the respective tab sections
//
//     if (selectedIndex == 0) {
//     // Content for Tab 1
//     Container(
//     width: MediaQuery.of(context).size.width,
//     child: Column(
//     children: filteredItems.map((item) {
//     return DietBox(
//     image: getImageForTitle(item),
//     title: item,
//     description: getDescriptionForTitle(item),
//     );
//     }).toList(),
//     ),
//     ),
//     } else if (selectedIndex == 1) {
//     // Content for Tab 2
//     Container(
//     width: MediaQuery.of(context).size.width,
//     child: Column(
//     children: filteredItems.map((item) {
//     return DietBox(
//     image: getImageForTitle(item),
//     title: item,
//     description: getDescriptionForTitle(item),
//     );
//     }).toList(),
//     ),
//     ),
//     } else if (selectedIndex == 2) ...{
//     // Content for Tab 3
//     Container(
//     width: MediaQuery.of(context).size.width,
//     child: Column(
//     children: filteredItems.map((item) {
//     return DietBox(
//     image: getImageForTitle(item),
//     title: item,
//     description: getDescriptionForTitle(item),
//     );
//     }).toList(),
//     ),
//     ),
//     }
//
//     // Rest of your code...
//   }
// }
//
// // Helper method to get the image for a specific title
// String getImageForTitle(String title) {
//   // Add your logic to map titles to images
//   if (title == 'Fruit Salad') {
//     return 'assets/images/fss.jpeg';
//   } else if (title == 'Vegan Salad') {
//     return 'assets/images/vs.jpg';
//   } else if (title == 'Granola') {
//     return 'assets/images/g.jpg';
//   } else if (title == 'Chicken Breast') {
//     return 'assets/images/cb.jpeg';
//   } else if (title == 'Fruit Smoothies') {
//     return 'assets/images/1.jpg';
//   } else if (title == 'Carrot Porridge') {
//     return 'assets/images/c.jpg';
//   }
//   // Add more mappings as needed
//   return '';
// }
//
// // Helper method to get the description for a specific title
// String getDescriptionForTitle(String title) {
//   // Add your logic to map titles to descriptions
//   if (title == 'Fruit Salad') {
//     return '100Cal';
//   } else if (title == 'Vegan Salad') {
//     return '140Cal';
//   } else if (title == 'Granola') {
//     return '120Cal';
//   } else if (title == 'Chicken Breast') {
//     return '140Cal';
//   } else if (title == 'Fruit Smoothies') {
//     return '200Cal';
//   } else if (title == 'Carrot Porridge') {
//     return '137Cal';
//   }
//   // Add more mappings as needed
//   return '';
// }