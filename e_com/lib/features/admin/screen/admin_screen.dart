import 'package:e_com/features/admin/screen/analtyics_screen.dart';
import 'package:e_com/features/admin/screen/order_screen.dart';
import 'package:e_com/features/admin/screen/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../constants/global_variable.dart';
import '../../account/services/account_services.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  int _selectIndex = 0;
  // ignore: non_constant_identifier_names
  static final List<Widget> _Navsreens = <Widget>[
    const PostsScreen(),
    const AnalyticsScreen(),
    const OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.mainColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          elevation: 3,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/hhlogo.png',
                    // fit: BoxFit.fitHeight,
                    width: 100,
                    height: 130,
                    // color: Colors.black,
                  )),
              // const Text("ReWear",
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold, color: Colors.black)),
              GestureDetector(
                onTap: () => AccountServices().logOut(context),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: const [
                        Text("Admin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.logout_outlined),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      // body: pages[_page],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _page,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: GlobalVariables.unselectedNavBarColor,
      //   backgroundColor: GlobalVariables.backgroundColor,
      //   iconSize: 28,
      //   onTap: updatePage,
      //   items: [
      //     //Post
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         width: bottomBarwidth,
      //         decoration: BoxDecoration(
      //             border: Border(
      //                 top: BorderSide(
      //           color: _page == 0
      //               ? GlobalVariables.selectedNavBarColor
      //               : GlobalVariables.backgroundColor,
      //           width: bottomBarBorderWidth,
      //         ))),
      //         child: const Icon(Icons.home),
      //       ),
      //       label: '',
      //     ),
      //     //Analytics
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         width: bottomBarwidth,
      //         decoration: BoxDecoration(
      //             border: Border(
      //                 top: BorderSide(
      //           color: _page == 1
      //               ? GlobalVariables.selectedNavBarColor
      //               : GlobalVariables.backgroundColor,
      //           width: bottomBarBorderWidth,
      //         ))),
      //         child: const Icon(
      //           Icons.analytics_outlined,
      //         ),
      //       ),
      //       label: '',
      //     ),
      //     //Order
      //     BottomNavigationBarItem(
      //       icon: Container(
      //           width: bottomBarwidth,
      //           decoration: BoxDecoration(
      //             border: Border(
      //               top: BorderSide(
      //                 color: _page == 2
      //                     ? GlobalVariables.selectedNavBarColor
      //                     : GlobalVariables.backgroundColor,
      //                 width: bottomBarBorderWidth,
      //               ),
      //             ),
      //           ),
      //           child: const Icon(
      //             Icons.all_inbox_outlined,
      //           )),
      //       label: '',
      //     ),
      //   ],
      // ),
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
            icon: Icons.analytics_outlined,
            iconColor: Colors.black,
            text: ' Analytics',
            textColor: Colors.black,
          ),
          const GButton(
            icon: Icons.all_inbox_outlined,
            iconColor: Colors.black,
            text: ' Orders',
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
    );
  }
}
