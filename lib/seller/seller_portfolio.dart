import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: Text('Seller Portfolio'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                picture = value;
              });
            },
            decoration: InputDecoration(labelText: 'Picture URL'),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                workDone = value;
              });
            },
            decoration: InputDecoration(labelText: 'Work Done'),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                products.add(value);
              });
            },
            decoration: InputDecoration(labelText: 'Add Product'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(products[index]);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(name);
              print(picture);
              print(workDone);
              print(products);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
