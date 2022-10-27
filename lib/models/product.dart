

class Product {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late String price;
  late String quantity;
  late String overalRate;
  late String subCategoryId;
  late int productRate;
  late String offerPrice;
  late bool isFavorite;
  late String imageUrl;
  late int userId;
  late int mobileNumber;
  static const tableName = 'cart';

  Product();
//
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    // userId = json['user_id'];
  }

//
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['info_en'] = infoEn;
    data['info_ar'] = infoAr;
    data['price'] = price;
    data['quantity'] = quantity;
    data['overal_rate'] = overalRate;
    data['sub_category_id'] = subCategoryId;
    data['product_rate'] = productRate;
    data['offer_price'] = offerPrice;
    data['is_favorite'] = isFavorite;
    data['image_url'] = imageUrl;
    // data['user_id'] = userId;
    return data;
  }
}

class Images {
  late int id;
  late String objectId;
  late String url;
  late String imageUrl;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }
}
