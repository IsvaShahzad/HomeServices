import 'package:flutter/material.dart';

class SellerPortfolio extends StatelessWidget {
  final String sellerName;
  final String sellerLocation;
  final List<String> portfolioProducts;

  SellerPortfolio({
    required this.sellerName,
    required this.sellerLocation,
    required this.portfolioProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Portfolio',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Seller: $sellerName',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Location: $sellerLocation',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: portfolioProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    portfolioProducts[index],
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
