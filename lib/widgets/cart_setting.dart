import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSetting extends StatelessWidget {
   CardSetting({
    Key? key,
    required String title1,
      String subTitle='',
      Widget? trailing,
    required void Function() onPressed,
    required IconData Icon,
    // required Color backGroundColor
  })  : _title1 = title1,
        _subTitle = subTitle,
        _trailing = trailing,
        _onPressed = onPressed,
        _Icon = Icon,
        // _backGroundColor=backGroundColor,
        super(key: key);
  final void Function() _onPressed;

  final String _title1;
  final String _subTitle;
  final Widget? _trailing;
  final IconData _Icon;

  @override
  Widget build(BuildContext context) {
    return Card(

      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      child: ListTile(
        title: Text(
          _title1,
          style: GoogleFonts.ubuntu(
            fontSize: 16,
          ),
        ),
        leading: Container(

          width: 40,
          height: 40,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 20,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Icon(_Icon,color: Colors.black,),
        ),
        subtitle: Text(
          _subTitle,
          style: GoogleFonts.ubuntu(
            fontSize: 12,
          ),
        ),
        trailing: _trailing,
      ),
    );
  }
}
