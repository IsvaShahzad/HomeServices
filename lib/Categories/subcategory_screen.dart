import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_services_flutter/subcategories_addedproducts/Baking_addedproducts/cake_screen.dart';
import 'package:home_services_flutter/subcategories_addedproducts/Baking_addedproducts/cupcake_screen.dart';
import 'package:home_services_flutter/subcategories_addedproducts/Tailoring_addedproducts/pants_screen.dart';

import 'package:home_services_flutter/subcategories_addedproducts/Cooking_addedproducts/Frozenscreen.dart';

import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/subcategories_addedproducts/Baking_addedproducts/pizza_screen.dart';

import '../subcategories_addedproducts/Arts_addedproducts/Banner_Making.dart';
import '../subcategories_addedproducts/Arts_addedproducts/CanvasPaintingScreen.dart';
import '../subcategories_addedproducts/Cooking_addedproducts/Homemade_screen.dart';
import '../subcategories_addedproducts/Arts_addedproducts/Quilting_screen.dart';
import '../subcategories_addedproducts/Cooking_addedproducts/Western_Screen.dart';
import '../subcategories_addedproducts/Baking_addedproducts/brownies_screen.dart';
import '../subcategories_addedproducts/Tailoring_addedproducts/coats_screen.dart';
import '../subcategories_addedproducts/Knitting_addedproducts/scarf_screen.dart';
import '../subcategories_addedproducts/Tailoring_addedproducts/shirt_screen.dart';
import '../subcategories_addedproducts/Knitting_addedproducts/socks_screen.dart';
import '../subcategories_addedproducts/Knitting_addedproducts/sweaters_screen.dart';


// enum Categories { baking, cooking, knitting, tailoring, artAndCraft }

class ProductModel {
  final int id;
  final String productname;
  final String productprice;
  final String ImageURl;
  final String productdescription;
  final String product;

  ProductModel({
    required this.id,
    required this.productname,
    required this.productprice,
    required this.ImageURl,
    required this.productdescription,
    required this.product,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productname: json['product name'],
      productprice: json['product price'],
      ImageURl: json['Image URl'],
      productdescription: json['product description'],
      product: json['product'],
      id: json['id'],


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
  late String _selectedCategory = 'Cooking';
  late String _selectedsubcategory = 'Frozen';

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
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: ListTile(
                    trailing: Icon(Icons.arrow_forward),
                    title: Text(
                      subcategory['name']?.toString() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () async {
                      setState(() {
                        _selectedsubcategory = subcategory['name'];
                      });
                      final subcategoryName = subcategory['name']?.toString();

                      // if (index == 0 && _selectedCategory=='Cooking') {
                      if (subcategoryName == 'Frozen' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category', isEqualTo: 'Cooking')
                            .where('product subcategory', isEqualTo: 'Frozen')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductsAddedScreen(
                                    added: {'Frozenlist': addedProducts})));
                      }

                     else if (subcategoryName == 'Banner Making' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                                isEqualTo: 'Arts and Crafts')
                            .where('product subcategory',
                                isEqualTo: 'Banner Making')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BannerScreen(added: {
                                      'Bannermakinglist': addedProducts
                                    })));
                      }

                     else if (subcategoryName == 'sweaters' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Knitting')
                            .where('product subcategory',
                            isEqualTo: 'sweaters')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SweaterScreen(added: {
                                  'knittinglist': addedProducts
                                })));
                      }

                       else if (subcategoryName == 'Coats' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Tailoring')
                            .where('product subcategory',
                            isEqualTo: 'Coats')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoatsScreen(added: {
                                  'coatslist': addedProducts
                                })));
                      }

                      else if (subcategoryName == 'Cakes' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Baking')
                            .where('product subcategory',
                            isEqualTo: 'Cakes')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CakeScreen(added: {
                                  'cakelist': addedProducts
                                })));
                      }
                      if (subcategoryName == 'Home made' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category', isEqualTo: 'Cooking')
                            .where('product subcategory',
                                isEqualTo: 'Home made')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomemadeScreen(
                                    added: {'Homemadelist': addedProducts})));
                      } else if (subcategoryName == 'Quilting' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                                isEqualTo: 'Arts and Crafts')
                            .where('product subcategory', isEqualTo: 'Quilting')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuiltingScreen(
                                    added: {'Quiltinglist': addedProducts})));
                      }

                      else if (subcategoryName == 'Socks' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Knitting')
                            .where('product subcategory',
                            isEqualTo: 'Socks')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SocksScreen(added: {
                                  'Sockslist': addedProducts
                                })));
                      }

                      if (subcategoryName == 'Pants' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category', isEqualTo: 'Tailoring')
                            .where('product subcategory',
                            isEqualTo: 'Pants')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PantsScreen(
                                    added: {'pantslist': addedProducts})));
                      }

                      else if (subcategoryName == 'Brownies' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Baking')
                            .where('product subcategory',
                            isEqualTo: 'Brownies')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BrowniesScreen(added: {
                                  'brownieslist': addedProducts
                                })));
                      }

                      if (subcategoryName == 'Western' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category', isEqualTo: 'Cooking')
                            .where('product subcategory', isEqualTo: 'Western')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WesternScreen(added: {
                                      'Westernlist': addedProducts
                                    }))); //add products in a westernlist
                      } else if (subcategoryName == 'Canvas Painting' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                                isEqualTo: 'Arts and Crafts')
                            .where('product subcategory',
                                isEqualTo: 'Canvas Painting')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CanvasScreen(added: {
                                      'CanvasPaintinglist': addedProducts
                                    })));
                      }

                      else if (subcategoryName == 'scarfs' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Knitting')
                            .where('product subcategory',
                            isEqualTo: 'scarfs')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScarfScreen(added: {
                                  'scarfslist': addedProducts
                                })));
                      }
                      else if (subcategoryName == 'Shirt' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Tailoring')
                            .where('product subcategory',
                            isEqualTo: 'Shirt')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShirtScreen(added: {
                                  'shirtlist': addedProducts
                                })));
                      }

                      else if (subcategoryName == 'Pizza' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Baking')
                            .where('product subcategory',
                            isEqualTo: 'Pizza')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PizzaScreen(added: {
                                  'pizzalist': addedProducts
                                })));
                      }
                    if (subcategoryName == 'Cupcake' &&
                          _selectedsubcategory == subcategoryName) {
                        final addedProductsSnapshot = await FirebaseFirestore
                            .instance
                            .collection('addproducts')
                            .where('product category',
                            isEqualTo: 'Baking')
                            .where('product subcategory',
                            isEqualTo: 'Cupcake')
                            .get();
                        final addedProducts = addedProductsSnapshot.docs
                            .map((doc) => ProductModel.fromJson(doc.data()))
                            .toList();
                        addedProducts.forEach((product) {
                          print('Name: ${product.productname}');
                          print('Price: ${product.productprice}');
                          print('Image: ${product.ImageURl}');
                          print('Description: ${product.productdescription}');
                        });

                        print(
                            addedProducts); // Add this line to print the list of added products

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CupcakeScreen(added: {
                                  'cupcakelist': addedProducts
                                })));
                      }
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
