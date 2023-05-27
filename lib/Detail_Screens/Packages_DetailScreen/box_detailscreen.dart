import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../seller/Cart_Screen.dart';

class CartItem {
  String name;
  double price;
  String imageUrl;

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl,

  });
}

class Cart {
  List<CartItem> items = [];

  void addToCart(CartItem item) {
    items.add(item);
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}

class Box_DetailScreen extends StatefulWidget {
  final String packageName;
  final double packagePrice;
  final String packageDescription;
  final String packageImageURL;

  const Box_DetailScreen({
    Key? key,
    required this.packageName,
    required this.packagePrice,
    required this.packageDescription,
    required this.packageImageURL,
  }) : super(key: key);

  @override
  State<Box_DetailScreen> createState() => _Box_DetailScreenState();
}

class _Box_DetailScreenState extends State<Box_DetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;

  Cart cart = Cart();

  void showCartMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Added to Cart'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  widget.packageImageURL,
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
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.0),
                    child: Text(
                      widget.packageName,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11.0),
                    child: Text(
                      ' ${widget.packageDescription}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Rs.${widget.packagePrice}',
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
                        // Add the selected product to the cart
                        CartItem item = CartItem(
                          name: widget.packageName,
                          price: widget.packagePrice,
                          imageUrl:widget.packageImageURL,
                        );
                        cart.addToCart(item);
                        showCartMessage(context);


                        // Navigate to the cart screen with the necessary data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(cart: cart),
                          ),
                        );
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

                  // SizedBox(height: 30.0),
                  // Text(
                  //   'Total: Rs.$total',
                  //   style: TextStyle(
                  //     fontSize: 18.0,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
