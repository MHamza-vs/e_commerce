import 'package:e_commerce/controllers/skeleton_controller.dart';
import 'package:get/get.dart';

class SkeletonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SkeletonController());
    Get.put(SkeletonController());
  }
}