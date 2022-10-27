import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/widgets/btn_auth.dart';
import 'package:food_store/widgets/counter.dart';
import 'package:food_store/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _cardNumberTextController;
  late TextEditingController _expiredDateTextController;
  late TextEditingController _cvvTextController;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _cardNumberTextController = TextEditingController();
    _expiredDateTextController = TextEditingController();
    _cvvTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _cardNumberTextController.dispose();
    _expiredDateTextController.dispose();
    _cvvTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff03A7A9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Add card',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Container(
                        height: 225,
                        width: 320,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage('images/Frame.png'),
                            )),
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 180,
                          width: 270,
                          child: Stack(
                            children: [
                              const Image(
                                image: AssetImage('images/Group 14.png'),
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 26.0, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '.... 1107',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Robin Scherbatsky',
                                      style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                left: 25,
                                bottom: 22,
                                child: Image(
                                  height: 24,
                                  width: 38,
                                  image: AssetImage('images/VISA.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Positioned(
                                bottom: 22,
                                right: 30,
                                child: Text('3/24'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 31),
                      child: Text(
                        'Please position your card in this frame',
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          left: 14,
                          right: 14,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                CustomTextField(
                                    textController: _nameTextController,
                                    title: 'Name in card'),
                                CustomTextField(
                                    textController: _cardNumberTextController,
                                    title: 'Card number'),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                          textController:
                                              _cardNumberTextController,
                                          title: 'Expired date'),
                                    ),
                                    Expanded(
                                      child: CustomTextField(
                                          textController:
                                              _cardNumberTextController,
                                          textInputAction: TextInputAction.done,
                                          title: 'CVV '),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
                child: BtnAuth(
                  title: 'Submit',
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
