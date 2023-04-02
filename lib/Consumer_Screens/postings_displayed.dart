import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';


class PostingDisplayedScreen extends StatefulWidget {
  final Map<String, dynamic> addedposting;

  PostingDisplayedScreen({required this.addedposting});

  @override
  _PostingDisplayedScreenState createState() => _PostingDisplayedScreenState();
}

class _PostingDisplayedScreenState extends State<PostingDisplayedScreen> {
  int _selectedIndex = 0;

  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('AddRequirements');

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

  String getAppbarTitle() => "Added Posting";

  @override
  Widget build(BuildContext context) {
    print(widget.addedposting);

    final productPrice = widget.addedposting?["product price"];
    final productName = widget.addedposting?["product name"];
    final productDescription = widget.addedposting?["product description"];
    final productQuantity = widget.addedposting?["product quantity"];
    final Deliverydate = widget.addedposting?["Delivery Date"];
    final ContactEmail = widget.addedposting?["Contact email"];
    final Mobilenumber = widget.addedposting?["Mobile Number"];
    final ImageURL = widget.addedposting?["Image URL"];

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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 30),
              child: widget.addedposting != null &&
                  widget.addedposting != null &&
                  widget.addedposting.isNotEmpty
                  ? GridView.builder(
                itemCount: widget.addedposting.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18.0,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  final addedp = widget.addedposting[index];

                  final ImageURL = addedp.ImageURl;
                  final productName = addedp.productname;
                  final productPrice = addedp.productprice;
                  final productDescription = addedp.productdescription;
                  final productQuantity = addedp.productquantity;
                  final Deliverydate = addedp.deliverydate;
                  final ContactEmail = addedp.email;
                  final Mobilenumber = addedp.mobile;



                  return Card(
                    elevation: 5,
                    color:Colors.white70,// add some elevation to create a shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // round the edges of the card
                      side: BorderSide(width: 1, color: Colors.grey), // add a border around the card
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(addedp.ImageURL), // Use addedproductss.ImageURL instead of ImageURL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Item: $productName\nRs. $productPrice\n$productDescription\n$productQuantity \n$ContactEmail",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );


                },
              )
                  : Center(
                child: Text(
                  'No products found',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            )


        ));
  }
}
