import 'package:flutter/material.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/app_column.dart';
import 'package:food_delivery_application/widgets/app_icon.dart';
import 'package:food_delivery_application/widgets/big_text.dart';
import 'package:food_delivery_application/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final Map<String, dynamic>? data; // Usar ? para permitir nulos
  const PopularFoodDetail({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Después
    var nombre = data?["nombre"] ?? "Ceviche";
    var imagen = data?["imagen"] ?? 'assets/image/ceviche.jpg';
    var descripcion = data?["descripcion"] ??
        "Es un plato consistente en carne marinada pescado, mariscos o ambos en aliños cítricos, reconocido por la Unesco como expresión de la cocina tradicional peruana y patrimonio cultural inmaterial de la humanidad.";

    Get.find<PopularProductController>().initProduct();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //background image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.popularFoodImgSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imagen)),
                  ),
                )),
            //icon widgets
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getInitial());
                        },
                        child: const AppIcon(icon: Icons.arrow_back_ios)),
                    const AppIcon(icon: Icons.shopping_cart_outlined),
                  ],
                )),
            //introduction of food
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImgSize - 20,
                child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: nombre),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Información"),
                      SizedBox(height: Dimensions.height20),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(text: descripcion))),
                    ],
                  ),
                )),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: popularProduct.quantity.toString()),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getSignInPage());
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(
                      text: "\$10 | Add to card",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
