

class ApiSettings{
  static const String _baseUrl ='https://smart-store.mr-dev.tech/api/';
  static const String register ='${_baseUrl}auth/register';
  static const String login  ='${_baseUrl}auth/login';
  static const String logout  ='${_baseUrl}auth/logout';
  static const String activate  ='${_baseUrl}auth/activate';
  static const String home  ='${_baseUrl}home';
  static  String category  ='${_baseUrl}categories';
  static  String subCategory  ='${_baseUrl}categories/{id}';
  static  String product  ='${_baseUrl}sub-categories/{id}';
  static  String productDetails  ='${_baseUrl}products/{id}';
  static  String favorite  ='${_baseUrl}favorite-products';
  static  String rate  ='${_baseUrl}products/rate';
}