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
        headers: {"Content-Type": "application/json", "Authorization": "Bearer ${Constant.token}"},);
    var responsebody=jsonDecode(response.body);
    return responsebody;
  }
  Future<dynamic> putApi(Map<String, dynamic> body, String userId) async {
    try {
      final String url = "http://sakenyapi.runasp.net/api/users/$userId";  // Assuming userID needs to be part of the URL
      http.Response response = await http.put(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: {"Authorization": "Bearer ${Constant.token}"}
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          throw Exception('Received empty response body');
        }
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

}