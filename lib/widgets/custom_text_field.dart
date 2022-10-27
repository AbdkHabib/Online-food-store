import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController textController,
    TextInputType textInputType = TextInputType.text,
    required String title,
    TextInputAction textInputAction = TextInputAction.next,
    Function(String value)? onSubmitted,
  })  : _textController = textController,
        _title = title,
        _textInputAction = textInputAction,
        super(key: key);

  final TextEditingController _textController;
  final String _title;
  final TextInputAction _textInputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            _title,
            style: GoogleFonts.ubuntu(
              fontSize: 14,
              color: Color(0xff8F92A1),
            ),
          ),
          SizedBox(height: 6,),
          TextField(
            controller:_textController,
            textInputAction: _textInputAction,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                )),
          ),
        ],
      ),
    );
  }
}
