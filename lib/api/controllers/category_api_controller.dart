import 'dart:convert';
import 'package:food_store/api/api_settings.dart';
import 'package:food_store/api/controllers/api_helper.dart';
import 'package:food_store/models/categories.dart';
import 'package:http/http.dart' as http;

class CategoryApiController with ApiHelper{
    Future<List<Categories>> read() async {

    Uri uri = Uri.parse(ApiSettings.category);
    var response = await http.get(uri,headers: headres);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      return jsonArray.map((jsonObject) => Categories.fromJson(jsonObject)).toList();

    }
    return [];
  }
}