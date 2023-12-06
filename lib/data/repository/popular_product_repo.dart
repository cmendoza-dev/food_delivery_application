import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    try {
      final response =
          await apiClient.getData("/api/products/popular");

      print("Respuesta completa del servidor: ${response.toString()}");

      if (response.statusCode == 200) {
        return response;
      } else {
        print(
            "Error en getPopularProductList: Código de estado ${response.statusCode}");
        return Response(
            statusCode: response.statusCode,
            statusText: 'Error en la solicitud');
      }
    } catch (e) {
      print("Error en getPopularProductList: $e");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
