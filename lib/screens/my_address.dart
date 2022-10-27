import 'package:flutter/material.dart';
import 'package:food_store/widgets/btn_auth.dart';
import 'package:food_store/widgets/btn_custom_adress.dart';
import 'package:food_store/widgets/card_account.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_text_field.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({Key? key}) : super(key: key);

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
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
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 20,
                              offset:
                              Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(Icons.home, color: Colors.black),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Home',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '+34567892345',
                            style: GoogleFonts.ubuntu(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '204 Foxrun St.Davison, MI 48423',
                            style: GoogleFonts.ubuntu(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Marshall Erikson',
                            style: GoogleFonts.ubuntu(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_new_address');

                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff03A7A9).withOpacity(0.1),
                    elevation: 0,
                    minimumSize: Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'Add new address',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff03A7A9),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
