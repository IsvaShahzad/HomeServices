import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_services_flutter/Detail_Screens/Baking_DetailScreen/Pizza_Detail.dart';
import 'package:home_services_flutter/initialScreens/verify_email.dart';
import 'package:provider/provider.dart';

import '../initialScreens/loginScreen.dart';
import '../main.dart';

class Product with ChangeNotifier {

  final String ImageURL;
  final String productName;
  final String productDescription;
  final String productPrice;
  // bool isFavourite;

  Product({
    required this.ImageURL,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  });
}

class FavouriteProductPage with ChangeNotifier {
  List<Product> _favoriteProducts = [];


  List<Product> get favoriteProducts => _favoriteProducts;

  void addFavoriteProduct(Product product) {

    print('Adding product $product to favorites');

    _favoriteProducts.add(product);
    print('Favorite products: $_favoriteProducts');
    notifyListeners();
  }

  void removeFavoriteProduct(Product product) {
    print('Removing product $product from favorites');
    _favoriteProducts.remove(product);
    print('Favorite products: $_favoriteProducts');

    notifyListeners();
  }
}

class FavoriteProductsPage extends StatefulWidget {
  final FavouriteProductPage model;

  const FavoriteProductsPage({required this.model});

  @override
  _FavoriteProductsPageState createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<FavoriteProductsPage> {
  @override
  Widget build(BuildContext context) {



    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pastel.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 13,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Favourites  ❤ ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: widget.model.favoriteProducts.isEmpty
                      ? Center(
                          child: Text(
                            "No products added",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: widget.model.favoriteProducts.length,
                          //not populated correctly
                          itemBuilder: (context, index) {
                            print(
                                'favoriteProducts length: ${widget.model.favoriteProducts.length}');

                            final product =
                                widget.model.favoriteProducts[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              child: Card(
                                elevation: 5,
                                color: Colors
                                    .white70, // add some elevation to create a shadow effect
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // round the edges of the card
                                  side:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: product?.ImageURL != null
                                            ? Image.network(
                                                product?.ImageURL ?? '')
                                            : SizedBox.shrink(),
                                        title: Text(product?.productName ?? ''),
                                        subtitle: Text(
                                            product?.productDescription ?? ''),
                                        trailing: Text(
                                          '\$${product?.productPrice ?? ''}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
