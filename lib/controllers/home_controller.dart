import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/controllers/firebase_controller.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/models/sliders.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString bannerImage = "".obs;
  final FirebaseController _firebaseController = FirebaseController();
  final RxList<SliderModel> _bannerImages = <SliderModel>[].obs;
  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;

  List<SliderModel> get bannerImages => _bannerImages;
  List<CategoryModel> get categories => _categories;

  final String tempImage =
      "https://firebasestorage.googleapis.com/v0/b/e-commerce-ba023.appspot.com/o/apple-15-Pro-black.png?alt=media&token=9ab99e4d-a9f3-4b78-8c19-f619e2752052";

  Future<void> fetchBannerImages() async {
    List<SliderModel> images = await _firebaseController.getBannerImage();
    _bannerImages(images);
  }

  Future<void> fetchCategories() async {
    List<CategoryModel> fetchedCategories = await _firebaseController.getCategories();
    _categories(fetchedCategories);
  }

  @override
  void onInit() {
    Get.put(ProductController());
    Get.put(CartController());

    fetchCategories();
    fetchBannerImages();
    super.onInit();
  }
}