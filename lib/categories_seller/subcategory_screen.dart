import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_services_flutter/categories_seller/addedproducts_screen.dart';

import 'package:home_services_flutter/initialScreens/loginScreen.dart';

import '../seller/seller_portfolio.dart';

// enum Categories { baking, cooking, knitting, tailoring, artAndCraft }


class ProductModel {
  final String name;
  final double price;
  final String image;
  final String description;

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
      description: json['description'],
    );
  }
}


class SubcategoryScreen extends StatefulWidget {
  final Map<String, dynamic> categories;

  SubcategoryScreen({required this.categories});

  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  int _selectedIndex = 0;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Category');

  late Stream<QuerySnapshot> _streamCategory = _collectionRef.snapshots();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamCategory = _collectionRef.snapshots();
  }

  //
  String getAppbarTitle() => "Sub category ${widget.categories['name']}";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/pastel.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 7,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              getAppbarTitle(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 30),
            child: ListView.builder(
              itemCount: widget.categories['subcategories'].length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final subcategory = widget.categories['subcategories'][index];
                return ListTile(
                  trailing: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    subcategory['name'].toString() ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductsAddedScreen(added: {},)));
                    }

                    //check for queries of firestore to filter
                    //   // } else if (index == 1) {
                    //   //   Navigator.push(
                    //   //       context,
                    //   //       MaterialPageRoute(
                    //   //           builder: (context) => LoginScreen()));
                    //   // }
                    // },
                    // onTap: () async {
                    //   final addedProductsSnapshot = await FirebaseFirestore.instance
                    //       .collection('Category')
                    //       .doc('Frozen')
                    //       .collection('subcategories')
                    //       .get();
                    //   final addedProducts = addedProductsSnapshot.docs
                    //       .map((doc) => ProductModel.fromJson(doc.data()))
                    //       .toList();
                    //
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //               ProductsAddedScreen(added: {'Frozen': addedProducts})));
                    // },

                  });
              },
            )),
      ),
    );
  }
}
