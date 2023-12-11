import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/data/repository/cart_repo.dart';
import 'package:food_delivery_application/data/repository/popular_product_repo.dart';
// import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_delivery_application/controllers/cart_controller.dart';


Future<void> init() async {
  
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://127.0.0.1:8000"));

  // Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));

  // Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}