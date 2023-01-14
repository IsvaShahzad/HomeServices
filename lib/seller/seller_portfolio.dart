import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_services_flutter/seller/seller_homepage.dart';
class SellerPortfolio extends StatefulWidget {
  @override
  _SellerPortfolioState createState() => _SellerPortfolioState();
}

class _SellerPortfolioState extends State<SellerPortfolio> {
  String name = '';
  String picture = '';
  String workDone = '';
  List<String> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SellerHomePage()));
          },
        ),
        title: Text('Seller Portfolio',
        style: TextStyle(
          color: Colors.white
        ),
        ),
      ),
      // body: Column(
      //   children: <Widget>[
      //     TextField(
      //       onChanged: (value) {
      //         setState(() {
      //           name = value;
      //         });
      //       },
      //       decoration: InputDecoration(labelText: 'Name'),
      //     ),
      //     TextField(
      //       onChanged: (value) {
      //         setState(() {
      //           picture = value;
      //         });
      //       },
      //       decoration: InputDecoration(labelText: 'Picture URL'),
      //     ),
      //     TextField(
      //       onChanged: (value) {
      //         setState(() {
      //           workDone = value;
      //         });
      //       },
      //       decoration: InputDecoration(labelText: 'Work Done'),
      //     ),
      //     TextField(
      //       onChanged: (value) {
      //         setState(() {
      //           products.add(value);
      //         });
      //       },
      //       decoration: InputDecoration(labelText: 'Add Product'),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: products.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return Text(products[index]);
      //         },
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         print(name);
      //         print(picture);
      //         print(workDone);
      //         print(products);
      //       },
      //       child: Text('Save'),
      //     ),
      //   ],
      // ),
    );
  }
}
