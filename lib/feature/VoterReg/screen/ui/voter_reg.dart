import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/core/app_text_field.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:evote_web/feature/VoterReg/bloc/voter_reg_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return BlocConsumer<VoterRegBloc, VoterRegState>(
      listener: (context, state) {
        if (state is VoterRegisterSuccessState) {
          final msg =
              state.successMessage['message'] ??
              'Voter registered successfully ✅';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg, style: TextStyle(color: AppColor.bgColor)),
              backgroundColor: AppColor.green,
            ),
          );
          namectrl.clear();
          nidctrl.clear();
          birthctrl.clear();
          // Navigate to another page if needed
          // context.go(AppRoutes.voterListRoutePath);
        } else if (state is VoterRegisterFailedState) {
          final msg = state.failedMessage['error'] ?? 'Registration failed ❌';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg), backgroundColor: AppColor.buttonColor),
          );
        }
      },
      builder: (context, state) {
        if (state is VoterRegisterLoadingState) {
          return const CircularProgressIndicator();
        }
        return Scaffold(
          backgroundColor: AppColor.bgColor,
          body: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Register New Voter",
                    style: TextStyle(
                      color: AppColor.appbarBgColor,
                      fontSize: 56.r,
                    ),
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
                            valid: (value) {
                              // Check if empty
                              if (value == null || value.trim().isEmpty) {
                                return 'NID cannot be empty';
                              }
                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return 'NID must contain only numbers';
                              }

                              if (value.length < 10) {
                                return 'NID must be at least 10 digits long';
                              }

                              return null;
                            },
                          ),
                          Gap(16.r),
                          AppTextField(
                            textEditingController: namectrl,
                            hintText: "Enter Your Name",
                            valid: (value) {
                              // Check if empty
                              if (value == null || value.trim().isEmpty) {
                                return 'Name cannot be empty';
                              }

                              return null;
                            },
                          ),
                          Gap(16.r),
                          AppTextField(
                            textEditingController: birthctrl,
                            hintText: "Enter Your Birth Day (dd/mm/yyyy)",
                            valid: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Birth date cannot be empty';
                              }

                              // Check pattern dd/mm/yyyy
                              final regex = RegExp(
                                r'^(0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[0-2])[\/](19|20)\d{2}$',
                              );
                              if (!regex.hasMatch(value)) {
                                return 'Enter a valid date in dd/mm/yyyy format';
                              }

                              try {
                                final parts = value.split('/');
                                final day = int.parse(parts[0]);
                                final month = int.parse(parts[1]);
                                final year = int.parse(parts[2]);
                                final date = DateTime(year, month, day);

                                // Validate logical correctness (e.g., no 31 Feb)
                                if (date.day != day ||
                                    date.month != month ||
                                    date.year != year) {
                                  return 'Invalid date entered';
                                }
                              } catch (e) {
                                return 'Invalid date entered';
                              }

                              return null;
                            },
                          ),
                          Gap(16.r),
                          Spacer(),
                          AppButton(
                            btnText: "Register Voter",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<VoterRegBloc>().add(
                                  VoterRegisterEvent(
                                    nid: nidctrl.text.trim(),
                                    name: namectrl.text.trim(),
                                    birthDate: birthctrl.text,
                                  ),
                                );
                              }
                            },
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
