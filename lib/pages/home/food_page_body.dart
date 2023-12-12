import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/app_column.dart';
import 'package:food_delivery_application/widgets/big_text.dart';
import 'package:food_delivery_application/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_application/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  var _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  final List<FoodItem> foodItems = [
    FoodItem(
      name: 'Ceviche',
      category: 'Es un plato consistente en carne marinada pescado, mariscos o ambos en aliños cítricos, reconocido por la Unesco como expresión de la cocina tradicional peruana y patrimonio cultural inmaterial de la humanidad.​​​',
      imagePath: 'assets/image/ceviche.jpg',
    ),
    FoodItem(
      name: 'Lomo Saltado',
      category: '',
      imagePath: 'assets/image/lomo-saltado.jpg',
    ),
    FoodItem(
      name: 'Ají de Gallina',
      category: '',
      imagePath: 'assets/image/aji-de-gallina.jpg',
    ),
    FoodItem(
      name: 'Causa Limeña',
      category: '',
      imagePath: 'assets/image/causa-limena.jpg',
    ),
    FoodItem(
      name: 'Pachamanca',
      category: '',
      imagePath: 'assets/image/pachamanca.jpg',
    ),
    FoodItem(
      name: 'Arroz con Pollo',
      category: '',
      imagePath: 'assets/image/arroz-con-pollo.jpg',
    ),
  ];

  final List<FoodItem> recommendedItems = [
    FoodItem(
      name: 'Tallarines a la Huancaína',
      category:
          'Derivado de la papa a la huancaína, este plato es considerado como uno de los más ricos. A simple vista es un plato sencillo, ya que consiste en pasta bañada de salsa a la huancaína, la cual es preparada con queso fresco y ají amarillo, pero es justamente en el agregado de esta salsa lo que hace que la pasta o cualquier tallarín que se utilice adquiera un sabor interesante.',
      imagePath: 'assets/image/tallarines-a-la-huancaina.jpg',
    ),
    FoodItem(
      name: 'Aguadito',
      category:
          'A la lista se suma un plato que es querido por muchos, el Aguadito. El cual consiste en una sopa de pollo espesa con arroz y otros vegetales. De una coloración verde debida al uso significativo de culantro en la sopa, es consumido tradicionalmente en invierno.',
      imagePath: 'assets/image/aguadito.jpg',
    ),
    FoodItem(
      name: 'Tacu Tacu',
      category:
          'Nuestra lista no podía estar completa sin mencionar al Tacu Tacu, plato criollo que consiste en arroz cocido, menestras y sofrito a base de ají amarillo. Los cuales se mezclan hasta obtener una masa bajo el calor de la sartén.',
      imagePath: 'assets/image/tacu-tacu.jpg',
    ),
    FoodItem(
      name: 'Suspiro limeño',
      category:
          'Tiene su origen en la capital de Perú. Se trata de una crema que se llama manjar blanco y lleva esencia de vainilla. Al final, se coloca un merengue encima, que suele ser decorado con un poco de canela.',
      imagePath: 'assets/image/suspiro-limeno.jpg',
    ),
    FoodItem(
      name: 'Anticuchos',
      category:
          'Son tan tradicionales que eran preparados por los incas. Se trata del corazón de res cortado en trozos y sazonado con diferentes ingredientes, como ajo, comino, jugo de limón, cebollas o vinagre.',
      imagePath: 'assets/image/anticuchos.jpg',
    ),
    FoodItem(
      name: 'Pollo a la Brasa',
      category:
          'Es un plato que consiste en pollo asado al carbón a través de un sistema rotatorio que permite una cocción uniforme. Es acompañado de papas fritas y actualmente es un ícono cultural peruano.',
      imagePath: 'assets/image/pollo-a-la-brasa.jpg',
    ),
    FoodItem(
      name: 'Arroz chaufa',
      category:
          'Uno de los platos más conocidos de la cocina chifa, es decir, de la fusión entre la cocina china.',
      imagePath: 'assets/image/arroz-chaufa.jpg',
    ),
    FoodItem(
      name: 'Chupe de Camarones',
      category:
          'Un chupe de camarones para chuparte los dedos. Esta frase calza perfectamente con el sabor y la sazón de este plato. Representa al Perú y a la ciudad de Arequipa. Entre los ingredientes tenemos: camarones, arroz, arvejas, ají panca, huevo, queso fresco, leche evaporada, cebolla, orégano y especias.',
      imagePath: 'assets/image/chupe-de-camarones.jpg',
    ),
    FoodItem(
      name: 'Carapulcra Con Sopa Seca',
      category:
          'Su sazón original es de Chincha y es un plato que viene cautivando el mercado extranjero por su exótica combinación.',
      imagePath: 'assets/image/carapulcra.jpg',
    ),
    FoodItem(
      name: 'Chicharrón de Chanco',
      category: 'Este viene acompañado de camote frito y salsa criolla.',
      imagePath: 'assets/image/chicarron-de-chancho.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  void _navigateToDetails(List<FoodItem> items, double currentPage) {
    int index = currentPage.round();
    if (index >= 0 && index < items.length) {
      FoodItem selectedFood = items[index];
      Get.toNamed(
        RouteHelper.getPopularFood(),
        arguments: {
          'nombre': selectedFood.name,
          'imagen': selectedFood.imagePath,
          'descripcion': selectedFood.category,
        },
      );
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: GestureDetector(
            onTap: () {
              //Get.toNamed(RouteHelper.getPopularFood());
              _navigateToDetails(foodItems, _currPageValue);
            },
            child: PageView.builder(
                controller: pageController,
                itemCount: foodItems.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                }),
          ),
        ),

        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: foodItems.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          );
        }),

        //Popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recomendado"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Maridaje de comidas",
                ),
              ),
            ],
          ),
        ),
        //list of food and images

        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recommendedItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getRecomendedFood());
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height20),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(recommendedItems[index].imagePath),
                        ),
                      ),
                    ),
                    //text container
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: recommendedItems[index].name),
                              SizedBox(height: Dimensions.height10),
                              SmallText(text: recommendedItems[index].category),
                              SizedBox(height: Dimensions.height10),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor1,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7km",
                                    iconColor: AppColors.mainColor,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294c),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(foodItems[index].imagePath),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.height15,
                  right: Dimensions.height15,
                ),
                child: AppColumn(
                  text: foodItems[index].name,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String category;
  final String imagePath;

  FoodItem({
    required this.name,
    required this.category,
    required this.imagePath,
  });
}
