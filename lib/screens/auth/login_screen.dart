import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/auth_api_controller.dart';
import 'package:food_store/models/api_response.dart';
import 'package:food_store/widgets/app_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/helpers.dart';
import '../../widgets/btn_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      resizeToAvoidBottomInset: false,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Sign In',
              style: GoogleFonts.ubuntu(
                fontSize: 28.sp,
                color: const Color(0xff0B2E40),
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            AppTextField(
              textController: _mobileTextController,
              hint: 'Mobile Number',
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
              textController: _passwordTextController,
              hint: 'Password',
              textInputType: TextInputType.text,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 17.h,
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/forgot_password_screen'),
                  child: Text(
                    'Forgot password? ',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12.sp,
                      color: const Color(0xff0B2E40),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
            BtnAuth(
              title: 'Sign In',
              onPressed: () async => await _performLogin(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'OR',
              style: GoogleFonts.ubuntu(
                fontSize: 16.sp,
                color: const Color(0xff0B2E40),
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            FacebookAuthButton(
              onPressed: () {},
              themeMode: ThemeMode.light,
              style: AuthButtonStyle(
                iconType: AuthIconType.outlined,
                width: double.infinity,
                height: 48.h,
                iconSize: 22.r,
              ),
            ),
            SizedBox(
              height: 29.4.h,
            ),
            GoogleAuthButton(
              onPressed: () {},
              themeMode: ThemeMode.light,
              style: AuthButtonStyle(
                iconType: AuthIconType.outlined,
                width: double.infinity,
                height: 48.h,
                iconSize: 22.r,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Don’t have an account?',
                  style: GoogleFonts.ubuntu(
                    fontSize: 14.sp,
                    color: const Color(0xff0B2E40),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/register_screen'),
                  child: Text(
                    'Sign up now!',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14.sp,
                      color: const Color(0xff03A7A9),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45.h,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_mobileTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    // showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    ApiResponse apiResponse = await AuthApiController().login(
        mobile: _mobileTextController.text,
        password: _passwordTextController.text);
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/bottom_navigation_bar');
    }
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.success);
  }
}
