import 'package:flutter/material.dart';
import 'package:minimalist_ecommerce/components/my_button.dart';
import 'package:minimalist_ecommerce/models/product.dart';
import 'package:minimalist_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove Item from Cart Button is Pressed
  void removeItemFromCart(BuildContext context, Product product) {
    // Dialog Confirmation to Remove Product from Cart
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove from Cart'),
          content: Text(
            'Would you like to remove ${product.productName} from your cart?',
          ),
          actions: [
            // Cancel Button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),

            // Confirm Button
            MaterialButton(
              onPressed: () {
                // Remove Item from Cart
                context.read<Shop>().removeFromCart(product);

                // Close Dialog
                Navigator.pop(context);

                // Show SnackBar Notification
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.productName} removed from cart.'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  // Pay Button is Pressed
  void payButtonPressed(BuildContext context) {
    // Check if Cart is Empty
    if (Provider.of<Shop>(context, listen: false).cart.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Empty Cart'),
            content: const Text(
              'Your cart is empty. Add products to your cart to make a purchase.',
            ),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Show Dialogue Confirmation to Pay for Cart
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Make Purchase'),
          content: Text(
            'Would you like to pay for your cart? The total price is \$${context.watch<Shop>().cart.fold(0.0, (total, product) => total + product.productPrice).toStringAsFixed(2)}. Connect this app to the payment backend for functional payment.',
          ),
          actions: [
            // Cancel Button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),

            // Confirm Button
            MaterialButton(
              onPressed: () {
                // Close Dialog
                Navigator.pop(context);

                // Show SnackBar Notification
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Payment Successful.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Pay'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access User Cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          const SizedBox(height: 25),

          // Cart List
          Expanded(
            child:
                cart.isEmpty
                    // If Cart is Empty, Show Empty Cart Message
                    ? Center(
                      child: Text(
                        "Your cart is empty.\n Browse the shop and add products.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    )
                    // If Cart is Not Empty, Show Cart Items
                    : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // Get Individual Item in Cart
                        final product = cart[index];

                        // Return as cart tile UI
                        return ListTile(
                          title: Text(product.productName),
                          subtitle: Text(
                            product.productPrice.toStringAsFixed(2),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed:
                                () => removeItemFromCart(context, product),
                          ),
                        );
                      },
                    ),
          ),

          // Pay Button at the bottom
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("PAY NOW"),
            ),
          ),
        ],
      ),
    );
  }
}
