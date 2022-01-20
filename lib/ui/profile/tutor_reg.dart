import 'dart:math';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import './comp/turtor_reg_cv_form.dart';
import './comp/turtor_reg_teaching_form.dart';
import './comp/tutor_reg_header.dart';

import 'package:lettutor/ui/components/background.dart';

class TutorRegUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Material(
      child: KeyboardDismisser(
        child: Background.another2(
          child: CustomScrollView(
            slivers: <Widget>[
              const TutorRegHeader(),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 40,
                  maxHeight: 70,
                  child: Container(
                    color: cardColor,
                    child: Center(
                      child: Text("CV Info", style: textTheme.headline4),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: TutorRegCVForm()),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 40,
                  maxHeight: 70,
                  child: Container(
                    color: cardColor,
                    child: Center(
                      child: Text("Teaching skill", style: textTheme.headline4),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: TutorRegTeachingForm()),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 40,
                  maxHeight: 70,
                  child: Container(
                    color: cardColor,
                    child: Center(
                      child: Text("Introduction video",
                          style: textTheme.headline4),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
                        style: textTheme.caption,
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          child: Text(
                            "Upload Video",
                            style: textTheme.subtitle1,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 40,
                  maxHeight: 70,
                  child: Container(
                    color: cardColor,
                    child: Center(
                      child: Text("Process", style: textTheme.headline4),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        child: Text(
                          "Register Submit",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  // 2
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  // 3
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
