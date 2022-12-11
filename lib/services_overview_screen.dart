import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'ProfileScreen.dart';
import 'loginScreen.dart';
import 'service_item.dart';
import 'Services.dart';



class ServicesOverviewScreen extends StatelessWidget {


  final List<Services> loadedservices = [



    Services(
      id: 'p1',
      title: 'Cooking',
      description: 'Yummy food served hot and fresh!',
      price: 29.99,
      imageUrl:
           'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',

    ),
    Services(
      id: 'p2',
      title: 'Arts and Crafts',
      description: 'Fun art for your homes',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Services(
      id: 'p3',
      title: 'Tailoring',
      description: 'We provide with the best tailoring service.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Services(
      id: 'p4',
      title: 'Knitting',
      description: 'Knitting services available',
      price: 49.99,
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    )


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Home Services',style: TextStyle(
          color: Colors.white,
        ),),

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
          ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  // child: new SvgPicture.asset(
                  //     'assets/images/ic_releaseReq.svg')
              ),
              title: const Text('History',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ReleaseScreen(),
                //     ));
              }),

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
            title: const Text('Log out',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),





          // Populate the Drawer in the next step.
        ]),
      ),

      body:
      GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedservices.length,

        itemBuilder: (context, index) => ServiceItem(
          loadedservices[index].id,
          loadedservices[index].title,
          loadedservices[index].imageUrl,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
