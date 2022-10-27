import 'package:food_store/api/api_settings.dart';
import 'package:food_store/api/controllers/api_helper.dart';
import 'package:http/http.dart' as http;

class RateApiController with ApiHelper {


  Future<bool> rate({required int productId,required int rate}) async {
    Uri uri = Uri.parse(ApiSettings.favorite);
    var response = await http.post(uri, headers: headres, body: {
      'product_id': productId,
      'rate': rate,
    });
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
