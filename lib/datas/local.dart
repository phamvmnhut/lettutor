import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/index.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/user.dart';

class LocalData {
  static UserModel currentUser = UserModel(
    id: "123",
    name: "phamvmnhut",
    email: 'phamvmnhut@gmail.com',
    avatar:
        'https://media.istockphoto.com/photos/funny-raccoon-in-green-sunglasses-showing-a-rock-gesture-isolated-on-picture-id1154370446?k=20&m=1154370446&s=612x612&w=0&h=2AWvof66ovB87P3b7C_cu0pCZlZhDDFYUFr2KQ2UnwQ=',
    birthday: DateTime.utc(2000, 11, 5),
    phone: "0338473427",
    // roles: [""],
    timezone: 7,
    // isPhoneActivated: true,
    // isActivated: true,
  );

  static List<String> Specialities = [
    "Tất cả",
    "Tiếng Anh cho trẻ em",
    "Tiếng Anh cho công việc",
    "Giao tiếp",
    "PET",
    "TOIEC"
  ];

  static List<TutorModel> TutorListExample = [];

  static List<ReviewModel> reviewList = [
    ReviewModel(
      avatar: 'https://i.ytimg.com/vi/0Pi62B--4Ik/mqdefault.jpg',
      name: "Nguyễn Văn A",
      time: DateTime.utc(2021, 10, 6),
      rating: 5,
      comment: "Good",
    ),
    ReviewModel(
      avatar: 'https://i.ytimg.com/vi/0Pi62B--4Ik/mqdefault.jpg',
      name: "Nguyễn Văn A",
      time: DateTime.utc(2021, 10, 7),
      rating: 5,
      comment:
          "enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin",
    ),
    ReviewModel(
      avatar: 'https://i.ytimg.com/vi/0Pi62B--4Ik/mqdefault.jpg',
      name: "Nguyễn Văn A",
      time: DateTime.utc(2021, 10, 8),
      rating: 5,
      comment: "Sed nunc est, mollis non, cursus non, egestas a, dui.",
    ),
    ReviewModel(
      avatar: 'https://i.ytimg.com/vi/0Pi62B--4Ik/mqdefault.jpg',
      name: "Nguyễn Văn A",
      time: DateTime.utc(2021, 9, 10),
      rating: 5,
      comment: "lit elit fermentum risus, at fringilla purus mauris a nunc.",
    ),
    ReviewModel(
      avatar: 'https://i.ytimg.com/vi/0Pi62B--4Ik/mqdefault.jpg',
      name: "Nguyễn Văn A",
      time: DateTime.utc(2021, 9, 30),
      rating: 5,
      comment: "orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit",
    )
  ];

  static List<ScheduleModel> scheduleList = [
    ScheduleModel(
      id: "1",
      tutor: TutorListExample[0],
      startTime: DateTime.now().add(Duration(hours: 1)),
      endTime: DateTime.now().add(Duration(hours: 1, minutes: 30)),
      requirement: "Chủ đề: anh văn giao tiếp xã hội",
      rate: "Rate cho buoi hoc nay",
      isHistory: true,
    ),
    ScheduleModel(
      id: "2",
      tutor: TutorListExample[1],
      startTime: DateTime.now().add(Duration(hours: 2)),
      endTime: DateTime.now().add(Duration(hours: 2, minutes: 30)),
      requirement: "Tôi muốn buổi học thật hấp dẫn",
      rate: "Rate cho buoi hoc nay",
      isHistory: false,
    ),
    ScheduleModel(
      id: "2",
      tutor: TutorListExample[2],
      startTime: DateTime.now().add(Duration(hours: 4)),
      endTime: DateTime.now().add(Duration(hours: 4, minutes: 30)),
      requirement: "Tôi muốn buổi học thật hấp dẫn",
      rate: "Reviewed cho buổi học này",
      isHistory: false,
    ),
  ];

  static List<CourseModel> courseListExample = [
    CourseModel(
      id: "1",
      image:
          "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
      title: "This is title ebook",
      des:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas metus orci, auctor a metus vitae, ullamcorper molestie lacus. Maecenas tristique.",
      level: "beginner",
    ),
    CourseModel(
      id: "2",
      image:
          "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=388&q=80",
      title: "E",
      des: "Lorem ipsum dolor sit amet,",
      level: "beginner",
    )
  ];

  static CourseDetailModel coureDetailEx = CourseDetailModel(
      course: courseListExample[0],
      overview: [
        CourseDetailOverviewModel(title: "Why", ans: "This is answer"),
        CourseDetailOverviewModel(title: "What", ans: "Answered"),
        CourseDetailOverviewModel(title: "When", ans: "This is answer"),
      ],
      length: 6,
      listTopic: ["Topic 1", "Topic 2"]);
}
