// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  int? p_uid;
  String? username;
  String? bio;
  Profile({
    this.p_uid,
    this.username,
    this.bio,
  });

  Profile copyWith({
    int? p_uid,
    String? username,
    String? bio,
  }) {
    return Profile(
      p_uid: p_uid ?? this.p_uid,
      username: username ?? this.username,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p_uid': p_uid,
      'username': username,
      'bio': bio,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      p_uid: map['p_uid'] != null ? map['p_uid'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => Profile.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Profile(p_uid: $p_uid, username: $username, bio: $bio)';

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.p_uid == p_uid &&
        other.username == username &&
        other.bio == bio;
  }

  @override
  int get hashCode => p_uid.hashCode ^ username.hashCode ^ bio.hashCode;
}
