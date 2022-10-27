import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnCustomAddress extends StatelessWidget {
  const BtnCustomAddress({
    Key? key,
    required String title,
    required void Function() onPressed,

    // required Color backGroundColor
  })  : _title = title,
        _onPressed=onPressed,
  // _backGroundColor=backGroundColor,
        super(key: key);
  final void Function() _onPressed;

  final String _title;

  // final Color _backGroundColor;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          // primary: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(8.r))),
          elevation: 0,
          primary: Colors.grey.shade100,
          minimumSize: Size(double.infinity, 32.h),
        ),
        child: Text(
          _title,
          style: GoogleFonts.ubuntu(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
