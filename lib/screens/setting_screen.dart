import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/widgets/cart_setting.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notifications = false;
  static const IconData notifications = IconData(0xe44f, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          'Setting',
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          CardSetting(
              onPressed: () {},
              title1: 'Information & Contact',
              subTitle: 'Profile information and contact',

              Icon: Icons.info),
          CardSetting(
              onPressed: () {},
              title1: 'password',
              subTitle: 'Profile information and contact',

              Icon: Icons.lock_rounded),
          CardSetting(
              onPressed: () {},
              title1: 'Language',
              trailing:  PopupMenuButton<int>(
                icon:Text('English',style: GoogleFonts.ubuntu(fontSize: 16,color: Color(0xff03A7A9)),),
                itemBuilder: (context) => [

                  // popupmenu item 1
                  PopupMenuItem(
                    value: 1,
                    // row has two child icon and text.
                    child: Text("English"),
                  ),
                  PopupMenuDivider(),
                  // popupmenu item 2
                  PopupMenuItem(
                    value: 2,
                    // row has two child icon and text
                    child: Text("arabic"),
                  ),
                ],
                offset: Offset(0, 40),
                color: Colors.white,
                elevation: 2,
              ),

              Icon: Icons.language, ),
          CardSetting(
              onPressed: () {},
              title1: 'Notifications',
              subTitle: '',
              trailing: Switch(
                activeTrackColor: Color(0xff03A7A9),
                activeColor: Colors.white,

                onChanged: (bool value) {
                  setState(() {
                    _notifications = value;
                  });
                },
                value: _notifications,
              ),
              Icon: Icons.notifications),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 210,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                  image: const AssetImage('images/Mask2.png'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Text(
                  'Rate our app',
                  style: GoogleFonts.ubuntu(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  glow: false,
                  minRating: 1,
                  itemSize: 50,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
