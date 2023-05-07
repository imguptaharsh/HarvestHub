import 'package:flutter/material.dart';

import '../../constants/global_variable.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          // foregroundColor: Color.fromARGB(255, 24, 181, 29),
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        // style: ElevatedButton.styleFrom(
        //   minimumSize: const Size(double.infinity, 50),
        //   backgroundColor: color,
        // ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
