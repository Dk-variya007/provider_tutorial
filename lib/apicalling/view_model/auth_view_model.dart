import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_tutorial/apicalling/model/post_model.dart';
import 'package:provider_tutorial/apicalling/repository/auth_repo.dart';
import 'package:provider_tutorial/apicalling/utils/routes/route_name.dart';
import 'package:provider_tutorial/apicalling/utils/utils.dart';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import '../data/exception/app_exception.dart';

class AuthViewModel extends ChangeNotifier {
  final myRepo = AuthRepository();
  bool _loading = false;
  List<PostModel> _list = [];

  bool get loading => _loading;

  List<PostModel> get getList => _list;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(Map<String, dynamic> data, context) async {
    setLoading(true);
    myRepo.login(data).then(
      (value) {
        setLoading(false);
        Utils.flushBarErrorMessage('Login Successfully', context);
        Navigator.pushNamed(context, RouteName.home);
        if (kDebugMode) {
          print('');
        }
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
      },
    );
    setLoading(false);
  }

  Future<void> signUp(Map<String, dynamic> data, context) async {
    setLoading(true);
    myRepo.signUp(data).then(
      (value) {
        setLoading(false);
        Utils.flushBarErrorMessage('SignUp Successfully', context);
        Navigator.pushNamed(context, RouteName.home);
        if (kDebugMode) {
          print('');
        }
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
      },
    );
  }

  Future<void> getPostData(context) async {
    setLoading(true);
    try {
      _list = await myRepo.getPost();
      notifyListeners();
    } on ServerException catch (e) {
      Utils.snackBar(e.message, context);
    } on SocketException {
      Utils.snackBar('No internet connection', context);
    } catch (e) {
      Utils.snackBar('Login failed $e', context);
    } finally {}
  }
}
