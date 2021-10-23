import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorRegHeader extends StatelessWidget {
  const TutorRegHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return SliverAppBar(
      title: Center(
        child: Text(
          "Tutor Register",
          style: textTheme.headline2?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: priColor,
      centerTitle: true,
      expandedHeight: 170.0,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 70),
            Text("1. Set up your CV", style: textTheme.headline3),
            Text("2. Video introduction", style: textTheme.headline3),
            Text("3. Complete", style: textTheme.headline3),
          ],
        ),
      ),
    );
  }
}
