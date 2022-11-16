
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:home_services_flutter/ResetScreen.dart';
import 'package:home_services_flutter/loginScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}


class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // LoginScreen({required Key key}) : super(key: key);
  bool _isObscure = true;
  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      Form(
          key: loginFormKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),

                          child: (
                              Container(
                                  width: 200,
                                  height: 150,



                                  child: Image.asset('assets/images/homeservicespic.PNG'))
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,

                            child: Text(
                              'Home Services Forgot Password',
                              style:
                              TextStyle(fontSize: 33, color: Color(0xFFFFA500),fontWeight: FontWeight.bold,),
                            )),

                        SizedBox(
                          height: 43.h,
                        ),


                        Container(

                            height: 200,

                            decoration: BoxDecoration(

                                border: Border.all(
                                  color: Color(0xFFFF8c00),
                                  width: 1.5,

                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))

                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),


                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.only(top:20.0),
                                        child: Text('Email',
                                            style:
                                            TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold,)

                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),



                                      Container(


                                        child: TextFormField(
                                          controller: emailController,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color:Color(0xFF000000),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey.withOpacity(0.1),
                                            hintText: 'Enter Email',
                                            hintStyle: TextStyle(fontSize: 13, color:Colors.grey),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              borderSide:
                                              BorderSide(width: 3, color: Colors.grey),
                                            ),
                                            contentPadding:
                                            EdgeInsets.fromLTRB(8.0, 10.0, 5.0, 10.0),
                                          ),
                                          validator: (value) {
                                            RegExp regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                            if (value == null || value.isEmpty) {
                                              return 'Please Enter Some Text ';
                                            } else if (value.length > 20) {
                                              return 'Enter less than 20 numbers';
                                            } else if (!regex.hasMatch(value)) {
                                              return 'Enter according to format';
                                            }
                                            return null;
                                          },


                                        ),
                                      ),

                                      SizedBox(
                                        height: 30.h,
                                      ),

                                      Align(
                                        alignment: Alignment.center,

                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFFFA500),
                                              onPrimary: Colors.white,
                                              elevation: 3,

                                              minimumSize: const Size(200, 50),
                                              maximumSize: const Size(200, 50),
                                              shape: StadiumBorder(),
                                            ),
                                            child:
                                            Text('Send Link',
                                                style:
                                                TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                                            ),

                                            onPressed: () {
                                              if (loginFormKey.currentState!.validate())
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => ResetScreen()));


                                            },
                                          ),
                                        ),

                                      )],)),



                            ) )])))),
    );
  }
}
