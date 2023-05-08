import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_services_flutter/initialScreens/verify_email.dart';
import 'package:provider/provider.dart';

import '../initialScreens/loginScreen.dart';

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final String price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

class FavouriteProductPage with ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  void addFavoriteProduct(Product product) {
      print('Adding product $product to favorites');
      _favoriteProducts.add(product);
      notifyListeners();
    }




  void removeFavoriteProduct(Product product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }
}

class FavoriteProductsPage extends StatefulWidget {
  final FavouriteProductPage model;

  const FavoriteProductsPage({
    required this.model});

  @override
  _FavoriteProductsPageState createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<FavoriteProductsPage> {
  bool _isObscure = true;

  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
                          itemBuilder: (context, index) {
                            final product =
                                widget.model.favoriteProducts[index];
                            return Card(
                              child: ListTile(
                                leading: product != null && product.imageUrl != null
                                    ? Image.network(product.imageUrl)
                                    : SizedBox.shrink(),
                                title: Text(product?.name ?? ''),
                                subtitle: Text(product?.description ?? ''),
                                // trailing: Text(
                                //   '\$${product.price ?? ''}',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),

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
