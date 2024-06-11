import 'package:e_commerce/controllers/home_controller.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/widget/home_widgets/home_page_top_row.dart';
import 'package:e_commerce/widget/home_widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<HomeController> {
  const SearchPage({super.key});

  @override
  Widget build(context) {
    Get.put(HomeController());
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const HomePageFirstRow(),
                    const SizedBox(height: 18),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Search",
                          suffixIcon: const Icon(Icons.search),
                          fillColor: const Color(0xFFF2F2F2),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 18),
            ),
            Obx(
              () => SliverPadding(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0, childAspectRatio: 0.9),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final product = productController.products[index];
                      return ProductContainer(product: product);
                    },
                    childCount: productController.products.length,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}