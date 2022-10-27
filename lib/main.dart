import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/database/db_controller.dart';
import 'package:food_store/screens/account_screen.dart';
import 'package:food_store/screens/add_new_address.dart';
import 'package:food_store/screens/auth/forgot_password_screen.dart';
import 'package:food_store/screens/auth/login_screen.dart';
import 'package:food_store/screens/auth/register_screen.dart';
import 'package:food_store/pref/shared_pref_controller.dart';
import 'package:food_store/screens/bottom_navigation_bar.dart';
import 'package:food_store/screens/cart_screen.dart';
import 'package:food_store/screens/category_screen.dart';
import 'package:food_store/screens/home_screen.dart';
import 'package:food_store/screens/my_address.dart';
import 'package:food_store/screens/onboarding_screen/onboarding_screen.dart';
import 'package:food_store/screens/payment_screen.dart';
import 'package:food_store/screens/setting_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/launch_screen.dart';
import 'screens/auth/activate_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData(color: Colors.black,size: 20),
              toolbarHeight: 81,
              backgroundColor: Colors.white,
              titleTextStyle: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              elevation: 0,
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/launch_screen',
          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/login_screen': (context) => const LoginScreen(),
            '/forgot_password_screen': (context) => const ForgotPassword(),
            '/register_screen': (context) => const RegisterScreen(),
            '/activate_screen': (context) => const ActivateScreen(),
            '/category_screen': (context) => const CategoryScreen(),
            '/bottom_navigation_bar': (context) =>
                const BottomNavigationScreen(),
            '/home_screen': (context) => const HomeScreen(),
            '/cart_screen': (context) => const CartScreen(),
            '/setting_screen': (context) => const SettingScreen(),
            '/account_screen': (context) => const AccountScreen(),
            '/add_new_address': (context) => const AddNewAddress(),
            '/payment_screen': (context) => const PaymentScreen(),
            '/my_address': (context) => const MyAddress(),
            '/onboarding_screen': (context) => const OnBoardingScreen(),

          },
        );
      },
    );
  }
}
