import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text("No items in the cart"));
        }

        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (_, index) {
            final product = cartController.cartItems[index];
            return ListTile(
              leading: Image.network(product.image ?? 'https://via.placeholder.com/150'),
              title: Text(product.title ?? 'No Title'),
              subtitle: Text("\$${product.price?.toStringAsFixed(2) ?? 'N/A'}"),
              trailing: IconButton(
                icon: const Icon(Icons.remove_shopping_cart),
                onPressed: () {
                  cartController.removeFromCart(product);
                },
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: \$${cartController.totalPrice.toStringAsFixed(2)}"),
                ElevatedButton(
                  onPressed: () {
                    // Add checkout functionality here
                  },
                  child: const Text("Checkout"),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}