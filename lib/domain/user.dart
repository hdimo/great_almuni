import 'dart:convert';

class User {
  String uid;
  String name;
  String email;
  String departement;
  String year;
  String speciality;
  String hobies;
  String img;

  User({
    required this.email,
    required this.uid,
    required this.name,
    required this.departement,
    required this.year,
    required this.speciality,
    required this.hobies,
    required this.img,
  });

  User copyWith({
    String? email,
    String? password,
    String? uid,
    String? name,
    String? departement,
    String? year,
    String? speciality,
    String? hobies,
    String? img,
  }) {
    return User(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      departement: departement ?? this.departement,
      year: year ?? this.year,
      speciality: speciality ?? this.speciality,
      hobies: hobies ?? this.hobies,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'uid': uid});
    result.addAll({'name': name});
    result.addAll({'departement': departement});
    result.addAll({'year': year});
    result.addAll({'speciality': speciality});
    result.addAll({'hobies': hobies});
    result.addAll({'img': img});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      uid: map['uid'],
      name: map['name'],
      departement: map['departement'],
      year: map['year'],
      speciality: map['speciality'],
      hobies: map['hobies'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(email: $email, uid: $uid, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.email == email &&
        other.name == name &&
        other.uid == uid &&
        other.departement == departement &&
        other.year == year &&
        other.speciality == speciality &&
        other.img == img &&
        other.hobies == hobies;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ uid.hashCode;
}
