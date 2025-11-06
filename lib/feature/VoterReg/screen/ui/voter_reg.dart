import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/core/app_text_field.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VoterReg extends StatefulWidget {
  const VoterReg({super.key});

  @override
  State<VoterReg> createState() => _VoterRegState();
}

class _VoterRegState extends State<VoterReg> {
  final TextEditingController nidctrl = TextEditingController();
  final TextEditingController namectrl = TextEditingController();
  final TextEditingController birthctrl = TextEditingController();
  final GlobalKey _formKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    namectrl.dispose();
    nidctrl.dispose();
    birthctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Register New Voter",
                style: TextStyle(color: AppColor.appbarBgColor, fontSize: 56.r),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: double.maxFinite,
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
              color: AppColor.appbarBgColor,
              border: Border(
                left: BorderSide(color: AppColor.buttonColor, width: 4),
              ),
            ),
            child: Center(
              child: Container(
                height: screenHeight * 0.8,
                width: screenWidth * 0.3,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColor.bgColor, width: 2),
                    left: BorderSide(color: AppColor.bgColor, width: 2),
                    right: BorderSide(color: AppColor.bgColor, width: 6),
                    bottom: BorderSide(color: AppColor.bgColor, width: 6),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Gap(64.r),
                      homeTitle(),
                      Gap(32.r),
                      AppTextField(
                        textEditingController: nidctrl,
                        hintText: "Enter Your NID",
                      ),
                      Gap(16.r),
                      AppTextField(
                        textEditingController: namectrl,
                        hintText: "Enter Your Name",
                      ),
                      Gap(16.r),
                      AppTextField(
                        textEditingController: birthctrl,
                        hintText: "Enter Your Birth Day (dd/mm/yyyy)",
                      ),
                      Gap(16.r),
                      Spacer(),
                      AppButton(btnText: "Register Voter"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget homeTitle() {
    return Text(
      "Write your correct information",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
