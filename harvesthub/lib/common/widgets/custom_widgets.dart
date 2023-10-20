import 'package:harvesthub/constants/global_variable.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  // final color;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.transparent,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius:
                  BorderRadius.circular(15), // Set border corner radius to 0
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius:
                  BorderRadius.circular(15), // Set border corner radius to 0
            ),
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter your $hintText';
            }
            return null;
          },
          maxLines: maxLines,
        ),
      ),
    );
  }
}
