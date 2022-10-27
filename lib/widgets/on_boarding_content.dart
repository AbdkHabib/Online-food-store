import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required String image,
    required String title,
    required String subTitle,
  })  : _image = image,
        _title = title,
        _subTitle = subTitle,
        super(key: key);

  final String _image;
  final String _title;
  final String _subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/$_image.png',
          height: 317,
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                _title,
                style: GoogleFonts.nunito(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF23203F),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                _subTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFF716F87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
