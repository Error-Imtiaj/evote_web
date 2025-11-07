import 'package:evote_web/feature/Home/screen/widget/app_to_bar.dart';
import 'package:flutter/material.dart';
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
                child: ListView.builder(
                  itemCount: 17,
                  itemBuilder: (context, count) {
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
                        leading: Text("Candidate Id: 01"),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 20).w,
                          child: Text("Candidate Name: Hello"),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 20).w,
                          child: Text(
                            "Party name: Boat",
                            style: TextStyle(fontSize: 12.r),
                          ),
                        ),
                        trailing: Text("Vote Count: 17"),
                      ),
                    );
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
