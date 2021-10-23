import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/index.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/user.dart';

class LocalData {
  static UserModel currentUser = UserModel(
    name: "phamvmnhut",
    email: 'phamvmnhut@gmail.com',
    avatar:
        'https://media.istockphoto.com/photos/funny-raccoon-in-green-sunglasses-showing-a-rock-gesture-isolated-on-picture-id1154370446?k=20&m=1154370446&s=612x612&w=0&h=2AWvof66ovB87P3b7C_cu0pCZlZhDDFYUFr2KQ2UnwQ=',
    dayOfBirth: DateTime.utc(2000, 11, 5),
    phoneNumber: "0338473427",
  );

  static List<String> Specialities = [
    "Tất cả",
    "Tiếng Anh cho trẻ em",
    "Tiếng Anh cho công việc",
    "Giao tiếp",
    "PET",
    "TOIEC"
  ];

  static List<TutorModel> TutorListExample = [
    TutorModel(
        avtUrl:
            "https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        name: "Giáo viên 1",
        isFav: true,
        country: Country(code: 'vn', name: "Việt Nam"),
        rate: 3.5,
        specList: ["PET", "Tiếng anh cho người mất gốc"],
        des:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    TutorModel(
        avtUrl:
            "https://images.unsplash.com/photo-1633114127188-99b4dd741180?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80",
        name: "Giáo viên 2",
        isFav: false,
        country: Country(code: 'vn', name: "Việt Nam"),
        rate: 4,
        specList: ["Tiếng anh cho người mất gốc"],
        des:
            "Đây là đoạn text cực dài hoặc là cực ngắn nhưng nó sẽ chỉ hạn định ở 1 số dòng nhất định"),
    TutorModel(
      avtUrl:
          "https://images.unsplash.com/photo-1634685468530-528507cde3b7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
      name: "Giáo viên 3 Giáo viên 3 Giáo viên 3",
      isFav: false,
      country: Country(code: 'us', name: "American"),
      rate: 2,
      specList: ["Tiếng anh full"],
      des:
          "Đây là đoạn text cực dài hoặc là cực ngắn nhưng nó sẽ chỉ hạn định ở 1 số dòng nhất định",
    ),
    TutorModel(
        avtUrl:
            "https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        name: "Giáo viên 4",
        isFav: true,
        country: Country(code: 'vn', name: "Việt Nam"),
        rate: 3,
        specList: ["PET", "Tiếng anh cho người mất gốc"],
        des:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    TutorModel(
      avtUrl:
          "https://images.unsplash.com/photo-1634685468530-528507cde3b7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
      name: "Giáo viên 5",
      isFav: false,
      country: Country(code: 'us', name: "American"),
      rate: 2,
      specList: ["Tiếng anh full"],
      des:
          "Đây là đoạn text cực dài hoặc là cực ngắn nhưng nó sẽ chỉ hạn định ở 1 số dòng nhất định",
    ),
    TutorModel(
        avtUrl:
            "https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        name: "Giáo viên 6",
        isFav: true,
        country: Country(code: 'vn', name: "Việt Nam"),
        rate: 3.5,
        specList: ["PET", "Tiếng anh cho người mất gốc"],
        des:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    TutorModel(
        avtUrl:
            "https://images.unsplash.com/photo-1633114127188-99b4dd741180?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80",
        name: "Giáo viên 7",
        isFav: false,
        country: Country(code: 'vn', name: "Việt Nam"),
        rate: 4,
        specList: ["Tiếng anh cho người mất gốc"],
        des:
            "Đây là đoạn text cực dài hoặc là cực ngắn nhưng nó sẽ chỉ hạn định ở 1 số dòng nhất định"),
    TutorModel(
      avtUrl:
          "https://images.unsplash.com/photo-1634685468530-528507cde3b7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
      name: "Giáo viên 8",
      isFav: false,
      country: Country(code: 'us', name: "American"),
      rate: 2,
      specList: ["Tiếng anh full"],
      des:
          "Đây là đoạn text cực dài hoặc là cực ngắn nhưng nó sẽ chỉ hạn định ở 1 số dòng nhất định",
    ),
    TutorModel(
        avtUrl:
            "https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        name: "Giáo viên 9",
        isFav: true,
        country: Country(code: 'vn', name: "Việt Nam"),
        rate: 3,
        specList: ["PET", "Tiếng anh cho người mất gốc"],
        des:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    TutorModel(
      avtUrl:
          "https://images.unsplash.com/photo-1634685468530-528507cde3b7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
      name: "Giáo viên 10",
      isFav: false,
      country: Country(code: 'us', name: "American"),
      rate: 2,
      specList: ["Tiếng anh full"],
      des:
          "Đây là đoạn text cực dài hoặc là cực ngắn nhưng nó sẽ chỉ hạn định ở 1 số dòng nhất định",
    ),
  ];

  static TutorDetailModel tutorDetail = TutorDetailModel(
    tutor: TutorListExample[1],
    langs: ["English"],
    majors: ["Tiếng Anh cho trẻ em", "Giao tiếp", "Tiếng Anh cho công việc"],
    hobby:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas metus orci, auctor a metus vitae, ullamcorper molestie lacus. Maecenas tristique.",
    exp:
        "Duis nec orci nisl. Morbi varius ex non libero mollis, sollicitudin gravida ex tincidunt. Cras hendrerit sed orci ut bibendum. Nunc ultrices viverra nunc, at ultricies leo mollis tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porta risus in dolor pellentesque mollis. In ut sem sollicitudin, eleifend turpis ac, mattis felis. Maecenas in congue turpis, facilisis sollicitudin erat. Nullam at lectus vitae felis vestibulum mollis eget at lacus. Nam condimentum at ex a ullamcorper. Curabitur non vehicula est. Mauris pretium justo non risus tempor feugiat a a tortor. Fusce finibus rutrum vulputate.",
  );

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
      tutor: TutorListExample[1],
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
      tutor: TutorListExample[1],
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
      image: "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
      title: "This is title ebook",
      des:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas metus orci, auctor a metus vitae, ullamcorper molestie lacus. Maecenas tristique.",
      level: "beginner",
    ),
    CourseModel(
      id: "2",
      image: "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=388&q=80",
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
