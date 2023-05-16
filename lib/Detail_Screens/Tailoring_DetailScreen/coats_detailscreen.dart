import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/subcategories_addedproducts/Cooking_addedproducts/Homemade_screen.dart';

import 'package:provider/provider.dart';

import '../../Consumer_Screens/favourites.dart';
import '../../initialScreens/loginScreen.dart';

class CoatsDetailScreen extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String ImageURL;

  const CoatsDetailScreen({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.ImageURL,
  }) : super(key: key);

  @override
  State<CoatsDetailScreen> createState() => _CoatsDetailScreenState();
}

class _CoatsDetailScreenState extends State<CoatsDetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    // TODO: Add the product to favorites here
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProductsModel =
    Provider.of<FavouriteProductPageProvider>(context, listen: false);

    void _showFavoriteOptions(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                // leading: Icon(Icons.favorite),
                title: Text('❤         Favourites '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FavoriteProductsPage(
                          ImageURL: widget.ImageURL,
                          productName: widget.productName,
                          productDescription: widget.productDescription,
                          productPrice: widget.productPrice,
                        )),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  // Perform the logout action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/pastel.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  widget.ImageURL,
                  fit: BoxFit.cover,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    _showFavoriteOptions(context);
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.0),
                    child: Text(
                      widget.productName,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11.0),
                    child: Text(
                      ' ${widget.productDescription}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Rs.${widget.productPrice}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add the selected product to the cart
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 8.0),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFAB47BC),
                        onPrimary: Colors.white,
                        elevation: 6,
                        minimumSize: const Size(200, 50),
                        maximumSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: _isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () {

                setState(() {
                  _isFavorite = !_isFavorite;
                });
                // _prefs.setBool(key, _isFavorite);


                final product = Product(
                  ImageURL: widget.ImageURL,
                  productName: widget.productName,
                  productDescription: widget.productDescription,
                  productPrice: widget.productPrice,
                );

                // Add the product to favorites
                if (_isFavorite) {
                  favoriteProductsModel.addFavoriteProduct(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to favorites'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  favoriteProductsModel.removeFavoriteProduct(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Removed from favorites'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => FavoriteProductsPage(
                //         ImageURL: widget.ImageURL,
                //         productName: widget.productName,
                //         productDescription: widget.productDescription,
                //         productPrice: widget.productPrice,
                //       )),
                // );
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
            ),


          ],
        ),
      ),
    );
  }
}

