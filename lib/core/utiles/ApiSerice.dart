import 'package:dio/dio.dart';

class Api_Service{
  Dio dio;
  Api_Service({required this.dio});
  final String urlHeader='https://e-commerce-mock-api-d8zv.onrender.com/';
  Future<Map<String,dynamic>> getResponse({required endPoint})async{
    var response= await dio.get('$urlHeader$endPoint');
    return response.data;
  }
}