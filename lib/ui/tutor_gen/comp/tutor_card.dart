import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:lettutor/features/tutor.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/tutor_gen/comp/specialities_list.dart';

import "dart:developer" as dev;

class TutorCard extends StatelessWidget {
  TutorCard({Key? key, required this.tutor}) : super(key: key);
  final TutorModel tutor;
  final TutorCtrl _tutorCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    Color priColor = Theme.of(context).primaryColor;
    Color bgColor = Theme.of(context).backgroundColor;
    Color cardColor = Theme.of(context).cardColor;
    String flagString = 'icons/flags/svg/vn.svg';
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(width: 0.5, color: priColor)),
      child: Stack(
        children: [
          Positioned(top: 0, left: 0, child: Text("Banner")),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: tutor.isFav.value ? Colors.red : null,
              ),
              tooltip: 'Favorite',
              onPressed: () {
                print("favorite click");
                _tutorCtrl.toggleFav(tutor.userId);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  horizontalTitleGap: 0,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                      placeholder: 'assets/images/indicator.gif',
                      image: tutor.avatar,
                      imageErrorBuilder: (context, _, strace) => Image.asset(
                          "assets/images/indicator.gif",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: TextButton(
                    onPressed: () {
                      _tutorCtrl.navigateDetail(tutor.userId);
                    },
                    child: Text(
                      tutor.name,
                      style: textTheme.headline3,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 30,
                      child: SvgPicture.asset(
                          flagString.replaceAll(
                              "vn", tutor.country.toLowerCase()),
                          package: 'country_icons'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      tutor.country,
                      style: textTheme.caption
                          ?.copyWith(fontStyle: FontStyle.italic),
                    ),
                    Spacer(),
                    RatingBarIndicator(
                      direction: Axis.horizontal,
                      rating: tutor.rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: SpecicalitiesList(
                    listSpec: (tutor.specialties ?? "").split(","),
                  ))
                ]),
                SizedBox(height: 10),
                Text(
                  tutor.bio,
                  style: Theme.of(context).textTheme.caption,
                  maxLines: 5,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton.icon(
                      icon: Icon(Icons.library_add_check_outlined,
                          size: 16.0, color: bgColor),
                      label: Text('Book'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.chat_outlined,
                        size: 16.0,
                        color: bgColor,
                      ),
                      label: Text('Chat'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
