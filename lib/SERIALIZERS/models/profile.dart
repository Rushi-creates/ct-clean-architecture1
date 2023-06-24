// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  int? p_uid;
  String? username;
  String? bio;
  int? followingCount;
  int? followersCount;
  Profile({
    this.p_uid,
    this.username,
    this.bio,
    this.followingCount,
    this.followersCount,
  });

  Profile copyWith({
    int? p_uid,
    String? username,
    String? bio,
    int? followingCount,
    int? followersCount,
  }) {
    return Profile(
      p_uid: p_uid ?? this.p_uid,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      followingCount: followingCount ?? this.followingCount,
      followersCount: followersCount ?? this.followersCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p_uid': p_uid,
      'username': username,
      'bio': bio,
      'followingCount': followingCount,
      'followersCount': followersCount,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      p_uid: map['p_uid'] != null ? map['p_uid'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      followingCount:
          map['followingCount'] != null ? map['followingCount'] as int : null,
      followersCount:
          map['followersCount'] != null ? map['followersCount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(p_uid: $p_uid, username: $username, bio: $bio, followingCount: $followingCount, followersCount: $followersCount)';
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => Profile.fromMap(i)).toList();
    return dartObjList;
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.p_uid == p_uid &&
        other.username == username &&
        other.bio == bio &&
        other.followingCount == followingCount &&
        other.followersCount == followersCount;
  }

  @override
  int get hashCode {
    return p_uid.hashCode ^
        username.hashCode ^
        bio.hashCode ^
        followingCount.hashCode ^
        followersCount.hashCode;
  }
}
