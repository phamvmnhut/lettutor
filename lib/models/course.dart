class CourseModel {
  final String id;
  final String image;
  final String title;
  final String des;
  final String level;

  CourseModel(
      {required this.id,
        required this.image,
      required this.title,
      required this.des,
      required this.level});
}

class CourseDetailOverviewModel {
  final String title;
  final String ans;

  CourseDetailOverviewModel({required this.title, required this.ans});
}

class CourseDetailModel {
  final CourseModel course;
  final List<CourseDetailOverviewModel> overview;
  final int length;
  final List<String> listTopic;

  CourseDetailModel(
      {required this.course,
      required this.overview,
      required this.length,
      required this.listTopic});
}
