import 'dart:convert';
import 'package:food_store/api/api_settings.dart';
import 'package:food_store/api/controllers/api_helper.dart';
import 'package:food_store/models/api_response.dart';
import 'package:food_store/models/product_details.dart';
import 'package:http/http.dart' as http;

class ProductDetailsApiController with ApiHelper {
  Future<ProductDetails?> read({required int id}) async {
    // ProductDetails productDetails = ProductDetails();
    Uri uri = Uri.parse(
      ApiSettings.productDetails.replaceFirst('{id}', id.toString(),),);
    var response = await http.get(uri, headers: headres);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var data = jsonResponse['object'];
      return ProductDetails.fromJson(data);
    }
    return null;
  }

}

// class ProductDetails {
//   late List<Product> product;
//   late List<Images> images;
// }
