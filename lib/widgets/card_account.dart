import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAccount extends StatelessWidget {
  const CardAccount({
    Key? key,
    required String title1,
    required void Function() onPressed,
    required IconData icon,
    // required Color backGroundColor
  })  : _title1 = title1,
        _onPressed = onPressed,
        _icon = icon,
        // _backGroundColor=backGroundColor,
        super(key: key);
  final void Function() _onPressed;

  final String _title1;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 142.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: _onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 20.r,
                    offset: Offset(0, 5.h), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(_icon, color: Colors.black),
            ),
            // SizedBox(
            //   height: 23.h,
            // ),
            Text(
              _title1,
              style: GoogleFonts.ubuntu(
                fontSize: 16.sp,
                color: Color(0xff01000D),
              ),
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
          ],
        ),
      ),
    );
  }
}
