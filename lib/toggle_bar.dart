import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class toggle extends StatefulWidget {
  @override
  State<toggle> createState() => _toggleState();
}

class _toggleState extends State<toggle> {
  bool _isObscure = true;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  List<String> labels = ['Sign up\n as User', 'Sign up as\n Service Provider'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 90.h,
          ),
          ToggleSwitch(
            minWidth: 150.0,
            minHeight: 50.0,
            activeBgColor: [Colors.orange],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.grey[900],
            initialLabelIndex: 0,
            totalSwitches: 2,
            labels: ['Sign up\n as User', 'Sign up\n as Service Provider'],
            onToggle: (index) {},
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text('First Name',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        hintText: 'Enter Your First name',
                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 3, color: Colors.orange),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
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

                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Last Name',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        hintText: 'Enter Your Last name',
                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                          BorderSide(width: 3, color: Colors.orange),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
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



                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('Email',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                          BorderSide(width: 3, color: Colors.orange),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  const Text('Password',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: ' Enter Password',
                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w600),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Some Text ';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Mobile Number',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,

                      controller: emailController,

                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        hintText: 'Enter Your Mobile number',

                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                          BorderSide(width: 3, color: Colors.orange),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
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


                ],
              ),

            ),



          )

        ])));
  }
}
