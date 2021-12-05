import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/features/tutor.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/utils/routes/routes.dart';

import 'report_dialog.dart';
import 'review_dialog.dart';

class IntroTutorInfo extends StatelessWidget {
  IntroTutorInfo({Key? key, required this.tutorIndex}) : super(key: key);
  final int tutorIndex;
  final TutorCtrl _tutorCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    String flagString = 'icons/flags/svg/vn.svg';
    void _onPressReviewBtn() =>
        showDialog(context: context, builder: (context) => ReviewDialog());
    void _onPressReportBtn() => showDialog(
          context: context,
          builder: (context) => ReportDialog(),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios))
          ],
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                height: 100,
                width: 100,
                placeholder: 'assets/images/indicator.gif',
                image: _tutorCtrl.tutors[tutorIndex].avtUrl,
                imageErrorBuilder: (context, intance, strace) => Image.asset(
                    "assets/images/indicator.gif",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_tutorCtrl.tutors[tutorIndex].name,
                    style: textTheme.headline2),
                RatingBar.builder(
                  initialRating: _tutorCtrl.tutors[tutorIndex].rate,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (double value) {
                    print("rate");
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 30,
                      child: SvgPicture.asset(
                          flagString.replaceAll(
                              "vn", _tutorCtrl.tutors[tutorIndex].country.code),
                          package: 'country_icons'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      _tutorCtrl.tutors[tutorIndex].country.name,
                      style: textTheme.caption
                          ?.copyWith(fontStyle: FontStyle.italic),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text(_tutorCtrl.tutors[tutorIndex].des, style: textTheme.caption),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.message_chat);
                    },
                    icon: Icon(Icons.chat_outlined, size: 16),
                    label: Text(
                      "Chat",
                      style: textTheme.bodyText2,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    print("Love");
                    _tutorCtrl.toggleFav(tutorIndex);
                  },
                  icon: Obx(
                    () => Icon(
                      Icons.favorite_border_outlined,
                      color: _tutorCtrl.tutors[tutorIndex].isFav
                          ? Colors.red
                          : null,
                    ),
                  ),
                  label: Text(
                    "Love",
                    style: textTheme.bodyText2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      _onPressReportBtn();
                    },
                    icon: Icon(Icons.report_gmailerrorred_outlined, size: 16),
                    label: Text(
                      "Report",
                      style: textTheme.bodyText2,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      _onPressReviewBtn();
                    },
                    icon: Icon(Icons.star_border_outlined, size: 16),
                    label: Text(
                      "Rate",
                      style: textTheme.bodyText2,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
