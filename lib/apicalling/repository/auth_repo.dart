import 'package:provider_tutorial/apicalling/data/network/network_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:provider_tutorial/apicalling/resources/app_url.dart';
import '../data/network/base_api_services.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<void> login(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.login, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
