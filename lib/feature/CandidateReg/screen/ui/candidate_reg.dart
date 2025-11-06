import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/core/app_text_field.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:evote_web/feature/CandidateReg/bloc/candidate_reg_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CandidateReg extends StatefulWidget {
  const CandidateReg({super.key});

  @override
  State<CandidateReg> createState() => _CandidateRegState();
}

class _CandidateRegState extends State<CandidateReg> {
  final TextEditingController namectrl = TextEditingController();
  final TextEditingController partyctrl = TextEditingController();
  final GlobalKey _formKey = GlobalKey();

  @override
  void dispose() {
    namectrl.dispose();
    partyctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<CandidateRegBloc, CandidateRegState>(
      listener: (context, state) {
        if (state is CandidateRegSuccess) {
          final msg =
              state.successMsg['message'] ??
              'Candidate registered successfully ✅';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(msg)));
          namectrl.clear();
          partyctrl.clear();
          // Navigate to another page if needed
          // context.go(AppRoutes.voterListRoutePath);
        } else if (state is CandidateRegFailed) {
          final msg = state.failedMsg['error'] ?? 'Registration failed ❌';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(msg)));
        }
      },
      builder: (context, state) {
        if (state is CandidateRegLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: AppColor.bgColor,
          body: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Register New Candidate",
                    style: TextStyle(
                      color: AppColor.appbarBgColor,
                      fontSize: 56.r,
                    ),
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
                          Gap(48.r),
                          AppTextField(
                            textEditingController: partyctrl,
                            hintText: "Enter Your Party Name",
                          ),
                          Gap(16.r),
                          AppTextField(
                            textEditingController: namectrl,
                            hintText: "Enter Your Name",
                          ),
                          Gap(16.r),

                          Gap(16.r),
                          Spacer(),
                          AppButton(
                            btnText: "Register Candidate",
                            onTap: () => context.read<CandidateRegBloc>().add(
                              CandidateRegisterEvent(
                                name: namectrl.text.trim(),
                                party: partyctrl.text.trim(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
