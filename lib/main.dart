
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/initialScreens/splash_screen.dart';
import 'provider/Services.dart';
import 'allServices/services_detail.dart';
import 'package:provider/provider.dart';
import 'provider/service_providerr.dart';

void main()
async
{
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
        return ChangeNotifierProvider(
          create: (context) => Service(),
          child: MaterialApp(

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
            routes: {

              ServiceDetail.routeName: (context) => ServiceDetail(),
            },
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}


