class UserModel {
  final String name;
  final String email;
  final String? avatar;
  final DateTime dayOfBirth;
  final String? phoneNumber;
  final String? country;
  final String? lever;
  final String? wantToLearn;

  UserModel({
    required this.name,
    required this.email,
    this.avatar,
    required this.dayOfBirth,
    this.phoneNumber,
    this.country,
    this.lever,
    this.wantToLearn,
  });
}
