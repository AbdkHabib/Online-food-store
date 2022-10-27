import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/favorite_api_controller.dart';
import 'package:food_store/api/controllers/product_details_api_controller.dart';
import 'package:food_store/get/cart_get_controller.dart';
import 'package:food_store/models/product.dart';
import 'package:food_store/models/product_details.dart';
import 'package:food_store/pref/shared_pref_controller.dart';
import 'package:food_store/utils/helpers.dart';
import 'package:food_store/widgets/btn_auth.dart';
import 'package:food_store/widgets/item_counter.dart';
import 'package:food_store/widgets/loading_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import '../models/process_response.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({Key? key, required this.id, this.cart});

  int id;
  final Product? cart;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with Helpers {
  late TextEditingController storeController;
  bool selected1 = false;
  bool selected2 = true;
  bool selected3 = true;

  CartGetXController cartGetXController =
      Get.put<CartGetXController>(CartGetXController());
  late int val = CartGetXController.to.values;

  @override
  void initState() {
    super.initState();

    storeController = TextEditingController();
  }

  @override
  void dispose() {
    storeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          'Product details',
        ),
        elevation: 0,
      ),
      body: FutureBuilder<ProductDetails?>(
        future: ProductDetailsApiController().read(id: widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoadingScreen(),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Padding(
                padding: EdgeInsets.all(10.0.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        LikeButton(isLiked: snapshot.data!.isFavorite),
                      ],
                    ),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                          height: 200.0.h,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          reverse: false,
                          viewportFraction: 1,
                          aspectRatio: 5.0),
                      itemBuilder: (context, i, id) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.network(
                                fit: BoxFit.cover,
                                snapshot.data!.images[i].imageUrl));
                      },
                      itemCount: snapshot.data!.images.length,
                    ),
                    Row(
                      children: [
                        Text(
                          snapshot.data!.nameEn,
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          '\$${snapshot.data!.price}',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        const Text('/gram'),
                      ],
                    ),
                    Text(
                      snapshot.data!.infoEn,
                      style:
                          GoogleFonts.ubuntu(fontSize: 14, color: Colors.black),
                    ),
                    RatingBar.builder(
                      initialRating: 3.r,
                      glow: false,
                      minRating: 1,
                      itemSize: 35.r,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0.h),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                        snapshot.data!.productRate;
                      },
                    ),
                    Text('Choose quantity'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ItemCounter(
                            title1: '-',
                            onPressed: () {
                              CartGetXController.to.Shortage();
                            }),
                        SizedBox(
                          width: 15,
                        ),
                        Text('${val}'),
                        SizedBox(
                          width: 15,
                        ),
                        ItemCounter(
                          title1: '+',
                          onPressed: () {
                            CartGetXController.to.addd();
                          },
                        ),
                      ],
                    ),
                    const Text('Choose weight'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 12.0,
                        children: [
                          // 4
                          Container(
                            width: 80,
                            height: 32,
                            decoration: BoxDecoration(
                              color: selected1 == true
                                  ? Color(0xff03A7A9).withOpacity(0.10)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ChoiceChip(
                              selected: selected1,
                              selectedColor:
                                  Color(0xff03A7A9).withOpacity(0.10),
                              label: Text(
                                '0.5',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff03A7A9),
                                ),
                              ),

                              // 7
                              onSelected: (selected) {
                                setState(
                                  () {
                                    selected1 = true;
                                    selected2 = false;
                                    selected3 = false;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 32,
                            decoration: BoxDecoration(
                              color: selected2 == true
                                  ? Color(0xff03A7A9).withOpacity(0.10)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ChoiceChip(
                              selectedColor:
                                  Color(0xff03A7A9).withOpacity(0.10),
                              selected: selected2,
                              label: Text(
                                '0.8',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff03A7A9),
                                ),
                              ),
                              onSelected: (selected) {
                                setState(
                                  () {
                                    selected1 = false;
                                    selected2 = true;
                                    selected3 = false;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 32,
                            decoration: BoxDecoration(
                              color: selected3 == true
                                  ? Color(0xff03A7A9).withOpacity(0.10)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ChoiceChip(
                              selectedColor:
                                  Color(0xff03A7A9).withOpacity(0.10),
                              selected: selected3,
                              label: Text(
                                '1.5',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff03A7A9),
                                ),
                              ),
                              onSelected: (selected) {
                                setState(
                                  () {
                                    selected1 = false;
                                    selected2 = false;
                                    selected3 = true;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    BtnAuth(
                        onPressed: () async => await _create(
                              getCart(snapshot.data!),
                            ),
                        title: 'Add to cart'),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('NO DATA',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
            );
          }
        },
      ),
    );
  }

  Future<bool> _favorite() async {
    FavoriteApiController().addFavorite(
      productId: widget.id,
    );
    return true;
  }

  Product getCart(ProductDetails productDetails) {
    Product product = Product();
    product.id = productDetails.id;
    product.nameEn = productDetails.nameEn;
    product.nameAr = productDetails.nameAr;
    product.infoEn = productDetails.infoEn;
    product.infoAr = productDetails.infoAr;
    product.price = productDetails.price;
    product.quantity = productDetails.quantity;
    product.imageUrl = productDetails.imageUrl;
    product.isFavorite = productDetails.isFavorite;
    product.overalRate = productDetails.overalRate;
    product.productRate = productDetails.productRate;
    product.subCategoryId = productDetails.subCategoryId;
    product.offerPrice = productDetails.offerPrice.toString();
    product.userId =
        SharedPrefController().getByKey<int>(key: PrefKey.id.name)!;
    return product;
  }

  bool get isNewNote => widget.cart == null;

  Future<void> _create(Product cart) async {
    // getCart(snapshot.data!
    ProcessResponse processResponse = isNewNote
        ? await CartGetXController.to.create(cart: cart)
        : await CartGetXController.to.updateCart(updatedCart: cart);

    showSnackBar(context,message: processResponse.message, error: !processResponse.success);

  }

// Future<void> _counter(Cart cart) async {
//   await CartGetXController.to.counter(cart: cart);
// }

}
