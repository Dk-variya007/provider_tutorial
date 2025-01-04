import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider_tutorial/apicalling/data/exception/app_exception.dart';
import 'package:provider_tutorial/apicalling/data/network/base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: "No internet connection");
    }
    return jsonResponse;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: "No internet connection");
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400:
        throw BadRequestException(message: response.body.toString());

      case 500:
        throw BadRequestException(message: response.body.toString());

      default:
        throw FetchDataException(
            message: 'error occured while communicating with server' +
                'with status code ${response.statusCode.toString()}');
    }
  }
}
