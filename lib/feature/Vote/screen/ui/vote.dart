import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:evote_web/app/utils/app_routes.dart';
import 'package:evote_web/feature/CandidateList/bloc/candidate_list_bloc.dart';
import 'package:evote_web/feature/Vote/bloc/vote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Vote extends StatefulWidget {
  final String nid;
  const Vote({super.key, required this.nid});

  @override
  State<Vote> createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  int? selectedCandidateId;
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
                "Time to change \nthe world",
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
                    Gap(56.r),
                    homeTitle(),
                    Gap(16.h),
                    Expanded(
                      child: BlocBuilder<CandidateListBloc, CandidateListState>(
                        builder: (context, state) {
                          if (state is CandidateListLoaded) {
                            return ListView.builder(
                              itemCount: state.candidate.length,
                              itemBuilder: (context, count) {
                                final candidates = state.candidate[count];
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1,
                                      style: BorderStyle.solid,
                                    ),
                                    color:
                                        (selectedCandidateId == candidates.id)
                                        ? AppColor.buttonColor
                                        : AppColor.appbarBgColor,
                                  ),
                                  child: ListTile(
                                    selected:
                                        selectedCandidateId == candidates.id,

                                    onTap: () {
                                      setState(() {
                                        selectedCandidateId = candidates.id;
                                      });
                                    },
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                    style: ListTileStyle.list,
                                    leading: Text(
                                      "Candidate Id: ${candidates.id}",
                                      style: TextStyle(
                                        color:
                                            !(selectedCandidateId ==
                                                candidates.id)
                                            ? AppColor.bgColor
                                            : AppColor.appbarBgColor,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ).w,
                                      child: Text(
                                        "Candidate Name: ${candidates.name}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              !(selectedCandidateId ==
                                                  candidates.id)
                                              ? AppColor.bgColor
                                              : AppColor.appbarBgColor,
                                        ),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ).w,
                                      child: Text(
                                        "Party name: ${candidates.party}",
                                        style: TextStyle(
                                          fontSize: 12.r,
                                          color:
                                              !(selectedCandidateId ==
                                                  candidates.id)
                                              ? AppColor.bgColor
                                              : AppColor.appbarBgColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          if (state is CandidateListError) {
                            return Center(
                              child: Text("Error: ${state.errorMessage}"),
                            );
                          }
                          if (state is CandidateListLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return const Center(child: Text("No Data Found"));
                          }
                        },
                      ),
                    ),

                    BlocConsumer<VoteBloc, VoteState>(
                      listener: (context, state) {
                        if (state is VoteSuccess) {
                          final msg = state.message;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                msg,
                                style: TextStyle(color: AppColor.bgColor),
                              ),
                              backgroundColor: AppColor.green,
                            ),
                          );
                          context.go(AppRoutes.initialRoutePath);
                        } else if (state is VoteError) {
                          final msg = state.detail;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(msg),
                              backgroundColor: AppColor.buttonColor,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return AppButton(
                          btnText: "Vote",
                          onTap: () {
                            context.read<VoteBloc>().add(
                              VoteDone(
                                nid: widget.nid,
                                candidateId: selectedCandidateId,
                              ),
                            );
                          },
                        );
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
      "Select Your Candidate",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
