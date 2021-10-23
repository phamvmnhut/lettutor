import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/tutor.dart';

import 'tutor_card.dart';

class TutorGrid extends StatelessWidget {
  TutorGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TutorModel> tutorList = LocalData.TutorListExample;
    double withSize = MediaQuery.of(context).size.width;
    int count = withSize > 700
        ? withSize > 1100
            ? withSize > 1400
                ? 4
                : 3
            : 2
        : 1;
    return SliverStaggeredGrid.countBuilder(
      crossAxisCount: count,
      staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: new TutorCard(tutor: tutorList[index]),
      ),
      itemCount: tutorList.length,
      mainAxisSpacing: 16,
    );
  }
}
