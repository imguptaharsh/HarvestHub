import 'package:e_com/constants/global_variable.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: GlobalVariables.mainColor,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
