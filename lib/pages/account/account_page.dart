import 'package:flutter/material.dart';
import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/account_widget.dart';
import 'package:food_delivery_application/widgets/app_icon.dart';
import 'package:food_delivery_application/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
            child: BigText(
          text: "Perfil",
          size: 24,
          color: Colors.white,
        )),
      ),
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(children: [
          //profile icon
          AppIcon(
            icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.height45 + Dimensions.height30,
            size: Dimensions.height15 * 10,
          ),
          SizedBox(
            width: Dimensions.height45,
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //name
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Manuel")
                      ),
                  SizedBox(
                    width: Dimensions.height30,
                  ),
                  //phone
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "+51 953154791")),
                  SizedBox(
                    width: Dimensions.height30,
                  ),
                  //email
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "cmendoza@tecsup.edu.com")),
                  SizedBox(
                    width: Dimensions.height20,
                  ),
                  //address
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Complete su dirección")),
                  SizedBox(
                    width: Dimensions.height20,
                  ),
                  //message
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Mensaje")),
                  SizedBox(
                    width: Dimensions.height20,
                  ),
                                    //Logout
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getSignInPage());
                    },
                    child: AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.logout,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Salir")),
                  ),
                  SizedBox(
                    width: Dimensions.height20,
                  ),


                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
