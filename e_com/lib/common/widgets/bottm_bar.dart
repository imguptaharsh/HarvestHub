import 'package:e_com/features/account/screen/account_screen.dart';
import 'package:e_com/features/cart/screen/cart_screen.dart.dart';
import 'package:e_com/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../constants/global_variable.dart';
import 'package:badges/badges.dart' as badge;

import '../../features/home/screen/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  int _selectIndex = 0;
  // ignore: non_constant_identifier_names
  static final List<Widget> _Navsreens = <Widget>[
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final userCartlen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: GlobalVariables.mainColor,
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          // ignore: prefer_const_constructors
          GButton(
            icon: Icons.home,
            iconColor: Colors.black,
            text: ' Home',
            textColor: Colors.black,
          ),
          // GButton(
          //   icon: Icons.home,
          //   iconColor: Colors.white,
          //   text: 'Home',
          //   textColor: Colors.white,
          // ),
          const GButton(
            icon: Icons.person,
            iconColor: Colors.black,
            text: ' Account',
            textColor: Colors.black,
          ),
          const GButton(
            icon: Icons.shopping_cart,
            iconColor: Colors.black,
            text: ' Cart',
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textColor: Colors.black,
          ),
        ],
        selectedIndex: _selectIndex,
        onTabChange: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
      body: _Navsreens[_selectIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _page,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: GlobalVariables.unselectedNavBarColor,
      //   backgroundColor: GlobalVariables.backgroundColor,
      //   iconSize: 28,
      //   onTap: updatePage,
      //   items: [

      //     //Home
      //     // BottomNavigationBarItem(
      //     //   icon: Container(
      //     //     width: bottomBarwidth,
      //     //     decoration: BoxDecoration(
      //     //         border: Border(
      //     //             top: BorderSide(
      //     //       color: _page == 0
      //     //           ? const Color.fromARGB(255, 255, 226, 3)
      //     //           : GlobalVariables.backgroundColor,
      //     //       width: bottomBarBorderWidth,
      //     //     ))),
      //     //     child: const Icon(Icons.home),
      //     //   ),
      //     //   label: '',
      //     // ),
      //     //Account
      //     // BottomNavigationBarItem(
      //     //   icon: Container(
      //     //     width: bottomBarwidth,
      //     //     decoration: BoxDecoration(
      //     //         border: Border(
      //     //             top: BorderSide(
      //     //       color: _page == 1
      //     //           ? const Color.fromARGB(255, 255, 226, 3)
      //     //           : GlobalVariables.backgroundColor,
      //     //       width: bottomBarBorderWidth,
      //     //     ))),
      //     //     child: const Icon(
      //     //       Icons.person_outline_outlined,
      //     //     ),
      //     //   ),
      //     //   label: '',
      //     // ),
      //     //Cart
      //     // BottomNavigationBarItem(
      //     //   icon: Container(
      //     //     width: bottomBarwidth,
      //     //     decoration: BoxDecoration(
      //     //       border: Border(
      //     //         top: BorderSide(
      //     //           color: _page == 2
      //     //               ? Color.fromARGB(255, 255, 226, 3)
      //     //               : GlobalVariables.backgroundColor,
      //     //           width: bottomBarBorderWidth,
      //     //         ),
      //     //       ),
      //     //     ),
      //     //     child: badge.Badge(
      //     //       // ignore: prefer_const_constructors
      //     //       badgeStyle: badge.BadgeStyle(
      //     //         elevation: 0,
      //     //         badgeColor: Colors.white,
      //     //       ),
      //     //       badgeContent: Text(userCartlen.toString()),
      //     //       child: const Icon(
      //     //         Icons.shopping_cart_outlined,
      //     //       ),
      //     //     ),
      //     //   ),
      //     //   label: '',
      //     // ),
      //   ],
      // ),
    );
  }
}
