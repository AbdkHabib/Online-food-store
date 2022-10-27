import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/auth_api_controller.dart';
import 'package:food_store/models/api_response.dart';
import 'package:food_store/utils/helpers.dart';
import 'package:food_store/widgets/app_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/btn_auth.dart';
import '../../widgets/code_text_field.dart';

class ActivateScreen extends StatefulWidget {
  const ActivateScreen({Key? key}) : super(key: key);

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> with Helpers {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  late TextEditingController _mobileTextController;
  String _code='';

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  @override
  void initState() {
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    _mobileTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _mobileTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Activate',
              style: GoogleFonts.nunito(color: const Color(0xff0B2E40), fontSize: 28.sp),
            ),
             SizedBox(
              height: 7.h,
            ),
            Text(
              'Enter Your Code',
              textAlign: TextAlign.center,
              // overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: GoogleFonts.nunito(
                color: const Color(0xff7E7B7B),
                fontSize: 16.sp,
              ),
            ),
             SizedBox(
              height: 38.h,
            ),
            Row(
              children: [
                CodeTextField(
                  controller: _firstCodeTextController,
                  focusNode: _firstFocusNode,
                  onChange: (String value) {
                    if (value.isNotEmpty) {
                      _secondFocusNode.requestFocus();
                    }
                  },
                  onSubmitted: (String value) {
                    if (value.isNotEmpty) {
                      _secondFocusNode.requestFocus();
                    }
                  },
                ),
                 SizedBox(
                  width: 10.w,
                ),
                CodeTextField(
                  controller: _secondCodeTextController,
                  focusNode: _secondFocusNode,
                  onChange: (String value) {
                    if (value.isNotEmpty) {
                      _thirdFocusNode.requestFocus();
                    } else {
                      _firstFocusNode.requestFocus();
                    }
                  },
                  onSubmitted: (String value) {},
                ),
                 SizedBox(
                  width: 10.w,
                ),
                CodeTextField(
                    controller: _thirdCodeTextController,
                    focusNode: _thirdFocusNode,
                    onChange: (String value) {
                      if (value.isNotEmpty) {
                        _fourthFocusNode.requestFocus();
                      } else {
                        _secondFocusNode.requestFocus();
                      }
                    },
                    onSubmitted: (String value) {}),
                 SizedBox(
                  width: 10.w,
                ),
                CodeTextField(
                  controller: _fourthCodeTextController,
                  focusNode: _fourthFocusNode,
                  onChange: (String value) {
                    if (value.isEmpty) {
                      _thirdFocusNode.requestFocus();
                    }
                  },
                  onSubmitted: (String value) {},
                ),
              ],
            ),
             SizedBox(
              height: 10.h,
            ),
            AppTextField(
              textController: _mobileTextController,
              hint: 'your mobile',
              textInputType: TextInputType.text,
              obscureText: false,
              textInputAction: TextInputAction.done,
            ),
             SizedBox(
              height: 38.h,
            ),
            BtnAuth(title: 'Send',
              onPressed: () async => await _performActivate()),
          ],
        ),
      ),
    );
  }

  Future<void> _performActivate() async {
    if (_checkData()) {
      await _activate();
    }
  }

  bool _checkData() {
    _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
      if(_code.length==4){
        return true;
      }
    showSnackBar(context,
        message:'code is bot correct' , error:true);
      return false;

    // showSnackBar(context, message: 'Enter required data!', error: true);

  }

  Future<void> _activate() async {
    ApiResponse apiResponse = await AuthApiController().activate(
        code:_code,
        mobile: _mobileTextController.text);
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/login_screen');
      showSnackBar(context,
          message: apiResponse.message, error: !apiResponse.success);
    }else{
      showSnackBar(context,
          message: apiResponse.message, error: !apiResponse.success);
    }

  }
}
