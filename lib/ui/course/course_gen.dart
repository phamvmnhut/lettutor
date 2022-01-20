import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:lettutor/controller/course.dart';

import 'comp/course_card.dart';
import 'comp/course_gen_header.dart';

class CourseGenUI extends StatelessWidget {
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
    final CourseCtrl _courseCtrl = CourseCtrl.to;
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseGenHeader(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Recommend Course",
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
                child: CourseCard(course: _courseCtrl.courses[index]),
              ),
              itemCount: _courseCtrl.courses.length,
              mainAxisSpacing: 16,
            ),
          )
        ],
      ),
    );
  }
}
