import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:lettutor/features/tutor.dart';
import 'package:lettutor/ui/tutor_gen/comp/specialities_list.dart';

class TutorCard extends StatelessWidget  {
  TutorCard({Key? key, required this.tutorIndex}) : super(key: key);
  final int tutorIndex;

  @override
  Widget build(BuildContext context) {
    final TutorCtrl _tutorCtrl = Get.find();

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
              icon: Obx(()=>Icon(
                Icons.favorite_border_outlined,
                color: _tutorCtrl.tutors[tutorIndex].isFav ? Colors.red : null,
              ),),
              tooltip: 'Favorite',
              onPressed: () {
                print("favorite click");
                _tutorCtrl.toggleFav(tutorIndex);
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
                      image: _tutorCtrl.tutors[tutorIndex].avtUrl,
                      imageErrorBuilder: (context, intance, strace) =>
                          Image.asset("assets/images/indicator.gif",
                              height: 50, width: 50, fit: BoxFit.cover),
                    ),
                  ),
                  title: TextButton(
                    onPressed: () {
                      _tutorCtrl.navigateDetail(tutorIndex);
                    },
                    child: Text(
                      _tutorCtrl.tutors[tutorIndex].name,
                      style: textTheme.headline3,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 30,
                      child: SvgPicture.asset(
                          flagString.replaceAll("vn", _tutorCtrl.tutors[tutorIndex].country.code),
                          package: 'country_icons'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      _tutorCtrl.tutors[tutorIndex].country.name,
                      style: textTheme.caption
                          ?.copyWith(fontStyle: FontStyle.italic),
                    ),
                    Spacer(),
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
                        print("rating update");
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [SpecicalitiesList()..listSpec = _tutorCtrl.tutors[tutorIndex].specList],
                ),
                SizedBox(height: 10),
                Text(
                  _tutorCtrl.tutors[tutorIndex].des,
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
