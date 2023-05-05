import 'package:e_com/farm/lib/soil.dart';
import 'package:e_com/features/account/widgets/account_button.dart';
import 'package:e_com/features/cart/screen/cart_screen.dart.dart';
import 'package:e_com/features/corbon/corbon.dart';
// import 'package:e_com/features/corbon/newtemp.dart';
import 'package:flutter/material.dart';

import '../../../farm/lib/tips.dart';
import '../services/account_services.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  void navigateToCorbon(String query) {
    // Navigator.pushNamed(context, .routeName, arguments:
    // query);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
                text: 'Tips',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => Tips()),
                  );
                }),
            AccountButton(
                text: 'Soilpedia',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const SoilList(),
                    ),
                  );
                }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
                text: 'Log Out ',
                onTap: () => AccountServices().logOut(context)),
            AccountButton(
                text: 'Checkout Cart',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const CartScreen(),
                    ),
                  );
                }),
          ],
        ),
      ],
    );
  }
}
