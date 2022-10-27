import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/auth_api_controller.dart';
import 'package:food_store/models/api_response.dart';
import 'package:food_store/pref/shared_pref_controller.dart';
import 'package:food_store/utils/helpers.dart';
import 'package:food_store/widgets/card_account.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget with Helpers {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: false,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 170,
                  color: Color(0xff03A7A9),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 35, horizontal: 0),
                      child: Text(
                        'My Account',
                        style: GoogleFonts.ubuntu(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 123,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 23),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://media.istockphoto.com/vectors/logo-of-a-green-life-tree-with-roots-and-leaves-vector-illustration-vector-id1130887322?k=20&m=1130887322&s=612x612&w=0&h=dPVnCDJ4ocIqtn51iJDzEKdesx_RikdT74asv81jJdk=',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${SharedPrefController().getByKey<String>(key: PrefKey.name.name)!}',
                                          style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,

                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          '+${SharedPrefController().getByKey<String>(key: PrefKey.mobile.name)!}',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics:
                          ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        // childAspectRatio: 150.w / 142.h,
                      ),
                      children: [
                        CardAccount(
                          onPressed: () {
                            Navigator.pushNamed(context, '/setting_screen');
                          },
                          title1: ('setting'),
                          icon: Icons.settings,
                        ),
                        CardAccount(
                          onPressed: () {
                            Navigator.pushNamed(context, '/my_address');
                          },
                          title1: ('Address'),
                          icon: Icons.location_on_sharp,
                        ),
                        CardAccount(
                          onPressed: () {
                            Navigator.pushNamed(context, '/payment_screen');
                          },
                          title1: ('Payment'),
                          icon: Icons.payment,
                        ),

                        CardAccount(
                          onPressed: () async {
                            await _Logout(context);
                          },
                          title1: ('Logout'),
                          icon: Icons.logout,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _Logout(BuildContext context) async {
    ApiResponse apiResponse = await AuthApiController().logout();
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
