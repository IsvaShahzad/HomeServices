import 'package:flutter/material.dart';
import 'package:home_services_flutter/seller/seller_checkout/shipping_screen.dart';
import '../../Detail_Screens/Packages_DetailScreen/box_detailscreen.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({Key? key, required this.cart}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    total = widget.cart.calculateTotal();
  }

  void updateTotal() {
    setState(() {
      total = widget.cart.calculateTotal();
    });
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
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Text('Cart 🛒'),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.cart.items.length,
                    itemBuilder: (context, index) {
                      CartItem item = widget.cart.items[index];

                      return Card(
                        elevation: 3.0, // Elevation of the Card
                        child: ListTile(
                          tileColor: Colors
                              .white70, // Add a distinguishable background color
                          contentPadding: EdgeInsets.all(
                              8.0), // Adjust the tile padding as needed
                          leading: ClipOval(
                            child: Image.asset(
                              item.imageUrl,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            item.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Text('Price: ${item.price}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 75),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 29,
                                      height: 35,
                                      child: IconButton(
                                        icon: RichText(
                                          text: TextSpan(
                                            text: '-',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (item.quantity > 1) {
                                              item.quantity--;
                                              updateTotal();
                                            } else {
                                              widget.cart.removeFromCart(item);
                                              updateTotal();
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Text(item.quantity.toString()),
                                    Container(
                                      width: 29,
                                      height: 35,
                                      child: IconButton(
                                        icon: RichText(
                                          text: TextSpan(
                                            text: '+',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            item.quantity++;
                                            updateTotal();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 3,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Subtotal: ${widget.cart.calculateTotal().toStringAsFixed(2)}/-',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Delivery: 150/-',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 30),
                      Divider(height: 8),
                      SizedBox(height: 15),
                      Text(
                        'Total: ${(widget.cart.calculateTotal() + 150).toStringAsFixed(2)}/-',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ShippingScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFAB47BC),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10.0, // Elevation of the button
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ));
  }
}
