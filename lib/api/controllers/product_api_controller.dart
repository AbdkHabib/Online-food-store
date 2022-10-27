import 'dart:convert';
import 'package:food_store/api/api_settings.dart';
import 'package:food_store/api/controllers/api_helper.dart';
import 'package:food_store/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApiController with ApiHelper {
  Future<List<Product>> read({required int id}) async {
    Uri uri =
        Uri.parse(ApiSettings.product.replaceFirst('{id}', id.toString()));

    var response = await http.get(uri, headers: headres);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      return jsonArray
          .map((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
}
