import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/view/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageFirstRow extends StatelessWidget {
  const HomePageFirstRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Discovery",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CartPage()),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1, color: Colors.grey)),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),
              Obx(
                () => CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.green,
                  child: Text(
                    cartController.cartItems.length.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),
              ),
               Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1, color: Colors.grey)),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}