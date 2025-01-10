import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_tutorial/apicalling/model/post_model.dart';
import 'package:provider_tutorial/apicalling/model/todo_model.dart';
import 'package:provider_tutorial/apicalling/repository/auth_repo.dart';
import 'package:provider_tutorial/apicalling/utils/log_utils.dart';
import 'package:provider_tutorial/apicalling/utils/routes/route_name.dart';
import 'package:provider_tutorial/apicalling/utils/utils.dart';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import '../data/exception/app_exception.dart';

class AuthViewModel extends ChangeNotifier {
  final myRepo = AuthRepository();
  bool _loading = false;
  List<PostModel> _postList = [];
  List<TodoModel> _todoList = [];

  bool get loading => _loading;

  List<PostModel> get getPostList => _postList;

  List<TodoModel> get getTodoList => _todoList;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  AuthViewModel() {
    LogUtil.debug("calling");
    getTodoData();
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
    try {
      setLoading(true);
      await myRepo.signUp(data);
      setLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RouteName.home);
    } catch (error) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    } finally {
      setLoading(false);
    }
  }

  Future<void> getPostData(context) async {
    setLoading(true);
    try {
      _postList = await myRepo.getPost();
      notifyListeners();
    } on ServerException catch (e) {
      Utils.snackBar(e.message, context);
    } on SocketException {
      Utils.snackBar('No internet connection', context);
    } catch (e) {
      Utils.snackBar('Login failed $e', context);
    } finally {
      setLoading(false);
    }
  }

  Future<void> getTodoData() async {
    setLoading(true);
    try {
      _todoList = await myRepo.getTodo();
      LogUtil.debug(_todoList);
    } catch (e) {
      LogUtil.error("Error fetching todos: $e");
    } finally {
      setLoading(false);
    }
  }
}
