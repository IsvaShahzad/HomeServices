import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:home_services_flutter/allServices/services_grid.dart';
import 'package:home_services_flutter/allServices/service_provider_signup.dart';
import '../initialScreens/loginScreen.dart';
import '../initialScreens/ProfileScreen.dart';
import '../allServices/services_grid.dart';

class ServicesOverviewScreen extends StatelessWidget {
  static const String id = 'Services-overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' Home Services',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(padding: EdgeInsets.zero, children: [
            SizedBox(
              height: 110.h,
            ),

            Container(
              height: 130.0,
              child: DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage("assets/images/homeservicespic.PNG"),
                    )),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            ListTile(
              leading: SizedBox(
                height: 25.0,
                width: 25.0, // fixed width and height
                //child:
                // new SvgPicture.asset('assets/images/ic_dashboard.svg')
              ),
              title: const Text('Dashboard',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              leading: SizedBox(
                height: 25.0,
                width: 25.0, // fixed width and height
                // child: new SvgPicture.asset(
                //     'assets/images/ic_dashboard.svg')
              ),
              title: const Text('Profile',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
            ),
            // ListTile(
            //     leading: SizedBox(
            //         height: 25.0,
            //         width: 25.0, // fixed width and height
            //         // child: new SvgPicture.asset(
            //         //     'assets/images/ic_releaseReq.svg')
            //     ),
            //     title: const Text('History',
            //         style: TextStyle(fontWeight: FontWeight.bold)),
            //     onTap: () {
            //       // Navigator.push(
            //       //     context,
            //       //     MaterialPageRoute(
            //       //       builder: (context) => ReleaseScreen(),
            //       //     ));
            //     }),

            ListTile(
              leading: SizedBox(
                height: 25.0,
                width: 25.0, // fixed width and height
                // child:
                // new SvgPicture.asset('assets/images/ic_expenditure.svg')
              ),
              title: const Text('Orders Placed',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ExpenditureScreen(),
                //       ));
              },
            ),

            ListTile(
              leading: SizedBox(
                height: 25.0,
                width: 25.0, // fixed width and height
                // child:
                // new SvgPicture.asset('assets/images/ic_dashboard.svg')
              ),
              title: const Text('Switch to Service Provider',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServiceProviderRegister()));
              },
            ),

            ListTile(
              leading: SizedBox(
                height: 25.0,
                width: 25.0, // fixed width and height
                // child:
                // new SvgPicture.asset('assets/images/ic_dashboard.svg')
              ),
              title: const Text('Log out',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),

            // Populate the Drawer in the next step.
          ]),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: ServiceGrid(),
        ));
  }
}
