import 'dart:convert';
import 'package:food_store/api/api_settings.dart';
import 'package:food_store/api/controllers/api_helper.dart';
import 'package:food_store/models/api_response.dart';
import 'package:food_store/models/favorite.dart';
import 'package:http/http.dart' as http;

class FavoriteApiController with ApiHelper {
  Future<List<Favorite>> getFavorite() async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 400) {
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var jsonArray = jsonResponse['list'] as List;
        return jsonArray
            .map((jsonObject) => Favorite.fromJson(jsonObject))
            .toList();
      }
    }
    return [];
  }

  Future<bool> addFavorite({required int productId}) async {
    Uri uri = Uri.parse(ApiSettings.favorite);
    var response = await http.post(uri, headers: headres, body: {
      'product_id': productId.toString(),
    });
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
