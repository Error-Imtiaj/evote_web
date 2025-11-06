import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/core/app_text_field.dart';
import 'package:evote_web/feature/Home/screen/widget/app_to_bar.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VoterVerify extends StatefulWidget {
  const VoterVerify({super.key});

  @override
  State<VoterVerify> createState() => _VoterVerifyState();
}

class _VoterVerifyState extends State<VoterVerify> {
  final TextEditingController candCtrl = TextEditingController();
  final GlobalKey _fromKey = GlobalKey();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    candCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppToBar(text: 'Enter Your NID to verify'),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: AppColor.appbarBgColor,
            //borderRadius: BorderRadius.circular(24.r),
            border: Border(
              bottom: BorderSide(width: 8.r, color: AppColor.buttonColor),
              right: BorderSide(width: 8.r, color: AppColor.buttonColor),
            ),
          ),
          width: 600.r,
          height: 500.r,
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                Gap(40.r),
                homeTitle(),
                Gap(40.r),
                // textfield
                AppTextField(
                  textEditingController: candCtrl,
                  hintText: "Enter Your NID",
                ),
                Gap(28.r),
                AppButton(btnText: "Verify"),
                Spacer(),
                Gap(28.r),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homeTitle() {
    return Text(
      "Verify Voter Details",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
