import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/controller/tutor.dart';
import 'package:lettutor/models/tutor_detail.dart';
import 'package:lettutor/utils/routes/routes.dart';

import 'report_dialog.dart';
import 'review_dialog.dart';

class IntroTutorInfo extends StatelessWidget {
  IntroTutorInfo({Key? key, required this.data}) : super(key: key);

  final TutorDetailModel data;

  final TutorCtrl _tutorCtrl = TutorCtrl.to;

  @override
  Widget build(BuildContext context) {
    final isFav = data.isFavorite.obs;

    TextTheme textTheme = Theme.of(context).textTheme;
    String flagString = 'icons/flags/svg/vn.svg';
    void _onPressReviewBtn() =>
        showDialog(context: context, builder: (context) => ReviewDialog(listFb: data.feedbacks));
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
                image: data.user.avatar,
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
                Text(data.user.name, style: textTheme.headline2),
                RatingBarIndicator(
                  direction: Axis.horizontal,
                  rating: data.avgRating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 30,
                      child: SvgPicture.asset(
                          flagString.replaceAll("vn",
                              data.user.country.toLowerCase()),
                          package: 'country_icons'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      data.user.country,
                      style: textTheme.caption!.copyWith(fontStyle: FontStyle.italic),
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
          child: Text(data.bio, style: textTheme.caption),
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
                child: Obx(
                  () => ElevatedButton.icon(
                    onPressed: () {
                      print("Love");
                      _tutorCtrl.toggleFav(data.userId);
                      isFav.toggle();
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: isFav.value ? Colors.red : null,
                    ),
                    label: Text(
                      "Love",
                      style: textTheme.bodyText2,
                    ),
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
