import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/tutor_detail/comp/tutor_calendar_dialog.dart';
import 'package:lettutor/utils/routes/routes.dart';

import 'comp/info_more_tutor.dart';
import 'comp/intro_tutor_info.dart';
import 'comp/intro_tutor_video.dart';

class TutorDetailUI extends StatelessWidget {
  TutorDetailUI({Key? key}) : super(key: key);
  TutorDetailModel tutorDetail = LocalData.tutorDetail;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;

    List<Widget> listW1 = [IntroTutorInfo(), IntroTutorVideo()];

    void _onPressBookBtn() => showDialog(
      context: context,
      builder: (context) => TutorCalendarDialog(),
    );
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverStaggeredGrid.countBuilder(
            crossAxisCount: widthSize > 800 ? 2 : 1,
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
                    Navigator.pushNamed(context, Routes.tutor_calendar);
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
            child: InfoMoreTutor(),
          ),
        ],
      ),
    );
  }
}
