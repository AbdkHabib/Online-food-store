import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CodeTextField extends StatelessWidget {
  const CodeTextField({
    Key? key,
    required this.controller,
    required this.onChange,
    required this.onSubmitted,
    required this.focusNode,

  }) : super(key: key);
final TextEditingController controller;
final FocusNode focusNode;
final void Function(String value)onChange;
final void Function(String value)onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: GoogleFonts.montserrat(fontSize: 20),
        textInputAction: TextInputAction.next,
        onChanged: onChange,
        onSubmitted: onSubmitted,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
              )),
        ),
      ),
    );
  }
}
