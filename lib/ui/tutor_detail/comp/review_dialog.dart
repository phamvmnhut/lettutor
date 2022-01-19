import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/feedback.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/components/custom_dialog.dart';
import 'package:lettutor/utils/time_format.dart';

class ReviewDialog extends StatelessWidget {
  ReviewDialog({Key? key, required this.listFb}) : super(key: key);

  final List<FeedbackModel> listFb;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return CustomDialog(
      title: "Orders Review",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          listFb.isEmpty
              ? Center(child: Text("No reviews yet", style: textTheme.caption))
              : ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      _ReviewItem(review: listFb.elementAt(index)),
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.yellowAccent),
                  itemCount: listFb.length,
                ),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  _ReviewItem({Key? key, required this.review}) : super(key: key);
  final FeedbackModel review;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(review.firstInfo!.name ?? "", style: textTheme.headline4),
            SizedBox(width: 10),
            Text(timeAgo(review.updatedAt),
                style:
                    textTheme.caption?.copyWith(fontStyle: FontStyle.italic)),
          ],
        ),
        RatingBarIndicator(
          direction: Axis.horizontal,
          rating: review.rating.toDouble(),
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 15.0,
        ),
        Flexible(child: Text(review.content, style: textTheme.caption)),
      ],
    );
  }
}
