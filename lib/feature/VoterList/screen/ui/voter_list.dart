import 'package:evote_web/app/utils/app_color.dart';
import 'package:evote_web/feature/Home/screen/widget/app_to_bar.dart';
import 'package:evote_web/feature/VoterList/bloc/voter_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VoterList extends StatelessWidget {
  const VoterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToBar(text: "Voter List"),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.75,

          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(28.h),
              Text("Details Of Voters", style: TextStyle(fontSize: 20.r)),
              Divider(),
              Expanded(
                child: BlocBuilder<VoterListBloc, VoterListState>(
                  builder: (context, state) {
                    if (state is VoterLoaded) {
                      return ListView.builder(
                        itemCount: state.voters.length,
                        itemBuilder: (context, count) {
                          bool voted = state.voters[count].hasVoted;
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.1),
                              color: voted ? Colors.greenAccent : Colors.red,
                            ),
                            child: ListTile(
                              leading: Text(
                                "Voter Id: ${state.voters[count].id}",
                                style: TextStyle(
                                  color: !voted
                                      ? AppColor.appbarBgColor
                                      : AppColor.bgColor,
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 20).w,
                                child: Text(
                                  "Voter Name: ${state.voters[count].name}",
                                  style: TextStyle(
                                    color: !voted
                                        ? AppColor.appbarBgColor
                                        : AppColor.bgColor,
                                  ),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 20).w,
                                child: Text(
                                  "Birth Date: ${state.voters[count].birthDate}",
                                  style: TextStyle(
                                    fontSize: 12.r,
                                    color: !voted
                                        ? AppColor.appbarBgColor
                                        : AppColor.bgColor,
                                  ),
                                ),
                              ),
                              trailing: Text(
                                "Has Voted: ${state.voters[count].hasVoted}",
                                style: TextStyle(
                                  color: !voted
                                      ? AppColor.appbarBgColor
                                      : AppColor.bgColor,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state is VoterLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is VoterError) {
                      return Center(child: Text("Error: ${state.message}"));
                    } else {
                      return Center(child: Text("No data Loaded"));
                    }
                  },
                ),
              ),
              Gap(18.h),
            ],
          ),
        ),
      ),
    );
  }
}
