import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async{
    await Get.find<PopularProductController>().getPopularProductList();
    // Get.find<PopularProductController>().getPopularProductList();
    }

  @override
  void initState(){

    /*
      AnyClass(){
        newObject(){
          return ...;
        }
      }

      var x = AnyClass()
      x = x.newObject()
     */

    super.initState();
    _loadResource();
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 2)
    )..forward();
    
    animation = CurvedAnimation(
      parent: controller, 
      curve: Curves.linear
    );

    Timer(const Duration(seconds: 3), ()=> Get.offNamed(RouteHelper.initial));
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(child: Image.asset("assets/image/food-logo.png", width: Dimensions.splashImg)))
        ],
      ),
    );
  }
}