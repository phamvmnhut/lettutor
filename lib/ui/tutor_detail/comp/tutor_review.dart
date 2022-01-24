import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:lettutor/models/feedback.dart';
import 'package:lettutor/utils/time_format.dart';

class TutorReviewList extends StatelessWidget {
  TutorReviewList({
    Key? key,
    required this.listFb,
  }) : super(key: key);

  final List<FeedbackModel> listFb;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return DraggableScrollableSheet(
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: listFb.isEmpty
              ? Center(child: Text("No reviews yet", style: textTheme.caption))
              : ListView.separated(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      _ReviewItem(review: listFb.elementAt(index)),
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.yellowAccent),
                  itemCount: listFb.length,
                ),
        );
      },
    );
  }
}

class _ReviewItem extends StatelessWidget {
  _ReviewItem({Key? key, required this.review}) : super(key: key);
  final FeedbackModel review;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(review.firstInfo!.name ?? ""),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(timeAgo(review.updatedAt)),
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
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          height: 30,
          width: 30,
          placeholder: 'assets/images/indicator.gif',
          image: review.firstInfo!.avatar ?? "",
          imageErrorBuilder: (context, _, strace) => Image.asset(
              "assets/images/indicator.gif",
              height: 30,
              width: 30,
              fit: BoxFit.cover),
        ),
      ),
      subtitle: Text(review.content, style: textTheme.caption),
    );
  }
}
