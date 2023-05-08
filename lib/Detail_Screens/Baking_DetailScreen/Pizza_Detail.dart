import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/Consumer_Screens/favourites.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PizzaDetailScreen extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String ImageURL;
  final Product product;

  const PizzaDetailScreen({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.ImageURL,
    required this.product,
  }) : super(key: key);

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();

}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;
  late SharedPreferences _prefs;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _prefs = prefs;
        _isFavorite = _prefs.getBool(widget.product.toString()) ?? false;
      });
    });
  }
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final favoriteProductsModel =
        Provider.of<FavouriteProductPage>(context, listen: false);

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
                try {
                  FirebaseFirestore.instance
                      .collection('favourite products')
                      .doc()
                      .set({
                    'name': nameController.text,
                    'url': urlController.text,
                    'price': priceController.text,
                    'description': descriptionController.text,
                  });
                  print(nameController.text);
                  print(urlController.text);
                  print(priceController.text);
                  print(descriptionController.text);
                } catch (e) {}
                ;
                setState(() {
                  _isFavorite = !_isFavorite;
                });
                _prefs.setBool(widget.product.toString(), _isFavorite);

                // Add the product to favorites
                if (_isFavorite) {
                  favoriteProductsModel.addFavoriteProduct(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to favorites'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  favoriteProductsModel.removeFavoriteProduct(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Removed from favorites'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
            ),

            // SizedBox(width: 24.0),
            // FloatingActionButton(
            //   backgroundColor: Colors.purple,
            //   child: Icon(Icons.add_shopping_cart),
            //   onPressed: () {
            //     setState(() {
            //       if (_quantity > 1) {
            //         _quantity--;
            //       }
            //     });
            //   },
            //   // child: Icon(Icons.remove),
            // ),
          ],
        ),
      ),
    );
  }
}
