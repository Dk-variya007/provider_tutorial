import 'package:provider_tutorial/apicalling/data/network/network_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:provider_tutorial/apicalling/model/post_model.dart';
import 'package:provider_tutorial/apicalling/model/user_model.dart';
import 'package:provider_tutorial/apicalling/resources/app_url.dart';
import '../data/exception/app_exception.dart';
import '../data/network/base_api_services.dart';
import '../model/todo_model.dart';
import '../utils/log_utils.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<void> login(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.login, data);
      UserModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signUp(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.signUp, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PostModel>> getPost() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.posts);
      return (response as List).map((e) => PostModel.fromJson(e)).toList();
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        var errData = (e).response!.data;
        var errMessage = errData['message'];
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }

  Future<List<TodoModel>> getTodo() async {
    try {
      final response = await _apiServices.getGetApiResponse(AppUrl.todos);
      LogUtil.debug(response);
      return (response as List).map((e) => TodoModel.fromJson(e)).toList();
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        var errData = (e).response!.data;
        var errMessage = errData['message'];
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }
}
