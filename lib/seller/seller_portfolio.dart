// import 'package:flutter/material.dart';
// import 'package:home_services_flutter/seller/search_screen.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Seller Portfolio',
//       home: SellerPortfolio(),
//     );
//   }
// }
//
// class SellerPortfolio extends StatefulWidget {
//   @override
//   State<SellerPortfolio> createState() => _SellerPortfolioState();
// }
//
// class _SellerPortfolioState extends State<SellerPortfolio> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: Text('Seller Portfolio',
//             style: TextStyle(color: Colors.white),
//
//           ),
//         ),
//         body: Align(
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Text('Seller Name'),
//                     Text('Location'),
//
//
//
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       );}}
import 'package:flutter/material.dart';

class SellerPortfolio extends StatelessWidget {

  final String sellerName;
  final String sellerDescription;
  final List<Map<String, dynamic>> products;


  SellerPortfolio({
    required this.sellerName,
    required this.sellerDescription,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sellerName"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("hello"),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              children: products.map((product) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Image.network(
                          product['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['knife'],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['sharp'],
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$${product['price']}',
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
