import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:expandable/expandable.dart';

import 'package:lettutor/ui/course/comp/course_more_info.dart';
import 'package:lettutor/ui/tutor_gen/comp/specialities_list.dart';
import 'package:lettutor/utils/ex.dart';
import 'package:lettutor/utils/routes/routes.dart';

class CourseCard extends StatefulWidget {
  CourseCard({Key? key, required this.course}) : super(key: key);
  final CourseModel course;

  @override
  _State createState() => _State();
}

class _State extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    Color priColor = Theme.of(context).primaryColor;
    Color bgColor = Theme.of(context).backgroundColor;
    Color cardColor = Theme.of(context).cardColor;
    String flagString = 'icons/flags/svg/vn.svg';
    TextTheme textTheme = Theme.of(context).textTheme;
    return ExpandableNotifier(
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(width: 0.5, color: priColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  placeholder: 'assets/images/indicator.gif',
                  image: widget.course.image,
                  imageErrorBuilder: (context, intance, strace) => Image.asset(
                      "assets/images/indicator.gif",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                child: Text(widget.course.title,
                    style: textTheme.headline3, maxLines: 2),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SpecicalitiesList()..listSpec = [widget.course.level]
                ],
              ),
              SizedBox(height: 10),
              Flexible(
                child: Text(
                  widget.course.des,
                  style: textTheme.caption,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var controller =
                          ExpandableController.of(context, required: true)!;
                      return TextButton(
                        child: Text(
                          controller.expanded ? "Collapse" : "Expand",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        onPressed: () {
                          controller.toggle();
                        },
                      );
                    },
                  ),
                  SizedBox(width: 5),
                  ElevatedButton.icon(
                      icon: Icon(Icons.library_add_check_outlined,
                          size: 16.0, color: bgColor),
                      label: Text('Learn'),
                      onPressed: () {}),
                ],
              ),
              SizedBox(height: 10),
              ScrollOnExpand(
                child: Expandable(
                    collapsed: Container(),
                    expanded: CourseMoreInfo(
                      courseId: widget.course.id,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
