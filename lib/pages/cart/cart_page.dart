import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/big_text.dart';
import 'package:food_delivery_application/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  )
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height15),
                  //color: Colors.red,
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (_, index) {
                            return Container(
                              height: Dimensions.height20 * 5,
                              width: double.maxFinite,
                              child: Row(children: [
                                Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/image/tallarines-a-la-huancaina.jpg"),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Expanded(
                                    child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: "Tallarines a la Huancaína"),
                                      SmallText(text: "Spaghetti"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: "\$ 18.0",
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                left: Dimensions.width10,
                                                right: Dimensions.width10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // popularProduct.setQuantity(false);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10 / 2,
                                                ),
                                                BigText(
                                                    text:
                                                        "0"), //popularProduct.inCartItems.toString()),
                                                SizedBox(
                                                  width: Dimensions.width10 / 2,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    //popularProduct.setQuantity(true);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ]),
                            );
                          }))))
        ],
      ),
    );
  }
}
