import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/get/cart_get_controller.dart';
import 'package:food_store/models/process_response.dart';
import 'package:food_store/utils/helpers.dart';
import 'package:food_store/widgets/item_counter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with Helpers {
  @override
  void initState() {
    super.initState();
    CartGetXController.to.read();
  }

  CartGetXController cartGetXController =
      Get.put<CartGetXController>(CartGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Icon(Icons.arrow_back_ios_new),

        title: Text(
          'My cart',

        ),
        elevation: 0,
      ),
      body: GetBuilder<CartGetXController>(
        init: CartGetXController(),
        // global: true,
        builder: (CartGetXController controller) {
          if (controller.carts.isNotEmpty) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0.r),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.carts.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10.0.r),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  controller.carts[index].imageUrl,
                                  width: 98,
                                  height: 98,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.carts[index].nameEn,
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () async =>
                                                await delete(index: index),
                                            icon: Icon(Icons.close_rounded,
                                                size: 30),
                                            color: Color(0xff8F92A1)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ItemCounter(
                                          title1: '-',
                                          onPressed: () {
                                            CartGetXController.to.Shortage();
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('0'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ItemCounter(
                                          title1: '+',
                                          onPressed: () {
                                            CartGetXController.to.addd();
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      controller.carts[index].price,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 14.sp,
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
                ),
                Spacer(),
                Container(
                  color: Colors.white,
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 23),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total (Inc shipping fee)',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '\$190',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: const Color(0xff03A7A9),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.r))),
                                elevation: 0,
                                primary: const Color(0xff03A7A9),
                                minimumSize: Size(20, 20),
                              ),
                              child: Text(
                                'Check out',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('NO DATA IN YOUR CART'),
            );
          }
        },
      ),
    );
  }


  Future<void> delete({required int index}) async {
    ProcessResponse processResponse =
        await CartGetXController.to.delete(index: index);
    showSnackBar(context,
        message: processResponse.message, error: !processResponse.success);
  }
}
