import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/view/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product,
                  
                )),
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 224, 224, 224),
            ),
            child: Image.network(
               'https://via.placeholder.com/150',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.title ?? 'No Title'),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate,
                        size: 14,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 3),
                      Text("${product.rating ?? 0.0}")
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                "\$${product.price?.toStringAsFixed(2) ?? 'N/A'}",
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}