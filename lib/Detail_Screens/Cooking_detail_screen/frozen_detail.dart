import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/subcategories_addedproducts/Cooking_addedproducts/Homemade_screen.dart';

import 'package:provider/provider.dart';

class FrozenDetailScreen extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String ImageURL;

  const FrozenDetailScreen({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.ImageURL,
  }) : super(key: key);

  @override
  State<FrozenDetailScreen> createState() => _FrozenDetailScreenState();
}

class _FrozenDetailScreenState extends State<FrozenDetailScreen> {

  int _quantity = 1;
  bool _isFavorite = false;


  @override
  Widget build(BuildContext context) {
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
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.productName,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                  SizedBox(height: 26.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Price: Rs.${widget.productPrice}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Description: ${widget.productDescription}',
                      style: TextStyle(
                        fontSize: 18.0,
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
              child: _isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
                // Add the product to favorites
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
            ),
            SizedBox(width: 24.0),
            FloatingActionButton(
              backgroundColor: Colors.purple,
              child: Icon(Icons.add_shopping_cart),
              onPressed: () {
                setState(() {
                  if (_quantity > 1) {
                    _quantity--;
                  }
                });
              },
              // child: Icon(Icons.remove),
            ),


          ],
        ),
      ),
    );


  }
}
