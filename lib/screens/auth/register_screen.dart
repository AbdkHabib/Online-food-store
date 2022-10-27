import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/auth_api_controller.dart';
import 'package:food_store/models/api_response.dart';
import 'package:food_store/models/auth.dart';
import 'package:food_store/widgets/app_text_field.dart';
import 'package:food_store/widgets/btn_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/helpers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers{
  late TextEditingController _userNameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  String _gender = 'M';

  @override
  void initState() {
    super.initState();
    _userNameTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameTextController.dispose();
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              'Sign Up',
              style: GoogleFonts.nunito(
                  color: const Color(0xff0B2E40), fontSize: 28.sp),
            ),
             SizedBox(
              height: 33.h,
            ),
            AppTextField(
                textController: _userNameTextController, hint: 'Username'),
             SizedBox(
              height: 16.h,
            ),
            AppTextField(
              textController: _mobileTextController,
              hint: 'Mobile Number',
            ),
             SizedBox(
              height: 16.h,
            ),
            AppTextField(
                textController: _passwordTextController, hint: 'Password'),
             SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text('Male'),
                    value: 'M',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => _gender = value);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('Female'),
                    value: 'F',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => _gender = value);
                      }
                    },
                  ),
                ),
              ],
            ),
             SizedBox(height: 40.h),
            BtnAuth(
              title: 'Confirm',
              onPressed: () async => await _performRegister(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_userNameTextController.text.isNotEmpty &&
        _mobileTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    ApiResponse apiResponse = await AuthApiController().register(auth: auth);
    if (apiResponse.success) Navigator.pushReplacementNamed(context, '/activate_screen');

    showSnackBar(context,message: apiResponse.message, error: !apiResponse.success);

  }

  Auth get auth {
    Auth auth = Auth();
    auth.name = _userNameTextController.text;
    auth.mobile = _mobileTextController.text;
    auth.password = _passwordTextController.text;
    auth.gender = _gender;
    return auth;
  }
}
