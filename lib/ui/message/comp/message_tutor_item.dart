import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';

class MessageTutorItem extends StatelessWidget {
  MessageTutorItem(
      {Key? key,
      required this.tutor,
      required this.trailing,
      this.onTap})
      : super(key: key);
  final TutorModel tutor;
  final Widget trailing;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          height: 40,
          width: 40,
          placeholder: 'assets/images/indicator.gif',
          image: tutor.avatar ?? "",
          imageErrorBuilder: (context, intance, strace) =>
              Image.asset("assets/images/indicator.gif", fit: BoxFit.cover),
        ),
      ),
      title: Text(tutor.name ?? "", style: textTheme.headline4),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
