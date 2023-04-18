// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'services_detail.dart';
// import '../provider/Services.dart';
//
// class ServiceItem extends StatelessWidget {
//   // late final String id;
//   // late final String title;
//   // late final String imageUrl;
//   //
//   // ServiceItem(this.id, this.title, this.imageUrl);
//
//   @override
//   Widget build(BuildContext context) {
//     final service = Provider.of<Services>(context);
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: GridTile(
//         child: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pushNamed(
//               ServiceDetail.routeName,
//               arguments: service.id,
//             );
//           },
//           child: Image.network(
//             service.imageUrl,
//             fit: BoxFit.cover,
//           ),
//         ),
//         footer: GridTileBar(
//           backgroundColor: Colors.black54,
//           // leading: IconButton(
//           //   icon: Icon(service.isFavourite ? Icons.favorite : Icons.favorite_border),
//           //   onPressed: () {
//           //     service.toggleFavouriteStatus();
//           //   },
//           //   color: Theme.of(context).accentColor,
//           // ),
//           title: Text(
//             service.title,
//             textAlign: TextAlign.center,
//           ),
//           // trailing: IconButton(
//           //   icon: Icon(Icons.shopping_cart),
//           //   onPressed: () {},
//           //   color: Theme.of(context).accentColor,
//           // ),
//         ),
//       ),
//     );
//   }
// }
