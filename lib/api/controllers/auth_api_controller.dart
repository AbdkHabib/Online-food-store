import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../models/api_response.dart';
import '../../models/auth.dart';
import '../../pref/shared_pref_controller.dart';
import '../api_settings.dart';
import 'api_helper.dart';

class AuthApiController with ApiHelper {
  Future<ApiResponse> register({required Auth auth}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': auth.name,
      'mobile': auth.mobile,
      'password': auth.password,
      'gender': auth.gender,
      'STORE_API_KEY': '693f1336-928e-466a-b610-9fc185791dde',
      'city_id': '1',
    });
// print(response);
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      // print(jsonResponse);
      return ApiResponse(
          message: '${jsonResponse['message']}${jsonResponse['code']}',
          success: jsonResponse['status']);
      // if (response.statusCode == 201) {
      //   var jsonObject=jsonResponse['code'];
      //    Auth.fromJson(jsonObject);
      //  return ApiResponse(message: jsonResponse['message'], success:jsonResponse ['code']);
      // }
    }
    return failedResponse;
  }

  Future<ApiResponse> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      'mobile': mobile,
      'password': password,
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      // print(response.statusCode );
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['data'];
        Auth auth = Auth.fromJson(jsonObject);
      await  SharedPrefController().save(auth: auth);
      }

      return ApiResponse(

          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> activate(
      {required String mobile, required String code}) async {
    Uri uri = Uri.parse(ApiSettings.activate);
    var response = await http.post(uri, body: {
      'mobile': mobile,
      'code': code,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    });


    if (response.statusCode == 200 || response.statusCode == 401) {
      await SharedPrefController().clear();
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: response.statusCode == 200
              ? jsonResponse['message']
              : 'Logged out successfully',
          success:true);
    }
    return failedResponse;
  }
}
