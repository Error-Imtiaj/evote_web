import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/core/app_text_field.dart';
import 'package:evote_web/app/utils/app_routes.dart';
import 'package:evote_web/feature/CandidateList/bloc/candidate_list_bloc.dart';
import 'package:evote_web/feature/Home/screen/widget/app_to_bar.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nidctrl = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppToBar(text: 'Welcome to the E-Voting System'),
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
                  textEditingController: nidctrl,
                  hintText: "Enter Your 10 Digit NID",
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
                Gap(28.r),
                BlocListener<CandidateListBloc, CandidateListState>(
                  listener: (context, state) {
                    if (state is CandidateListLoaded) {
                      context.go('${AppRoutes.voteRoutePath}/${nidctrl.text}');
                    }
                  },
                  child: AppButton(
                    btnText: "Next",
                    onTap: () {
                      if (_fromKey.currentState!.validate()) {
                        context.read<CandidateListBloc>().add(FetchCandidate());
                      }
                    },
                  ),
                ),
                Spacer(),
                AppButton(
                  btnText: "Admin Login",
                  onTap: () => context.push(AppRoutes.adminRoutePath),
                ),
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
      "Please Enter Your NID",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
