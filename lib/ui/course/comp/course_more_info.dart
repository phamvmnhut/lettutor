import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/course.dart';

class CourseMoreInfo extends StatelessWidget {
  CourseMoreInfo({Key? key, required this.courseId}) : super(key: key);
  final String courseId;

  @override
  Widget build(BuildContext context) {
    Color priColor = Theme.of(context).primaryColor;
    Color bgColor = Theme.of(context).backgroundColor;
    Color cardColor = Theme.of(context).cardColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    CourseDetailModel courseDetail = LocalData.coureDetailEx;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Overview", style: textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: courseDetail.overview
                  .map((e) => Row(
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
                              Text(e.title, style: textTheme.headline4),
                              Text(e.ans, style: textTheme.caption)
                            ],
                          )
                        ],
                      ))
                  .toList(),
            ),
          ),
          Text("Course Length", style: textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              courseDetail.length.toString() + " topic",
              style: textTheme.caption?.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
          Text("List Topic", style: textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: courseDetail.listTopic
                  .mapIndexed((i, e) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(i.toString() + ". ", style: textTheme.headline4),
                          Text(e, style: textTheme.caption)
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
