// import 'package:flutter/material.dart';
//
// import '../initialScreens/loginScreen.dart';
// import '../allServices/services_overview_screen.dart';
// import '../provider/service_providerr.dart';
// import 'package:provider/provider.dart';
//
// class ServiceDetail extends StatelessWidget {
//   // final String title;
//   // final double price;
//   //
//   // ServiceDetail(this.title, this.price);
//
//   static const routeName = "/service-detail";
//
//   @override
//   Widget build(BuildContext context) {
//     final serviceId = ModalRoute.of(context)?.settings.arguments as String;
//     final loadedService =
//         Provider.of<Service>(context, listen: false).findById(serviceId);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(loadedService.title,),
//         ),
//         body: SingleChildScrollView(
//             child: Column(children: <Widget>[
//           Container(
//             child: (loadedService.tile),
//           ),
//
//           // ListView.builder(
//           //   shrinkWrap: true,
//           //   physics: NeverScrollableScrollPhysics(),
//           //   itemCount: 1,
//           //   itemBuilder: (_, index) => Column(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     children: [
//           //       ListTile(
//           //           title: Text(
//           //             'Chowmein',
//           //           ),
//           //           subtitle: Text("Chinese Cuisine "),
//           //           trailing: Container(
//           //             height: 80,
//           //             width: 80,
//           //             alignment: Alignment.center,
//           //             child: Image(
//           //                 image: AssetImage('assets/images/chowmein.png')),
//           //           ),
//           //           onTap: () {
//           //             Navigator.push(
//           //               context,
//           //               MaterialPageRoute(
//           //                   builder: (context) => ChowmeinScreen()),
//           //             );
//           //           }),
//           //       Row(
//           //         children: [
//           //           Padding(
//           //             padding: const EdgeInsets.symmetric(horizontal: 20),
//           //             child: Text("RS. 620.00"),
//           //           ),
//           //           Container(
//           //             width: 90,
//           //             decoration: BoxDecoration(
//           //                 borderRadius: BorderRadius.circular(20),
//           //                 color: Color(0xffeab676).withOpacity(0.5)),
//           //           )
//           //         ],
//           //       ),
//           //       Divider(),
//           //       ListTile(
//           //           title: Text(
//           //             'Biryaani',
//           //           ),
//           //           subtitle: Text("Steaming hot rice with kick of flavours "),
//           //           trailing: Container(
//           //             height: 80,
//           //             width: 80,
//           //             alignment: Alignment.center,
//           //             child: Image(
//           //                 image: AssetImage('assets/images/biryaani.png')),
//           //           ),
//           //           onTap: () {
//           //             Navigator.push(
//           //               context,
//           //               MaterialPageRoute(
//           //                   builder: (context) => BiryaaniScreen()),
//           //             );
//           //           }),
//           //       Row(
//           //         children: [
//           //           Padding(
//           //             padding: const EdgeInsets.symmetric(horizontal: 20),
//           //             child: Text("RS. 520.00"),
//           //           ),
//           //           Container(
//           //             width: 90,
//           //             decoration: BoxDecoration(
//           //                 borderRadius: BorderRadius.circular(20),
//           //                 color: Color(0xffeab676).withOpacity(0.5)),
//           //           )
//           //         ],
//           //       ),
//           //       Divider(),
//                 ListTile(
//                   title: Text(
//                     'Nihari',
//                   ),
//                   subtitle: Text("Traditional cuisine "),
//                   trailing: Container(
//                     height: 80,
//                     width: 80,
//                     alignment: Alignment.center,
//                     child: Image(image: AssetImage('assets/images/nihari.png')),
//                   ),
//
//
//                   // leading: IconButton(
//                   //   icon: Icon(service.isFavourite ? Icons.favorite : Icons.favorite_border),
//                   //   onPressed: () {
//                   //     service.toggleFavouriteStatus();
//                   //   },
//                   //   color: Theme.of(context).accentColor,
//                   // ),
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Text("RS. 720.00"),
//                     ),
//                     Container(
//                       width: 90,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Color(0xffeab676).withOpacity(0.5)),
//                     )
//                   ],
//
//                 ),
//                 Divider(),
//           //       ListTile(
//           //         title: Text(
//           //           'Chicken karahi',
//           //         ),
//           //         subtitle: Text("Yummy karahi with burst of flavours "),
//           //         trailing: Container(
//           //           height: 80,
//           //           width: 80,
//           //           alignment: Alignment.center,
//           //           child: Image(image: AssetImage('assets/images/karahi.png')),
//           //         ),
//           //       ),
//           //       Row(
//           //         children: [
//           //           Padding(
//           //             padding: const EdgeInsets.symmetric(horizontal: 20),
//           //             child: Text("RS. 820.00"),
//           //           ),
//           //           Container(
//           //             width: 90,
//           //             decoration: BoxDecoration(
//           //                 borderRadius: BorderRadius.circular(20),
//           //                 color: Color(0xffeab676).withOpacity(0.5)),
//           //           )
//           //         ],
//           //       ),
//           //       Divider(),
//           //       ListTile(
//           //         title: Text(
//           //           'Haleem',
//           //         ),
//           //         subtitle: Text("Meaty treat "),
//           //         trailing: Container(
//           //           height: 80,
//           //           width: 80,
//           //           alignment: Alignment.center,
//           //           child: Image(image: AssetImage('assets/images/haleem.png')),
//           //         ),
//           //       ),
//           //       Row(
//           //         children: [
//           //           Padding(
//           //             padding: const EdgeInsets.symmetric(horizontal: 20),
//           //             child: Text("RS. 450.00"),
//           //           ),
//           //           Container(
//           //             width: 90,
//           //             decoration: BoxDecoration(
//           //                 borderRadius: BorderRadius.circular(20),
//           //                 color: Color(0xffeab676).withOpacity(0.5)),
//           //           )
//           //         ],
//           //       ),
//           //       Divider(),
//           //     ],
//           //   ),
//           // ),
//         ])));
//   }
// }
