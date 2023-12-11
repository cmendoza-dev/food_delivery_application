import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/base/show_custom_snackbar.dart';
import 'package:food_delivery_application/pages/auth/sign_up_page.dart';
import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/app_text_field.dart';
import 'package:food_delivery_application/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

        void _login() {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
       
       if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        Get.toNamed(RouteHelper.getInitial());
        
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            // app logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: AssetImage("assets/image/sign-up-food.png"),
              ),
            ),
            //welcome
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hola",
                    style: TextStyle(
                        fontSize: Dimensions.font20*3 + Dimensions.font20/2,
                        fontWeight: FontWeight.bold),
                  ), 
                   Text(
                    "Iniciar sesión",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Colors.grey[500],

                        ),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            // your phone
            AppTextField(
                textController: emailController,
                hintText: "Correo electrónico",
                icon: Icons.email),
            SizedBox(
              height: Dimensions.height20,
            ),
            // your password
            AppTextField(
                textController: passwordController,
                hintText: "Contraseña",
                icon: Icons.password_sharp, isObscure: true,),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Iniciar sesión en su cuenta",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.width20,)
              ],
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //sign in
            GestureDetector(
              onTap: (){
                _login();
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor),
                child: Center(
                    child: BigText(
                  text: "Iniciar sesión",
                  size: Dimensions.font20,
                  color: Colors.white,
                )),
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            RichText(
              text: TextSpan(
                text: "¿No tienes una cuenta?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(()=> SignUpPage(), transition: Transition.fade),
                      text: " Crear una cuenta",
                      style: TextStyle(
                          color: AppColors.mainBlackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
