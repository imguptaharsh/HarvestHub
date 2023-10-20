import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AccountButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: const [
            // ignore: prefer_const_constructors
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 87, 149, 105),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
