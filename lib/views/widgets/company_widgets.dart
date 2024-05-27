import 'package:flutter/material.dart';

class CompanyWidgets extends StatelessWidget {
  final String name;
  final String title;
  const CompanyWidgets({required this.name, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ],
    );
  }
}
