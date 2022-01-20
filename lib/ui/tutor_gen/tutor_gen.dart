import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lettutor/controller/tutor.dart';
import './comp/tutor_card.dart';

import 'comp/tutor_gen_header.dart';
import 'comp/specialities_list.dart';

class TutorGenUI extends StatelessWidget {
  TutorGenUI({Key? key}) : super(key: key);
  final TutorCtrl _tutorCtrl = TutorCtrl.to;

  @override
  Widget build(BuildContext context) {
    double withSize = MediaQuery.of(context).size.width;
    int count = withSize > 700
        ? withSize > 1100
            ? withSize > 1400
                ? 4
                : 3
            : 2
        : 1;
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
                          TextButton(
                            onPressed: () {
                              _tutorCtrl.getListTutor();
                            },
                            child: Text("Find Tutor",
                                style: Theme.of(context).textTheme.headline2),
                          ),
                          TextButton(
                              onPressed: () {
                                _tutorCtrl.navigateSearch("");
                              },
                              child: Text(
                                "Search more",
                                style: Theme.of(context).textTheme.caption,
                              ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Obx(
                        () => SpecicalitiesList(
                          listSpec: _tutorCtrl.listSpec.toList(),
                        )..selectClick = (text) {
                            _tutorCtrl.filterBySpecify(text);
                          },
                      ),
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
          Obx(
            () => SliverStaggeredGrid.countBuilder(
              crossAxisCount: count,
              staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TutorCard(tutor: _tutorCtrl.tutors[index])),
              itemCount: _tutorCtrl.tutors.length,
              mainAxisSpacing: 16,
            ),
          )
        ],
      ),
    );
  }
}
