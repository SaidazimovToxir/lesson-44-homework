import 'package:flutter/material.dart';
import 'package:lesson44/views/pages/company_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomepageScreen(),
    );
  }
}
