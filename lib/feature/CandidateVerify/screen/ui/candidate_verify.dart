import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/core/app_text_field.dart';
import 'package:evote_web/app/widgets/app_dialogue_for_candidate.dart';
import 'package:evote_web/app/widgets/no_details.dart';
import 'package:evote_web/feature/CandidateVerify/bloc/cd_verify_bloc.dart';
import 'package:evote_web/feature/Home/screen/widget/app_to_bar.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CandidateVerify extends StatefulWidget {
  const CandidateVerify({super.key});

  @override
  State<CandidateVerify> createState() => _CandidateVerifyState();
}

class _CandidateVerifyState extends State<CandidateVerify> {
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
      appBar: AppToBar(text: 'Enter Your Candiate ID to verify'),
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
                  hintText: "Enter Your Candidate ID",
                  valid: (value) {
                    // Check if empty
                    if (value == null || value.trim().isEmpty) {
                      return 'ID cannot be empty';
                    }

                    // Check if only numbers
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'NID must contain only numbers';
                    }

                    return null;
                  },
                ),
                Gap(28.r),
                BlocConsumer<CdVerifyBloc, CdVerifyState>(
                  listener: (context, state) {
                    if (state is CdVerifyLoaded) {
                      AppDialogue.showMyDialog(
                        context,
                        state.candidate.id,
                        state.candidate.party,
                        state.candidate.name,
                      );
                    }
                    if (state is CdVerifyError) {
                      NoDetails.showMyDialog(context, "No details Found");
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      btnText: "Verify",
                      onTap: () {
                        if (_fromKey.currentState!.validate()) {
                          context.read<CdVerifyBloc>().add(
                            FetchCandidate(id: int.parse(candCtrl.text)),
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
      "Verify Candidate Details",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
