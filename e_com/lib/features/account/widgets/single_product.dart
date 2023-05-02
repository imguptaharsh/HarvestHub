import 'package:e_com/constants/global_variable.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: GlobalVariables.mainColor,
        ),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
