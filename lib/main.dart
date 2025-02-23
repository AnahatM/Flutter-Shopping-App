import 'package:flutter/material.dart';
import 'package:minimalist_ecommerce/models/shop.dart';
import 'package:minimalist_ecommerce/pages/cart_page.dart';
import 'package:minimalist_ecommerce/pages/intro_page.dart';
import 'package:minimalist_ecommerce/pages/settings_page.dart';
import 'package:minimalist_ecommerce/pages/shop_page.dart';
import 'package:minimalist_ecommerce/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/settings_page': (context) => const SettingsPage(),
      },
    );
  }
}
