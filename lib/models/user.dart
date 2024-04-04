class User {
  final String name;
  final String? gender;
  final String email;
  final String studentId;
  final String? level;
  final String password;

  User({
    required this.name,
    this.gender,
    required this.email,
    required this.studentId,
    this.level,
    required this.password,
  });

  @override
  String toString() {
    return 'User{name: $name, gender: $gender, email: $email, studentId: $studentId, level: $level, password: $password}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
      'name': name,
      'gender': gender,
      'email': email,
      'studentId': studentId,
      'level': level,
      'password': password,
    };
  }
}
