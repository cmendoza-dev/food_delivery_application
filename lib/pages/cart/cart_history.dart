import 'package:flutter/material.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/app_icon.dart';
import 'package:food_delivery_application/widgets/big_text.dart';
import 'package:food_delivery_application/widgets/small_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Información estática
    List<String> dates = ["12/12/2023", "11/12/2023", "11/12/2023"];
    List<int> itemsPerOrder = [3, 2, 1]; // Cantidad de elementos por pedido
    List<List<String>> imagePaths = [
      ['assets/image/ceviche.jpg', 'assets/image/pollo-a-la-brasa.jpg', 'assets/image/anticuchos.jpg'],
      ['assets/image/tacu-tacu.jpg', 'assets/image/tallarines-a-la-huancaina.jpg'],
      ['assets/image/suspiro-limeno.jpg']
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blue,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Tu Carrito", color: Colors.white),
                const AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 500,
              margin: EdgeInsets.symmetric(horizontal: 16.0), // Ajusta el padding horizontal según sea necesario
              child: ListView.builder(
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: Dimensions.height20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: dates[index]),
                        SizedBox(height: Dimensions.height10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < itemsPerOrder[index]; i++)
                              Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.only(right: Dimensions.width10 / 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius15 / 2),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(imagePaths[index][i]),
                                  ),
                                ),
                              ),
                            Container(
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SmallText(text: "Total", color: Colors.black),
                                  BigText(text: itemsPerOrder[index].toString() + " comida(s)", color: Colors.black),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width10,
                                      vertical: Dimensions.height10 / 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius15 / 3),
                                      border: Border.all(width: 1, color: Colors.blue),
                                    ),
                                    child: SmallText(text: "uno más", color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
