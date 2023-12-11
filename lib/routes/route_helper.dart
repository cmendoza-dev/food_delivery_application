import 'package:food_delivery_application/pages/auth/sign_in_page.dart';
import 'package:food_delivery_application/pages/food/popular_food_detail.dart';
import 'package:food_delivery_application/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_application/pages/home/home_page.dart';
import 'package:food_delivery_application/pages/home/main_food_page.dart';
import 'package:food_delivery_application/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial="/";
   static const String signIn="/signin";
  static const String popularFood = '/popular-food';
  static const String recomendedFood = '/recomended-food';
  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood() => '$popularFood';
  static String getRecomendedFood() => '$recomendedFood';
  static String getSignInPage() => '$signIn';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: ()=> SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: signIn, page: () => SignInPage(), transition: Transition.fadeIn ),
    GetPage(
        name: popularFood,
        page: () {
          return PopularFoodDetail();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recomendedFood,
        page: () {
          return RecommendedFoodDetail();
        },
        transition: Transition.fadeIn),
  ];
}
