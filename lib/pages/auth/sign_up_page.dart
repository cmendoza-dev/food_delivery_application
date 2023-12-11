import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/base/show_custom_snackbar.dart';
import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/app_text_field.dart';
import 'package:food_delivery_application/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
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
        physics: const BouncingScrollPhysics(),
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
            // your name
            AppTextField(
                textController: nameController,
                hintText: "Name",
                icon: Icons.person),

            SizedBox(
              height: Dimensions.height20,
            ),
            
            // your email
            AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(
              height: Dimensions.height20,
            ),
            // your password
            AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp, isObscure: true,),
            SizedBox(
              height: Dimensions.height20,
            ),
            // your phone
            AppTextField(
                textController: phoneController,
                hintText: "Phone",
                icon: Icons.phone_android),

            SizedBox(
              height: Dimensions.height20 + Dimensions.height20,
            ),
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor),
                child: Center(
                    child: BigText(
                  text: "Sign Up",
                  size: Dimensions.font20,
                  color: Colors.white,
                )),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account already?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              ),
            ),

            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            RichText(
              text: TextSpan(
                text: "Sign up using one of the following methods",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ),

            Wrap(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: Dimensions.radius30,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/image/${signUpImages[index]}"),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
