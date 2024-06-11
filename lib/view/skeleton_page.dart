import 'package:e_commerce/controllers/skeleton_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skeleton extends GetView<SkeletonController> {
  const Skeleton({super.key});

  @override
  Widget build(context) {
    Get.put(SkeletonController());

    return Scaffold(bottomNavigationBar: Obx(() {
      return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 80, 80, 80),
        showUnselectedLabels: true,
        onTap: controller.onItemTapped,
      );
    }), body: Obx(() {
      return Center(
        child: controller.widgetOptions.elementAt(controller.selectedIndex.value),
      );
    }));
  }
}