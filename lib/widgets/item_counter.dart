import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCounter extends StatelessWidget {
  const ItemCounter({
    Key? key,
    required String title1,
    required void Function() onPressed,
  })  : _title1 = title1,
        _onPressed = onPressed,
        // _backGroundColor=backGroundColor,
        super(key: key);
  final void Function() _onPressed;
  final String _title1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: Container(
        // margin: EdgeInsets.only(left: 14,right: 14),
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Container(

          child: Text(
            _title1,
            style: GoogleFonts.ubuntu(

              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
