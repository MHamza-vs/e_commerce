import 'package:e_commerce/models/product.dart';
import 'package:get/get.dart';
import 'firebase_controller.dart';

class ProductController extends GetxController {
  final FirebaseController _firebaseController = FirebaseController();
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    var fetchedProducts = await _firebaseController.getProducts();
    products.value = fetchedProducts;
  }
}