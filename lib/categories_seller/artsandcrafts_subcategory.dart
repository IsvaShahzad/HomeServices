import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/seller/addProduct.dart';
import 'package:home_services_flutter/categories_seller/SellerCategories.dart';
import 'package:home_services_flutter/seller/seller_portfolio.dart';

class arts_crafts_sub extends StatefulWidget {
  @override
  _arts_crafts_subState createState() => _arts_crafts_subState();
}

class _arts_crafts_subState extends State<arts_crafts_sub> {
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

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 7,


        shape: RoundedRectangleBorder(

            borderRadius:  BorderRadius.only(

                bottomRight: Radius.circular(12),

                bottomLeft: Radius.circular(12))

        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "sub categories Arts & Crafts",
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
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('Category').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return Column(
                    children: [

                      ListTile(

                          title: Text(

                            data['name'] == "Arts and Crafts" ? data['subcategories'].toString() : "",

                            // data['subcategories'].toString(),   //CHANGE WILL OCCUR HERE

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // subtitle: Text(data['subcategories'].toString()),
                          onTap: () {

                            if (i == 0) {
                              if (data['name'] == "Arts and Crafts") {
                                Text(data['subcategories'].toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SellerPortfolio()));
                              }} else if (i == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddProduct()));
                            }
                          }),
                      // Divider(),
                    ],
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),




    );
  }
}
