class UserModel {
  final String name;
  final String location;

  UserModel({required this.name, required this.location});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
    );
  }
}
