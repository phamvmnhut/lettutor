import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:lettutor/features/tutor.dart';
import 'package:lettutor/models/tutor.dart';

import 'tutor_card.dart';

class TutorGrid extends StatelessWidget {
  TutorGrid({Key? key, required this.tutors}) : super(key: key);
  List<TutorModel>? tutors;
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
    return SliverStaggeredGrid.countBuilder(
              crossAxisCount: count,
              staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                // child: new TutorCard(tutorIndex: index),
                child: Text("anc"),
              ),
              itemCount: tutors == null ? 0 : tutors!.length,
              mainAxisSpacing: 16,
            );
  }
}
