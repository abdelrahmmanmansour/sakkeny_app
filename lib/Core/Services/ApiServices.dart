import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sakeny/Core/Constant/Constant.dart';
import 'package:sakeny/costant.dart';
class ApiServices {
  getApi() async {
    http.Response response = await http
        .get(Uri.parse("http://sakenyapi.runasp.net/api/users/${id!.toInt()}"), headers: {
      "Authorization": "Bearer ${Constant.token}",
    });
    var data = jsonDecode(response.body);
    return data;
  }
  Future<Map<String, dynamic>> postApi(Map<String, dynamic> body,String endPoint) async {
    http.Response response = await http.post(
        Uri.parse("${Constant.baseUrl}$endPoint"),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"});
    var responsebody=jsonDecode(response.body);
    return responsebody;
  }
  Future<Map<String, dynamic>> putApi(Map<String, dynamic> body,String endPoint) async {
    http.Response response = await http.put(
        Uri.parse("${Constant.baseUrl}$endPoint"),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"});
    var responsebody=jsonDecode(response.body);
    return responsebody;
  }
}