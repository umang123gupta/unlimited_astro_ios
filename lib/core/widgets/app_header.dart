import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;

  const AppHeader({super.key, required this.title});
  static const bgHeaderColor = Color(0xFFEEE8E0);


  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.fromLTRB(20,30,0,5),
      // color: Colors.white,
      decoration: BoxDecoration(
        color: bgHeaderColor,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            // decoration: BoxDecoration(
            //   color: Colors.orange,
            //   borderRadius: BorderRadius.circular(8),
            // ),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
