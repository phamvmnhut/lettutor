import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/features/tutor.dart';

import 'comp/tutor_gen_header.dart';
import 'comp/tutor_grid.dart';
import 'comp/specialities_list.dart';

class TutorGenUI extends StatelessWidget {
  TutorGenUI({Key? key}) : super(key: key);

  final tutorCtrl = Get.put(TutorCtrl());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TutorGenHeader(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Find Tutor",
                              style: Theme.of(context).textTheme.headline2),
                          TextButton(
                              onPressed: () {
                                tutorCtrl.navigateSearch("");
                              }, child: Text("Search more"))
                        ],
                      ),
                      SizedBox(height: 10),
                      SpecicalitiesList(),
                      SizedBox(height: 10),
                      Text("Recommend Tutor",
                          style: Theme.of(context).textTheme.headline3),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TutorGrid(),
        ],
      ),
    );
  }
}
