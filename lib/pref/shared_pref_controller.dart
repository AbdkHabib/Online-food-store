import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth.dart';

enum PrefKey { id, name, mobile, gender, token, loggedIn, email ,refreshToken}

class SharedPrefController {
  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  SharedPrefController._();

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required Auth auth}) async {
    await _sharedPreferences.setBool(PrefKey.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKey.id.name, auth.id);
    await _sharedPreferences.setString(PrefKey.name.name, auth.name);
    await _sharedPreferences.setString(PrefKey.mobile.name, auth.mobile);
    await _sharedPreferences.setString(PrefKey.gender.name, auth.gender);
    await _sharedPreferences.setString(
        PrefKey.token.name, 'Bearer ${auth.token}');
    // print('Bearer ${auth.token}');

    // await _sharedPreferences.setString(
    //     PrefKey.token.name, 'Bearer ${auth.refreshToken}');
  }

  Future<bool> clear() async => _sharedPreferences.clear();

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKey.loggedIn.name) ?? false;

  T? getByKey<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PrefKey.loggedIn.name);
    _sharedPreferences.remove(PrefKey.email.name);

  }

  String get token => _sharedPreferences.getString(PrefKey.token.name) ?? '';
}
