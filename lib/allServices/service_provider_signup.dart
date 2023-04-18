// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'services_overview_screen.dart';
//
// import '../initialScreens/loginScreen.dart';
//
// class ServiceProviderRegister extends StatefulWidget {
//   @override
//   State<ServiceProviderRegister> createState() =>
//       _ServiceProviderRegisterState();
// }
//
// class _ServiceProviderRegisterState extends State<ServiceProviderRegister> {
//
//
//
//   bool _isObscure = true;
//
//   final loginFormKey = GlobalKey<FormState>();
//
//
//   final TextEditingController firstNameController = TextEditingController();
//
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: SingleChildScrollView(
//
//             child: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         SizedBox(
//           height: 40.h,
//         ),
//         const Align(
//
//             alignment: Alignment.topLeft,
//
//             child: Text(
//
//               'Sign up as Service Provider ',
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Color(0xFFFFA500),
//                 fontWeight: FontWeight.bold,
//               ),
//             )),
//               SizedBox(
//                 height: 35.h,
//               ),
//
//               Text('First Name',
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Color(0xFF000000),
//                       fontWeight: FontWeight.bold)),
//
//               SizedBox(
//                 height: 10.h,
//               ),
//               Container(
//                 child: TextFormField(
//                   // keyboardType: TextInputType.emailAddress,
//                   controller: firstNameController,
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Color(0xFF000000),
//                     fontWeight: FontWeight.w600,
//                   ),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.1),
//                     hintText: 'Enter Your First name',
//                     hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       borderSide:
//                       BorderSide(width: 3, color: Colors.orange),
//                     ),
//                   ),
//                   validator: (value) {
//                     RegExp regex = RegExp(
//                         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Some Text ';
//                     } else if (value.length > 20) {
//                       return 'Enter less than 20 numbers';
//                     } else if (!regex.hasMatch(value)) {
//                       return 'Enter according to format';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(top: 15.0),
//                 child: Text('Last Name',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Color(0xFF000000),
//                         fontWeight: FontWeight.bold)),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//
//               Container(
//                 child: TextFormField(
//                   // keyboardType: TextInputType.emailAddress,
//                   controller: lastNameController,
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Color(0xFF000000),
//                     fontWeight: FontWeight.w600,
//                   ),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.1),
//                     hintText: 'Enter Your Last name',
//                     hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       borderSide:
//                       BorderSide(width: 3, color: Colors.orange),
//                     ),
//                   ),
//                   validator: (value) {
//                     RegExp regex = RegExp(
//                         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Some Text ';
//                     } else if (value.length > 20) {
//                       return 'Enter less than 20 numbers';
//                     } else if (!regex.hasMatch(value)) {
//                       return 'Enter according to format';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//
//
//
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Text('Email',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Color(0xFF000000),
//                         fontWeight: FontWeight.bold)),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//
//               Container(
//                 child: TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   controller: emailController,
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Color(0xFF000000),
//                     fontWeight: FontWeight.w600,
//                   ),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.1),
//                     hintText: 'Enter Email',
//                     hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       borderSide:
//                       BorderSide(width: 3, color: Colors.orange),
//                     ),
//                   ),
//                   validator: (value) {
//                     RegExp regex = RegExp(
//                         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Some Text ';
//                     } else if (value.length > 20) {
//                       return 'Enter less than 20 numbers';
//                     } else if (!regex.hasMatch(value)) {
//                       return 'Enter according to format';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//               ),
//               const Text('Password',
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Color(0xFF000000),
//                     fontWeight: FontWeight.bold,
//                   )),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 0),
//                 child: TextFormField(
//                   controller: passwordController,
//                   obscureText: _isObscure,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.1),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                     ),
//                     hintText: ' Enter Password',
//                     hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isObscure
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isObscure = !_isObscure;
//                         });
//                       },
//                     ),
//                   ),
//                   style: TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF000000),
//                       fontWeight: FontWeight.w600),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Some Text ';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(top: 15.0),
//                 child: Text('Mobile Number',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Color(0xFF000000),
//                         fontWeight: FontWeight.bold)),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//
//               Container(
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//
//                   controller: mobileController,
//
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Color(0xFF000000),
//                     fontWeight: FontWeight.w600,
//                   ),
//                   decoration: InputDecoration(
//
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.1),
//                     hintText: 'Enter Your Mobile number',
//
//                     hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       borderSide:
//                       BorderSide(width: 3, color: Colors.orange),
//                     ),
//                   ),
//                   validator: (value) {
//                     RegExp regex = RegExp(
//                         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Some Text ';
//                     } else if (value.length > 20) {
//                       return 'Enter less than 20 numbers';
//                     } else if (!regex.hasMatch(value)) {
//                       return 'Enter according to format';
//                     }
//                     return null;
//                   },
//                 ),
//
//
//               ),
//
//
//               SizedBox(
//                 height: 40.h,
//               ),
//
//
//               Align(
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 5),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Color(0xFFFFA500),
//                         onPrimary: Colors.white,
//                         elevation: 3,
//                         minimumSize: const Size(200, 50),
//                         maximumSize: const Size(200, 50),
//                         shape: StadiumBorder(),
//                       ),
//                       child: Text('Sign Up',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18)),
//                       onPressed: ()  async {
//                         // if (loginFormKey.currentState!.validate())
//
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder:
//                                     (BuildContext context) =>
//                                     ServicesOverviewScreen()));
//
//                       },
//                     ),
//                   ),
//
//
//               )]),
//     )));
//   }
// }
