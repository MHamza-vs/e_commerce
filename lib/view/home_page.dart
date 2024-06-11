import 'package:e_commerce/controllers/home_controller.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/widget/home_widgets/home_page_top_row.dart';
import 'package:e_commerce/widget/home_widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

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
                    const SizedBox(height: 18),
                    Obx(() {
                      if (controller.bannerImages.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return SizedBox(
                        width: 200,
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.bannerImages.length,
                          itemBuilder: (context, index) {
                            final banner = controller.bannerImages[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.network(banner.image),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Categories",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See all",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Obx(
              () => controller.categories.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsetsDirectional.only(start: 10),
                        itemCount: controller.categories.length,
                        itemBuilder: (_, index) {
                          final category = controller.categories[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Text(category.name ?? 'No Name'),
                            ),
                          );
                        },
                      ),
                    ),
            )),
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