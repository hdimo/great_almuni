import 'dart:convert';

class User {
  String email;
  String password;
  String uid;
  User({
    required this.email,
    required this.password,
    required this.uid,
  });

  User copyWith({
    String? email,
    String? password,
    String? uid,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'uid': uid});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      password: map['password'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(email: $email, password: $password, uid: $uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.email == email &&
        other.password == password &&
        other.uid == uid;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ uid.hashCode;
}
