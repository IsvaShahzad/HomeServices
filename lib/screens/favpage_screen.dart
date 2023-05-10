// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:home_services_flutter/Detail_Screens/Baking_DetailScreen/Pizza_Detail.dart';
// import 'package:home_services_flutter/initialScreens/verify_email.dart';
// import 'package:provider/provider.dart';
//
// import '../Consumer_Screens/favourites.dart';
// import '../initialScreens/loginScreen.dart';
// import '../main.dart';
// import '../models/favpage_model.dart';
//
// class FavoritePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // This gets the current state of FavoritePageModel and also tells Flutter
//     // to rebuild this widget when FavoritePageModel notifies listeners (in other words,
//     // when it changes).
//     return Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           elevation: 13,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(12),
//               bottomLeft: Radius.circular(12),
//             ),
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.logout,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => LoginScreen(),
//                   ),
//                 );
//               },
//             ),
//           ],
//           title: Align(
//             alignment: Alignment.center,
//             child: Text(
//               "Favourites  ❤ ",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ));
//   }
// }
//
//
//
//
//
// class _FavoriteProductsPageState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     var favoritepage = context.watch<FavouriteProductPage>();
//
//
//     return  ListView.builder(
//       itemCount: favoritepage.items.length,
//       //not populated correctly
//       itemBuilder: (context, index) {
//         print(
//             'favoriteProducts length: ${favoritepage.items.length}');
//
//         // final product =
//         // widget.model.favoriteProducts[index];
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: 60),
//           child: Card(
//             elevation: 5,
//             color: Colors
//                 .white70, // add some elevation to create a shadow effect
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(
//                   10.0), // round the edges of the card
//               side:
//               BorderSide(width: 1, color: Colors.grey),
//             ),
//             child: Column(
//                 crossAxisAlignment:
//                 CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     height: 60,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10),
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     leading: product?.ImageURL != null
//                         ? Image.network(
//                         product?.ImageURL ?? '')
//                         : SizedBox.shrink(),
//                     title: Text(product?.productName ?? ''),
//                     subtitle: Text(
//                         product?.productDescription ?? ''),
//                     trailing: Text(
//                       '\$${product?.productPrice ?? ''}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ]),
//           ),
//         );
//       },
//     );
//
//
//
//
//   }
// }
