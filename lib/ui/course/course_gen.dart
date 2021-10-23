import 'package:flutter/material.dart';

import 'comp/course_grid.dart';
import 'comp/course_gen_header.dart';

class CourseGenUI extends StatefulWidget {
  const CourseGenUI({Key? key}) : super(key: key);

  @override
  _CourseGenUIState createState() => _CourseGenUIState();
}

class _CourseGenUIState extends State<CourseGenUI> {
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
          CourseGrid(),
        ],
      ),
    );
  }
}
