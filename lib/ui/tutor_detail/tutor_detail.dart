import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lettutor/controller/tutor.dart';
import 'package:lettutor/models/tutor_detail.dart';
import 'package:lettutor/ui/tutor_detail/comp/tutor_calendar_dialog.dart';
import 'package:lettutor/ui/tutor_gen/comp/specialities_list.dart';
import 'package:lettutor/utils/routes/routes.dart';

import 'comp/intro_tutor_info.dart';
import 'comp/intro_tutor_video.dart';

class TutorDetailUI extends StatelessWidget {
  TutorDetailUI({Key? key, required this.data}) : super(key: key);

  final TutorDetailModel data;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;

    List<Widget> listW1 = [IntroTutorInfo(data: data), IntroTutorVideo(data: data)];

    void _onPressBookBtn() => showDialog(
      context: context,
      builder: (context) => TutorCalendarDialog(),
    );
    TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverStaggeredGrid.countBuilder(
              crossAxisCount: widthSize > 700 ? 2 : 1,
              staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: listW1[index],
              ),
              itemCount: 2,
              mainAxisSpacing: 16,
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      TutorCtrl.to.navigateBook(data.userId);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Text(
                        "Book Now",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text("Language", style: textTheme.headline3),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SpecicalitiesList(listSpec: data.languages.split(","),),
                    ),
                    SizedBox(height: 10),
                    Text("Major", style: textTheme.headline3),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SpecicalitiesList(listSpec: data.education.split(","),)
                    ),
                    SizedBox(height: 10),
                    Text("Hobby", style: textTheme.headline3),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data.interests, style: textTheme.caption),
                    ),
                    SizedBox(height: 10),
                    Text("Work Experience", style: textTheme.headline3),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.experience ?? "",
                        style: textTheme.caption,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
