// import 'package:flutter/material.dart';
// import 'package:custom_switch/custom_switch.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class toggleScreen extends StatefulWidget {
//
//   @override
//   State<toggleScreen> createState() => _toggleScreenState();
// }
//
// class _toggleScreenState extends State<toggleScreen> {
//
//    // status = User;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose who you want to sign up as!',
//         style: TextStyle(
//           color: Colors.white,
//         ),
//         ),
//       ),
//
//       body: Center(
//
//         child: Column(
//
//           children: <Widget>[
//             SizedBox(
//               height: 50.h,
//             ),
//             CustomSwitch(
//               activeColor: Colors.orange,
//               value: status,
//               onChanged: (value) {
//                 print("VALUE : $value");
//                 setState(() {
//                   status = value;
//                 });
//               },
//             ),
//             SizedBox(height: 12.0,),
//             Text('Value : $status', style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0
//             ),)
//           ],
//         ),
//       ),
//     );
//
//   }
// }
