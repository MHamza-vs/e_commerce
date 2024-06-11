import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/sliders.dart';

class FirebaseController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<SliderModel>> getBannerImage() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection("sliders").where("is_published", isEqualTo: true).get();

      List<SliderModel> banners = [];
      for (var docSnapshot in querySnapshot.docs) {
        banners.add(SliderModel.fromJson(docSnapshot.data() as Map<String, dynamic>));
      }
      return banners;
    } catch (e) {
      print("Error completing: $e");
      return [];
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection("categories").where("is_published", isEqualTo: true).get();

      List<CategoryModel> categories = [];
      for (var docSnapshot in querySnapshot.docs) {
        categories.add(CategoryModel.fromJson(docSnapshot.data() as Map<String, dynamic>));
      }
      return categories;
    } catch (e) {
      print("Error completing: $e");
      return [];
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection("products").get();

      List<ProductModel> products = [];
      for (var docSnapshot in querySnapshot.docs) {
        products.add(ProductModel.fromJson(docSnapshot.data() as Map<String, dynamic>));
      }
      return products;
    } catch (e) {
      print("Error completing: $e");
      return [];
    }
  }
}