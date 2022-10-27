import 'package:flutter/material.dart';
import 'package:food_store/widgets/btn_auth.dart';
import 'package:food_store/widgets/btn_custom_adress.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_text_field.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        title: Text(
          'Add new address',
          style: GoogleFonts.ubuntu(),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: ListView(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: GoogleFonts.ubuntu(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image(
                                image: AssetImage('images/map.png'),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Choose location',
                                    style: GoogleFonts.ubuntu(
                                        color: Color(0xff03A7A9),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 23,),
                      Text(
                        'Contact',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 17,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextField(
                                textController: _nameTextController,
                                title: 'Name in card'),
                            CustomTextField(
                                textController: _cardNumberTextController,
                                title: 'Card number'),
                          ],
                        ),
                      ),
                      SizedBox(height: 24,),
                      Text(
                        'Name of address',
                        style: GoogleFonts.ubuntu(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                BtnCustomAddress(title: 'Home', onPressed: () {}),
                                SizedBox(
                                  width: 12,
                                ),
                                BtnCustomAddress(
                                    title: 'Company', onPressed: () {}),
                                SizedBox(
                                  width: 12,
                                ),
                                BtnCustomAddress(
                                    title: 'Others', onPressed: () {}),
                              ],
                            ),
                          )),
                    ],
                  ),
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
