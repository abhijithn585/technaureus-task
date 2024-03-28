import 'package:flutter/material.dart';
import 'package:task/view/customer_screen/customers_screen.dart';
import 'package:task/view/product_screen/product_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomersScreen(),
    );
  }
}
