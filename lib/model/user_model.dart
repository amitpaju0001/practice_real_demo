class UserModel {
  String userId;
  String name;
  String age;
  String address;

  UserModel({
    required this.userId,
    required this.name,
    required this.age,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      age: json['age'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'age': age,
      'address': address,
    };
  }
}
