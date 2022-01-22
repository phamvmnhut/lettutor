import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/utils/routes/routes.dart';

class TutorShortInfo extends StatelessWidget {
  TutorShortInfo({Key? key, required this.tutor}) : super(key: key);
  final TutorModel tutor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    String flagString = 'icons/flags/svg/vn.svg';

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                height: 40,
                width: 40,
                placeholder: 'assets/images/indicator.gif',
                image: tutor.avatar ?? "",
                imageErrorBuilder: (context, intance, strace) => Image.asset(
                    "assets/images/indicator.gif",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                print("go to tutor detail");
                Navigator.pushNamed(context, Routes.tutor_detail);
              },
              child: Text(
                tutor.name ?? "",
                style: textTheme.headline4,
                maxLines: 2,
              ),
            ),
          ],
        ),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     SizedBox(
        //       height: 15,
        //       width: 27.5,
        //       child: SvgPicture.asset(
        //           flagString.replaceAll("vn", tutor.country.code),
        //           package: 'country_icons'),
        //     ),
        //     SizedBox(width: 5),
        //     Text(
        //       tutor.country.name,
        //       style: textTheme.caption?.copyWith(fontStyle: FontStyle.italic),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
