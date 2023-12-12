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
    List<String> dates = ["09/12/2023", "08/12/2023", "07/12/2023"];
    List<int> itemsPerOrder = [3, 2, 1]; // Cantidad de elementos por pedido
    List<List<String>> imagePaths = [
      ['assets/image/food1.jpg', 'assets/image/food2.jpg', 'assets/image/food3.jpg'],
      ['assets/image/food4.jpg', 'assets/image/food5.jpg'],
      ['assets/image/food6.jpg']
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
                BigText(text: "Cart History", color: Colors.white),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.blue,
                  backgroundColor: Colors.yellow,
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
                                  BigText(text: itemsPerOrder[index].toString() + " Items", color: Colors.black),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width10,
                                      vertical: Dimensions.height10 / 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius15 / 3),
                                      border: Border.all(width: 1, color: Colors.blue),
                                    ),
                                    child: SmallText(text: "one more", color: Colors.blue),
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
