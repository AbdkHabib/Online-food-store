import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/widgets/app_text_field.dart';
import 'package:food_store/widgets/btn_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),

      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Forgot Password',
              style: GoogleFonts.nunito(color: const Color(0xff0B2E40), fontSize: 28.sp),
            ),
             SizedBox(
              height: 7.h,
            ),
            Container(
              padding:  EdgeInsets.only(left: 69.w, right: 69.w),
              child: Text(
                'Please enter your email address.You will receive a link to create a new password via email',
                textAlign: TextAlign.center,
                // overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: GoogleFonts.nunito(
                  color: const Color(0xff7E7B7B),
                  fontSize: 16.sp,
                ),
              ),
            ),
             SizedBox(
              height: 38.h,
            ),
            AppTextField(textController: _emailTextController, hint: 'Mobile Number'),
             SizedBox(
              height: 18.h,
            ),
             BtnAuth(title: 'Send',onPressed:(){} ),

      ],
        ),
      ),
    );
  }
}
