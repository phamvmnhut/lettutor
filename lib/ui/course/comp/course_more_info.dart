import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/course.dart';

class CourseMoreInfo extends StatelessWidget {
  CourseMoreInfo({Key? key, required this.course}) : super(key: key);

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    Color priColor = Theme.of(context).primaryColor;
    Color bgColor = Theme.of(context).backgroundColor;
    Color cardColor = Theme.of(context).cardColor;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Overview", style: textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.queue_sharp,
                      color: Colors.redAccent,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Why take this course",
                            style: textTheme.headline4),
                        SizedBox(
                          width: 270,
                          child: Text(course.purpose ?? "",
                              style: textTheme.caption),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.queue_sharp,
                      color: Colors.redAccent,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What will you be able to do",
                            style: textTheme.headline4),
                        SizedBox(
                          width: 270,
                          child: Text(course.reason ?? "",
                            style: textTheme.caption))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Text("Course Length", style: textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              course.topics!.length.toString() + " topic",
              style: textTheme.caption?.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
          Text("List Topic", style: textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: course.topics!
                  .mapIndexed((i, e) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(i.toString() + ". ", style: textTheme.headline4),
                          Text(e.name ?? "", style: textTheme.caption)
                        ],
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
