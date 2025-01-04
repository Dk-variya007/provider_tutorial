import 'package:provider_tutorial/apicalling/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data; //dynamic function
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed() : status = Status.loading;

  ApiResponse.error() : status = Status.loading;

  @override
  String toString() {
    return 'status : $status \n Message : $message \n Data : $data';
  }
}
