import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/components/custom_dialog.dart';
import 'package:lettutor/utils/time_format.dart';

class ReviewDialog extends StatelessWidget {
  ReviewDialog({Key? key}) : super(key: key);

  final List<ReviewModel> reviewList = LocalData.reviewList;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return CustomDialog(
      title: "Orders Review",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          reviewList.isEmpty
              ? Center(child: Text("No reviews yet", style: textTheme.caption))
              : ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      _ReviewItem(review: reviewList.elementAt(index)),
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.yellowAccent),
                  itemCount: reviewList.length,
                ),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  _ReviewItem({Key? key, required this.review}) : super(key: key);
  final ReviewModel review;

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
            Text(review.name, style: textTheme.headline4),
            SizedBox(width: 10),
            Text(timeAgo(review.time),
                style:
                    textTheme.caption?.copyWith(fontStyle: FontStyle.italic)),
          ],
        ),
        RatingBar.builder(
          initialRating: review.rating,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemSize: 16,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (double value) {
            print("rating update");
          },
        ),
        Flexible(child: Text(review.comment, style: textTheme.caption)),
      ],
    );
  }
}
