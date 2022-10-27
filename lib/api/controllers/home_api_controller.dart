import 'dart:convert';
import 'package:food_store/api/api_settings.dart';
import 'package:food_store/api/controllers/api_helper.dart';
import 'package:food_store/models/home_category.dart';
import 'package:food_store/models/product.dart';
import 'package:food_store/models/slider.dart';
import 'package:http/http.dart' as http;

class HomeApiController with ApiHelper {
  Future<HomeModel?> read() async {
    HomeModel homeModel = HomeModel();
    Uri uri = Uri.parse(ApiSettings.home);
    var response = await http.get(
      uri,
      headers: headres,
    );
// print('home screen ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var data = jsonResponse['data'];



      var sliderArray = data['slider'] as List;
      homeModel.sliders = sliderArray.map((e) => HomeSlider.fromJson(e)).toList();


      var categoriesArray = data['categories'] as List;
      homeModel.categories =
          categoriesArray.map((e) => HomeCategory.fromJson(e)).toList();

      var latestProductsArray = data['latest_products'] as List;
      homeModel.latestProducts =
          latestProductsArray.map((e) => Product.fromJson(e)).toList();

      var famousProductsArray = data['famous_products'] as List;
      homeModel.famousProducts =
          famousProductsArray.map((e) => Product.fromJson(e)).toList();

      return homeModel;
    }
    return null;
  }
}

class HomeModel {
  late List<HomeSlider> sliders;
  late List<HomeCategory> categories;
  late List<Product> latestProducts;
  late List<Product> famousProducts;
}
