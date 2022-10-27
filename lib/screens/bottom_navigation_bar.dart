import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/screens/cart_screen.dart';
import 'package:food_store/screens/favorite_screen.dart';
import 'package:food_store/screens/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'account_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _navScreens = <Widget>[
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navScreens.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
          child: GNav(
            selectedIndex: _selectedIndex,
            rippleColor: Colors.white,
            // tab button ripple color when pressed
            hoverColor: Colors.white,
            // tab button hover color// tab button hover color
            haptic: true,
            // haptic feedback
            tabBorderRadius: 15.r,
            curve: Curves.easeOutExpo,
            // tab animation curves
            duration: const Duration(milliseconds: 900),
            // tab animation duration
            gap: 8.w,

            onTabChange: (index) {
              _selectedIndex = index;
              setState(() {});
            },

            // the tab button gap between icon and text
            color: const Color(0xff03A7A9),
            // unselected icon color
            activeColor: const Color(0xff03A7A9),
            // selected icon and text color
            iconSize: 24.r,
            // tab button icon size
            tabBackgroundColor: const Color(0xff03A7A9).withOpacity(0.1),
            // selected tab background color
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, bottom: 20.h, top: 20.h),
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // navigation bar padding
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.addToShoppingCart,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorite',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
