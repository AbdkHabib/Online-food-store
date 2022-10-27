import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/product_api_controller.dart';
import 'package:food_store/get/cart_get_controller.dart';
import 'package:food_store/models/process_response.dart';
import 'package:food_store/models/product.dart';
import 'package:food_store/screens/product_details_screen.dart';
import 'package:food_store/utils/helpers.dart';
import 'package:food_store/widgets/btn_auth.dart';
import 'package:food_store/widgets/item_counter.dart';
import 'package:food_store/widgets/loading_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({ Key? key, required this.id, this.cart});

  int id;
  final Product? cart;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>  with Helpers {
  bool selected1 = false;
  bool selected2 = true;
  bool selected3 = true;
  CartGetXController cartGetXController =
      Get.put<CartGetXController>(CartGetXController());
  late int val = CartGetXController.to.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text(
          'Product details',
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<Product>>(
        future: ProductApiController().read(id: widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoadingScreen(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                id: snapshot.data![index].id),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.network(
                              fit: BoxFit.cover,
                              height: 86,
                              width: 86,
                              snapshot.data![index].imageUrl,
                            ),
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      height: 26,
                                    ),
                                    Text(
                                      snapshot.data![index].nameEn,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Spacer(),
                                    const LikeButton(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data![index].price,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '/gram',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () => _bottomSheet(context,snapshot,index),
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xff03A7A9)
                                        .withOpacity(0.10),
                                    elevation: 0,
                                    minimumSize: Size(double.infinity, 50.h),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r))),
                                  ),
                                  child: Text(
                                    'Add to card',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14.sp,
                                      color: const Color(0xff03A7A9),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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

  void _bottomSheet(BuildContext context,snapshot,index) async {

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(

          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        'Choose amount',
                        style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      Spacer(),
                      Icon( Icons.keyboard_hide_outlined),

                    ],
                  ),
                  SizedBox(height: 20,),
                  const Text('Choose weight'),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 12.0,
                      children: [
                        // Choose weight kg
                        Container(
                          width: 80,
                          height: 32,
                          decoration: BoxDecoration(
                            color: selected1 == true
                                ? const Color(0xff03A7A9).withOpacity(0.10)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ChoiceChip(
                            selected: selected1,
                            selectedColor: const Color(0xff03A7A9).withOpacity(0.10),
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
                                ? const Color(0xff03A7A9).withOpacity(0.10)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ChoiceChip(
                            selectedColor: const Color(0xff03A7A9).withOpacity(0.10),
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
                                ? const Color(0xff03A7A9).withOpacity(0.10)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ChoiceChip(
                            selectedColor: const Color(0xff03A7A9).withOpacity(0.10),
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
                  SizedBox(height: 12,),
                  const Text('Choose quantity'),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ItemCounter(
                          title1: '-',
                          onPressed: () {
                            CartGetXController.to.Shortage();
                          }),
                      const SizedBox(
                        width: 15,
                      ),
                      Text('${val}'),
                      const SizedBox(
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

                  Spacer(),
                  BtnAuth(
                      onPressed: () async => await _create(snapshot.data![index]),

                      title: 'Add to cart'),
                ],
              ),
            );
          },
        );
      },
    );
  }



  bool get isNewNote => widget.cart == null;

  Future<void> _create(Product cart) async {
    // getCart(snapshot.data!
    ProcessResponse processResponse = isNewNote
        ? await CartGetXController.to.create(cart: cart)
        : await CartGetXController.to.updateCart(updatedCart: cart);

    showSnackBar(context,message: processResponse.message, error: !processResponse.success);

  }
}
