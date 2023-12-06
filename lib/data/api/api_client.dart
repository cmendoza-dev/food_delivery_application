import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  //late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    //token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-Type': 'application/json; charset=utf-8',
      //'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(
    String uri,
  ) async {
    try {
      print("URL de la solicitud: ${baseUrl! + uri}");
      Response response = await get(uri, headers: _mainHeaders);
      if (response.statusCode == 200) {
        print("Datos obtenidos: ${response.body}");
        return response;
      } else {
        print(
            "No se encontraron datos. Código de estado: ${response.statusCode}");
        return Response(
            statusCode: response.statusCode,
            statusText: 'No se encontraron datos');
      }
    } catch (e) {
      print("Error: $e");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
