import 'package:flutter/material.dart';
import 'package:minimalist_ecommerce/components/my_drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: Text("Shop Page"),
      ),
      drawer: MyDrawer(),
    );
  }
}
