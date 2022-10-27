import 'package:flutter/material.dart';
import 'package:food_store/pref/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      String route =
      SharedPrefController().getByKey<bool>(key: PrefKey.loggedIn.name) ?? false
          ? '/bottom_navigation_bar'
          : '/onboarding_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('images/pexels-pixabay-327158.png'),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('images/Rectangle 449.png'),
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Image(
              image: AssetImage('images/Group 1159.png'),
            ),
          ),
        ],
      ),
    );
  }
}
