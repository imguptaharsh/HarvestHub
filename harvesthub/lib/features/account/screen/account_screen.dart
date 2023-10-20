import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/orders.dart';
import '../widgets/top_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.mainColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          // elevation: 15,s
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  // padding: EdgeInsets.only(right: 100),
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/images/hhlogo.png',
                    // fit: BoxFit.fitHeight,
                    width: 120,
                    height: 150,
                    // color: Colors.black,
                  )),
              const Text(
                "HarvestHub",
                style: TextStyle(
                    fontSize: 24,
                    color: GlobalVariables.selectedNavBarColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Container(
          //     padding: const EdgeInsets.only(left: 15, right: 15),
          //     child: Row(
          //       children: const [
          //         Padding(
          //           padding: EdgeInsets.only(right: 15),
          //           child: Icon(Icons.notifications_outlined),
          //         ),
          //         Icon(Icons.search),
          //       ],
          //     ))
        ),
      ),
      body: Container(
        color: GlobalVariables.mainColor,
        child: Column(
          children: const [
            BelowAppBar(),
            // Profile(),
            SizedBox(height: 10),
            TopButtons(),
            SizedBox(height: 20),
            Orders(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
}
