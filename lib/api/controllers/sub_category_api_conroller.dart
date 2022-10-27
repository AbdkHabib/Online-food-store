import 'dart:convert';
import 'package:food_store/api/api_settings.dart';
import 'package:food_store/api/controllers/api_helper.dart';
import 'package:food_store/models/sub_category.dart';
import 'package:http/http.dart' as http;

class SubCategoryApiController with ApiHelper {
  Future<List<SubCategory>> read({required int id}) async {
    Uri uri =
        Uri.parse(ApiSettings.subCategory.replaceFirst('{id}', id.toString()));

    var response = await http.get(uri, headers: headres);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      return jsonArray
          .map((jsonObject) => SubCategory.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
}
