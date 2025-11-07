import 'package:evote_web/feature/CandidateList/bloc/candidate_list_bloc.dart';
import 'package:evote_web/feature/Home/screen/widget/app_to_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CandidateList extends StatelessWidget {
  const CandidateList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToBar(text: "Candidate List"),
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
              Text("Details Of Candidate", style: TextStyle(fontSize: 20.r)),
              Divider(),
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
                            ),
                            child: ListTile(
                              titleAlignment: ListTileTitleAlignment.center,
                              style: ListTileStyle.list,
                              leading: Text("Candidate Id: ${candidates.id}"),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 20).w,
                                child: Text(
                                  "Candidate Name: ${candidates.name}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 20).w,
                                child: Text(
                                  "Party name: ${candidates.party}",
                                  style: TextStyle(fontSize: 12.r),
                                ),
                              ),
                              trailing: Text(
                                "Vote Count: ${candidates.voteCount}",
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
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Text("No Data Found"));
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
