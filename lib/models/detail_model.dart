// //ui
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:home_services_flutter/Consumer_Screens/favourites.dart';
// import 'package:home_services_flutter/Detail_Screens/Baking_DetailScreen/Pizza_Detail.dart';
// import 'package:home_services_flutter/main.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'package:flutter/material.dart';
//
// class ThirdClass extends StatefulWidget {
//   final PizzaDetailScreen pizzaDetailScreen;
//
//   ThirdClass({required this.pizzaDetailScreen});
//
//   @override
//   _ThirdClassState createState() => _ThirdClassState();
// }
//
// class _ThirdClassState extends State<ThirdClass> {
//   late PizzaDetailScreen pizzaDetailScreen;
//
//   @override
//   void initState() {
//     super.initState();
//     pizzaDetailScreen = widget.pizzaDetailScreen;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final FavoriteListModel favoriteListModel = FavoriteListModel();
//
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/images/pastel.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 250.0,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Image.network(
//                   pizzaDetailScreen.ImageURL,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 25.0,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 11.0),
//                     child: Text(
//                       pizzaDetailScreen.productName,
//                       style: TextStyle(
//                         fontSize: 24.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 25.0),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 11.0),
//                     child: Text(
//                       ' ${pizzaDetailScreen.productDescription}',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10.0),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text(
//                       'Rs.${pizzaDetailScreen.productPrice}',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30.0),
//                   Align(
//                     alignment: Alignment.center,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // TODO: Add the selected product to the cart
//                       },
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.shopping_cart),
//                           SizedBox(width: 8.0),
//                           Text(
//                             'Add to Cart',
//                             style: TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class PizzaDetailScreen  {
//   final int id;
//   final String ImageURL;
//   final String productName;
//   final String productDescription;
//   final String productPrice;
//   final PizzaDetailScreen product;
//
//    const PizzaDetailScreen({
//     required this.id,
//     required this.ImageURL,
//     required this.productName,
//     required this.productDescription,
//     required this.productPrice,
//     required this.product,
//   });
//
//
//
//
//
//   PizzaDetailScreen getById(int id) => PizzaDetailScreen(
//     ImageURL: product.ImageURL,
//     productName: product.productName,
//     productDescription: product.productDescription,
//     productPrice: product.productPrice,
//     id: id,
//     product: product.product,
//   );
//
//
//
//
//   PizzaDetailScreen getByPosition(int position) {
//
//     return getById(position);
//   }
//
// }
//
//
//
// class FavoriteListModel  {
//   int _quantity = 1;
//   bool _isFavorite = false;
//   late SharedPreferences _prefs;
//   @override
//   // void initState() {
//   //   super.initState();
//   //   SharedPreferences.getInstance().then((prefs) {
//   //     setState(() {
//   //       _prefs = prefs;
//   //     });
//   //   });
//   // }
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController urlController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//
//
//
//     PizzaDetailScreen getById(int id) => PizzaDetailScreen(
//       ImageURL: product.ImageURL,
//       productName: product.productName,
//       productDescription: product.productDescription,
//       productPrice: product.productPrice,
//       id: id,
//       product: product.product,
//     );
//
//
//   PizzaDetailScreen getByPosition(int position) {
//
//     return getById(position);
//   }
//
//   }
//
