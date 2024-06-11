import 'package:e_commerce/view/home_page.dart';
import 'package:e_commerce/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkeletonController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> widgetOptions = const <Widget>[
    HomePage(),
    SearchPage(),
    Text('Favorite Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void onItemTapped(int index) {
    selectedIndex(index);
  }
}