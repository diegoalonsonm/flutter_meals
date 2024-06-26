import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon, 
          size: 18, 
          color: Colors.white
        ),
        const SizedBox(width: 6),
        Text(
          text, 
          style: const TextStyle(color: Colors.white)
        ),
      ]
    );
  }
}
