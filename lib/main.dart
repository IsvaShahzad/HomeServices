import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/Detail_Screens/Baking_DetailScreen/Pizza_Detail.dart';
import 'package:home_services_flutter/initialScreens/splash_screen.dart';
import 'package:home_services_flutter/seller/seller_checkout/seller_cartscreen.dart';
import 'package:home_services_flutter/subcategories_addedproducts/Baking_addedproducts/pizza_screen.dart';
import 'Consumer_Screens/add_requirements_consumer.dart';
import 'Consumer_Screens/favourites.dart';
import 'Detail_Screens/Packages_DetailScreen/box_detailscreen.dart';
import 'provider/Services.dart';
import 'allServices/services_detail.dart';
import 'package:provider/provider.dart';
import 'provider/service_providerr.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:home_services_flutter/Consumer_Screens/Consumer_mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavouriteProductPageProvider>(
          create: (_) => FavouriteProductPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        // Add other providers here if needed
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 804),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
              primarySwatch: Colors.purple,
              accentColor: Colors.pink,
              inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFAB47BC)),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFAB47BC)),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
