class User {
  String? image;
  String name;
  String? gender;
  String email;
  String studentId;
  String? level;
  String password;

  User({
    this.image,
    required this.name,
    this.gender,
    required this.email,
    required this.studentId,
    this.level,
    required this.password,
  });

  @override
  String toString() {
    return 'User{image:$image,name: $name, gender: $gender, email: $email, studentId: $studentId, level: $level, password: $password}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      image: json['image'],
      name: json['name'],
      gender: json['gender'],
      email: json['email'],
      studentId: json['studentId'],
      level: json['level'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      'name': name,
      'gender': gender,
      'email': email,
      'studentId': studentId,
      'level': level,
      'password': password,
    };
  }

}
