import 'package:flutter/material.dart';
import 'package:minimalist_ecommerce/pages/cart_page.dart';
import 'package:minimalist_ecommerce/pages/intro_page.dart';
import 'package:minimalist_ecommerce/pages/shop_page.dart';
import 'package:minimalist_ecommerce/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightTheme,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
