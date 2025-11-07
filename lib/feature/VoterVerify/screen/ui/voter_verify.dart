import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/core/app_text_field.dart';
import 'package:evote_web/app/widgets/app_daialogue_for_voter.dart';
import 'package:evote_web/app/widgets/no_details.dart';
import 'package:evote_web/feature/Home/screen/widget/app_to_bar.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:evote_web/feature/VoterVerify/bloc/vverify_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VoterVerify extends StatefulWidget {
  const VoterVerify({super.key});

  @override
  State<VoterVerify> createState() => _VoterVerifyState();
}

class _VoterVerifyState extends State<VoterVerify> {
  final TextEditingController candCtrl = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
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
                  valid: (value) {
                    // Check if empty
                    if (value == null || value.trim().isEmpty) {
                      return 'NID cannot be empty';
                    }

                    // Check if only numbers
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'NID must contain only numbers';
                    }

                    // Optional: Check length (example: minimum 10 digits)
                    if (value.length < 10) {
                      return 'NID must be at least 10 digits long';
                    }

                    return null;
                  },
                ),
                Gap(28.r),
                BlocConsumer<VverifyBloc, VverifyState>(
                  listener: (context, state) {
                    if (state is VverifyLoaded) {
                      AppDaialogueForVoter.showMyDialog(
                        context,
                        state.voterModel.nid,
                        state.voterModel.name,
                        state.voterModel.bDate,
                        state.voterModel.hasVoted,
                      );
                    }
                    if (state is VverifyError) {
                      NoDetails.showMyDialog(context, "No details Found");
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      btnText: "Verify",
                      onTap: () {
                        if (_fromKey.currentState!.validate()) {
                          context.read<VverifyBloc>().add(
                            FetchVoter(nid: candCtrl.text),
                          );
                        }
                      },
                    );
                  },
                ),
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
