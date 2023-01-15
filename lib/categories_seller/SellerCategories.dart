import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/categories_seller/artsandcrafts_subcategory.dart';
import 'package:home_services_flutter/categories_seller/baking_subcategory.dart';
import 'package:home_services_flutter/categories_seller/cooking_subcategory.dart';
import 'package:home_services_flutter/categories_seller/knitting_subcategory.dart';
import 'package:home_services_flutter/seller/seller_subcategory_music.dart';
import 'package:home_services_flutter/seller/SellerProfilePage.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/seller/seller_portfolio.dart';
import 'package:home_services_flutter/categories_seller/tailoring_subcategory.dart';
import 'package:home_services_flutter/seller/sellerwelcome.dart';
import '../seller/consumerSignup.dart';
import '../seller/addProduct.dart';

class SellerHomePage extends StatefulWidget {
  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  int _selectedIndex = 0;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Category');

  late Stream<QuerySnapshot> _streamCategory = _collectionRef.snapshots();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddProduct()),
      );
    } else if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SellerPortfolio()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamCategory = _collectionRef.snapshots();
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/pastel.png"
              ),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
            elevation: 13,


          shape: RoundedRectangleBorder(

              borderRadius:  BorderRadius.only(

                  bottomRight: Radius.circular(12),

                  bottomLeft: Radius.circular(12))

          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Seller Categories",
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
          padding: EdgeInsets.only(top: 80),
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
                            tileColor: Colors.white24,

                            trailing: Icon(Icons.arrow_forward,
                            size: 20,
                              color: Colors.black,
                            ),
                            leading:
                            data['name'] == "Tailoring"


                                ? Image(
                                    image: AssetImage('assets/images/tailoring.png'),
                                    width: 70.0,
                                    height: 70.0,
                                  )
                                : data['name'] == "Knitting"
                                    ? Image(
                                        image: AssetImage(
                                            'assets/images/knitting.png'),
                                        width: 70.0,
                                        height: 70.0,
                                      )

                                : data['name'] == "Baking"
                                ? Image(
                              image: AssetImage(
                                  'assets/images/baking.png'),
                              width: 70.0,
                              height: 70.0,
                            )

                                : data['name'] == "Cooking"
                                ? Image(
                              image: AssetImage(
                                  'assets/images/cooking.png'),
                              width: 70.0,
                              height: 70.0,
                            )
                                : data['name'] == "Arts & Crafts "
                                ? Image(
                              image: AssetImage(
                                  'assets/images/arts.png'),

                            )
                                    : Image(
                              image: AssetImage(
                                  'assets/images/arts.png'),
                              width: 75.0,
                              height: 75.0,
                            ),
                            title: Text(
                              data['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // subtitle: Text(data['subcategories'].toString()),
                            onTap: () {
                              if (i == 0) {
                                if (data['name'] == "Tailoring") {
                                  Text(data['subcategories'].toString());
                                  //display only the subcategories of music
                                  print(data['subcategories'].toString());
                                }

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => seller_tailoring_screen(),
                                    ));
                                // Text(data['subcategories'].toString());

                              } else if (i == 1) {
                                if (data['name'] == "Knitting") {
                                  Text(data['subcategories'].toString());
                                  //display only the subcategories of music
                                  print(data['subcategories'].toString());
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => seller_knitting_screen()));
                              }
                              else if (i == 2) {
                                if (data['name'] == "Baking") {
                                  Text(data['subcategories'].toString());
                                  //display only the subcategories of music
                                  print(data['subcategories'].toString());
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => seller_baking_screen()));
                              }
                              else if (i == 3) {
                                if (data['name'] == "Cooking") {
                                  Text(data['subcategories'].toString());
                                  //display only the subcategories of music
                                  print(data['subcategories'].toString());
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => seller_cooking_screen()));
                              }
                              else if (i == 4) {
                                if (data['name'] == "Arts and Crafts") {
                                  Text(data['subcategories'].toString());
                                  //display only the subcategories of music
                                  print(data['subcategories'].toString());
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => arts_crafts_sub()));
                              }
                            }),
                        Divider(),
                      ],
                    );
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),

              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits_sharp),
              label: 'Products',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Portfolio'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        drawer: Container(

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/pastel.png"
                  ),
                  fit: BoxFit.cover
              )
          ),
          child: Drawer(
            backgroundColor: Colors.transparent,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 80.h,
                ),
                Container(
                  height: 25.0,
                  child: DrawerHeader(
                    // decoration: BoxDecoration(
                    //     color: Colors.transparent,
                    //
                    //     image: DecorationImage(
                    //
                    //       image: AssetImage("assets/images/fyphomeservicesicon.png"),
                    //
                    //
                    //     )),
                    child: null,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                ListTile(

                  tileColor: Colors.white38,
                  trailing: Icon(Icons.dashboard,
                    size: 18,
                    color: Colors.purple,
                  ),
                  title: Text("Dashboard",


                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),

                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SellerWelcome()));
                  },
                ),
              Divider(),

              ListTile(

                tileColor: Colors.white38,



                trailing: Icon(Icons.category,
                  size: 18,
                  color: Colors.purple,
                ),
                  title: Text("Categories",

                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),

                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SellerHomePage()));
                  },
                ),

                Divider(),
                ListTile(

                  tileColor: Colors.white38,


                  trailing: Icon(Icons.person,
                    size: 18,
                    color: Colors.purple,
                  ),
                  title: Text("Profile",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),

                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
                Divider(),
                ListTile(
                  tileColor: Colors.white38,


                  trailing: Icon(Icons.switch_account,
                    size: 18,
                    color: Colors.purple,
                  ),
                  title: Text("Switch to Consumer",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),

                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => signupConsumer()));
                  },
                ),
                Divider(),
                ListTile(

                  tileColor: Colors.white38,

                  trailing: Icon(Icons.logout,
                    size: 18,
                    color: Colors.purple,
                  ),

                  title: Text("Logout",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
