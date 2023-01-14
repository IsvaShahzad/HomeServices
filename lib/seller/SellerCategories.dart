import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/sellerSubcategory.dart';
import 'package:home_services_flutter/seller/SellerProfilePage.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/seller/seller_portfolio.dart';
import 'consumerSignup.dart';
import 'addProduct.dart';

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
    }
    else if(index== 2){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SellerPortfolio()
          ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamCategory= _collectionRef.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    // _collectionRef.get();
    // _collectionRef.snapshots();



     return Scaffold(
      appBar: AppBar(
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

      // body: StreamBuilder<QuerySnapshot>(
      //
      //   stream: _streamCategory,
      //     builder:(BuildContext context, AsyncSnapshot snapshot){
      //
      //     if(snapshot.hasError)
      //       {
      //         return Center(child: Text(snapshot.error.toString()));
      //       }
      //     if(snapshot.connectionState == ConnectionState.active)
      //       {
      //            QuerySnapshot querySnapshot = snapshot.data;
      //       }
      //     return Center(child: CircularProgressIndicator());
      //
      //
      //
      //
      //     },
      // ),

body:
Padding(
  padding: EdgeInsets.only(top: 30),
  child:   StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
                    title: Text(data['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // subtitle: Text(data['subcategories'].toString()),
                    onTap: () {
                      // // Text(data['subcategories'].toString());
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => SellerPortfolio(),
                      //     ));

                      if (i == 0) {
                        if (data['name'] == "Music") {
                          Text(data['subcategories'].toString());
                          //display only the subcategories of music
                          print(data['subcategories']);
                        }

                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => subcategoryScreen(),

                      ));
                        // Text(data['subcategories'].toString());

                      }
                      else if (i == 1) {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => AddProduct()));                      }
                      if (i == 2) {

                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => subcategoryScreen(
                      )));
                      Text(data['subcategories'].toString());

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

       // body: StreamBuilder<QuerySnapshot>(
       //   stream: _streamCategory,
       //   builder:(BuildContext context, AsyncSnapshot snapshot){
       //     if(snapshot.hasError)
       //     {
       //       return Center(child: Text(snapshot.error.toString()));
       //     }
       //     if(snapshot.connectionState == ConnectionState.active)
       //     {
       //       QuerySnapshot querySnapshot = snapshot.data;
       //       return ListView.builder(
       //           itemCount: querySnapshot.docs.length,
       //           itemBuilder: (context, index) {
       //             return ListTile(
       //               title: Text(querySnapshot.docs[index].data()['name']),
       //               subtitle: Text(querySnapshot.docs[index].data()['subcategories']),
       //             );
       //           });
       //     }
       //     return Center(child: CircularProgressIndicator());
       //   },
       // ),
        // child: Text('Welcome to the seller home page!'),



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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Portfolio'),

          ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),



      drawer: Drawer(

        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 80.h,
            ),
            Container(
              height: 145.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage("assets/images/homeservicespic.PNG"),
                    )),
                child: null,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            ListTile(
              title: Text("Categories"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SellerHomePage()));
              },
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),

            ListTile(
              title: Text("Switch to Consumer"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => signupConsumer()));
                },
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
