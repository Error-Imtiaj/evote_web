import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:evote_web/app/utils/app_routes.dart';
import 'package:evote_web/feature/CandidateList/bloc/candidate_list_bloc.dart';
import 'package:evote_web/feature/VoterList/bloc/voter_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdminPortal extends StatelessWidget {
  const AdminPortal({super.key});

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
                "Welcome Back \nChief!",
                style: TextStyle(color: AppColor.appbarBgColor, fontSize: 56.r),
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
                child: Column(
                  children: [
                    Gap(64.r),
                    homeTitle(),
                    Gap(32.r),
                    AppButton(
                      btnText: "Voter Register",
                      onTap: () => context.push(AppRoutes.voterRegRoutPath),
                    ),
                    Gap(16.r),
                    AppButton(
                      btnText: "Candidate Register",
                      onTap: () => context.push(AppRoutes.candidateRegRoutPath),
                    ),
                    Gap(16.r),
                    BlocConsumer<CandidateListBloc, CandidateListState>(
                      listener: (context, state) {
                        if (state is CandidateListLoaded) {
                          context.push(AppRoutes.candidateListRoutePath);
                        }
                      },
                      builder: (context, state) {
                        if (state is CandidateListLoading) {
                          return const CircularProgressIndicator();
                        }
                        if (state is CandidateListError) {
                          return Text("Error: ${state.errorMessage}");
                        }
                        return AppButton(
                          btnText: "Candidate List",
                          onTap: () => context.read<CandidateListBloc>().add(
                            FetchCandidate(),
                          ),
                        );
                      },
                    ),
                    Gap(16.r),
                    BlocConsumer<VoterListBloc, VoterListState>(
                      listener: (context, state) {
                        if (state is VoterLoaded) {
                          context.push(AppRoutes.voterListRoutePath);
                        }
                      },
                      builder: (BuildContext context, VoterListState state) {
                        if (state is VoterLoading) {
                          return const CircularProgressIndicator();
                        }
                        if (state is VoterError) {
                          return Text("Error: ${state.message}");
                        }
                        return AppButton(
                          btnText: "Voter List",
                          onTap: () =>
                              context.read<VoterListBloc>().add(FetchVoters()),
                        );
                      },
                    ),
                    Gap(16.r),
                    AppButton(
                      btnText: "Candidate Verify",
                      onTap: () =>
                          context.push(AppRoutes.candidateVerifyRoutePath),
                    ),
                    Gap(16.r),
                    AppButton(
                      btnText: "Voter Verify",
                      onTap: () => context.push(AppRoutes.voterVerifyRoutePath),
                    ),
                    Spacer(),
                    AppButton(
                      btnText: "Logout",
                      onTap: () {
                        context.go(AppRoutes.initialRoutePath);
                      },
                    ),
                  ],
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
      "Select Your Operation",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
