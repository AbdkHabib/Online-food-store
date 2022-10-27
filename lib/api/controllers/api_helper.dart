import 'dart:io';

import 'package:food_store/pref/shared_pref_controller.dart';

import '../../models/api_response.dart';

mixin ApiHelper{
  ApiResponse get failedResponse=>
      ApiResponse( message: 'Something went wrong, try again!', success: false);
  Map<String, String> get headres {
    return {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

}