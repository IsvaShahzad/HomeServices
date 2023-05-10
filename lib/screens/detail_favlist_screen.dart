// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:home_services_flutter/Consumer_Screens/favourites.dart';
// import 'package:provider/provider.dart';
// import 'package:home_services_flutter/models/detail_model.dart';
// import 'package:home_services_flutter/screens/detail_favlist_screen.dart';
// import 'package:home_services_flutter/Detail_Screens/Baking_DetailScreen/Pizza_Detail.dart';
//
// import '../models/favpage_model.dart';
//
// class Detail_Fav_Screen extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController urlController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     // final favoriteProductsModel =
//     //     Provider.of<FavoriteProductsPage>(context, listen: false);
//
//     return Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/images/pastel.png"),
//                 fit: BoxFit.cover)),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 title: Text('Favorite',
//                     style: Theme.of(context).textTheme.headline1),
//                 floating: true,
//                 actions: [
//                   IconButton(
//                     icon: const Icon(Icons.favorite_border),
//                     // code of navigation to favorite page //
//                     onPressed: () =>
//                         Navigator.pushNamed(context, '/favoritepage'),
//                   ),
//                 ],
//               ),
//               const SliverToBoxAdapter(child: SizedBox(height: 12)),
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                   // to call MyListItem widget //
//                   return _MyListItem(index);
//                 },
//                     // to specify count the list show //
//                     childCount: 15),
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// class _MyListItem extends StatelessWidget {
//   final int index;
//
//   const _MyListItem(this.index, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var item = context.select<FavoriteListModel, PizzaDetailScreen>(
//
//       (favoritelist) => favoritelist.getByPosition(index),
//     );
//
//
//     var textTheme = Theme.of(context).textTheme.headline6;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: LimitedBox(
//         maxHeight: 60,
//         child: Row(
//           children: [
//             AspectRatio(
//               aspectRatio: 1,
//               child: Image.asset(item.ImageURL),
//             ),
//             const SizedBox(width: 24),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(item.productName, style: textTheme),
//                   Text(item.productPrice,
//                       style: TextStyle(fontSize: 16, color: Colors.grey)),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 24),
//             // to call AddButton widget //
//             _AddButton(item: item),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // UI of AddButton widget //
// class _AddButton extends StatelessWidget {
//   final PizzaDetailScreen item;
//
//   const _AddButton({required this.item, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // The context.select() method will let you listen to changes to
//     // a *part* of a model. You define a function that "selects" (i.e. returns)
//     // the part you're interested in, and the provider package will not rebuild
//     // this widget unless that particular part of the model changes.
//     //
//     // This can lead to significant performance improvements.
//     var isInFavoritePage = context.select<FavouriteProductPage, bool>(
//       // Here, we are only interested whether [item] is inside the favorite page.
//       (favoritepage) => favoritepage.items.contains(item),
//     );
//
//     return IconButton(
//       icon: isInFavoritePage
//           ? Icon(Icons.favorite, color: Colors.red)
//           : Icon(Icons.favorite_border),
//       onPressed: isInFavoritePage
//           ? () {
//               // To make the user removes the favorite item not only from the favorite page but also from the favorite list
//               // We are using context.read() here because the callback
//               // is executed whenever the user taps the button. In other
//               // words, it is executed outside the build method.
//               var favoritepage = context.read<FavouriteProductPage>();
//               favoritepage.remove(item);
//             }
//           : () {
//               // If the item is not in favorite page, we let the user add it.
//               // We are using context.read() here because the callback
//               // is executed whenever the user taps the button. In other
//               // words, it is executed outside the build method.
//               var favoritepage = context.read<FavouriteProductPage>();
//               favoritepage.add(item);
//             },
//     );
//   }
// }
//
// // }
// //         floatingActionButton: Row(
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: [
// //             FloatingActionButton(
// //               child: _isFavorite
// //                   ? Icon(Icons.favorite)
// //                   : Icon(Icons.favorite_border),
// //               onPressed: () {
// //                 try {
// //                   FirebaseFirestore.instance
// //                       .collection('favourite products')
// //                       .doc()
// //                       .set({
// //                     'name': nameController.text,
// //                     'url': urlController.text,
// //                     'price': priceController.text,
// //                     'description': descriptionController.text,
// //                   });
// //                   print(nameController.text);
// //                   print(urlController.text);
// //                   print(priceController.text);
// //                   print(descriptionController.text);
// //                 } catch (e) {}
// //                 ;
// //                 setState(() {
// //                   _isFavorite = !_isFavorite;
// //                 });
// //                 _prefs.setBool(widget.productName, _isFavorite);
// //
// //                 // Add the product to favorites
// //                 if (_isFavorite) {
// //                   favoriteProductsModel.addFavoriteProduct(widget.product);
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(
// //                       content: Text('Added to favorites'),
// //                       duration: Duration(seconds: 2),
// //                     ),
// //                   );
// //
// //
// //                 } else {
// //                   favoriteProductsModel.removeFavoriteProduct(widget.product);
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(
// //                       content: Text('Removed from favorites'),
// //                       duration: Duration(seconds: 2),
// //                     ),
// //                   );
// //                 }
// //               },
// //               backgroundColor: Colors.white,
// //               foregroundColor: Colors.red,
// //             ),
// //
// //             // SizedBox(width: 24.0),
// //             // FloatingActionButton(
// //             //   backgroundColor: Colors.purple,
// //             //   child: Icon(Icons.add_shopping_cart),
// //             //   onPressed: () {
// //             //     setState(() {
// //             //       if (_quantity > 1) {
// //             //         _quantity--;
// //             //       }
// //             //     });
// //             //   },
// //             //   // child: Icon(Icons.remove),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
