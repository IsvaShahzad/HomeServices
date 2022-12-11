
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 804),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(




          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            primarySwatch: Colors.orange,
            accentColor: Colors.pink,
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFFFA500)),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFFFA500)),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          //theme: new ThemeData(scaffoldBackgroundColor: const Color()),

          home:SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}


