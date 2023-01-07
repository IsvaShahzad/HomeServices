import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/seller/SellerProfilePage.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/seller/search_screen.dart';
import 'package:home_services_flutter/seller/seller_portfolio.dart';
import 'package:home_services_flutter/seller/seller_products.dart';
import '../allServices/services_overview_screen.dart';
import 'addProduct.dart';

class SellerHomePage extends StatefulWidget {
  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  int _selectedIndex = 0;

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
          MaterialPageRoute(builder: (context) => SellerPortfolio(sellerName: "", sellerDescription: "", products:[] )
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Seller Homepage",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 22.0,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.notifications,
          //     color: Colors.white,
          //     size: 22.0,
          //   ),
          //   onPressed: () {
          //     // Open notifications screen
          //   },
          // ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the seller home page!'),
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
            ListTile(
              title: Text("DashBoard"),
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
              title: Text("Orders"),
              onTap: () {
                // Open orders screen
              },
            ),
            ListTile(
              title: Text("Switch to Consumer"),
              onTap: () {
                // Open settings screen
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
