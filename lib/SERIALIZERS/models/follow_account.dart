// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FollowAccount {
  int? id;
  int my_profile_fk;
  int other_profile_fk;
  String? username;
  String? imageUrl;
  FollowAccount({
    this.id,
    required this.my_profile_fk,
    required this.other_profile_fk,
    this.username,
    this.imageUrl,
  });

  FollowAccount copyWith({
    int? id,
    int? my_profile_fk,
    int? other_profile_fk,
    String? username,
    String? imageUrl,
  }) {
    return FollowAccount(
      id: id ?? this.id,
      my_profile_fk: my_profile_fk ?? this.my_profile_fk,
      other_profile_fk: other_profile_fk ?? this.other_profile_fk,
      username: username ?? this.username,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'my_profile_fk': my_profile_fk,
      'other_profile_fk': other_profile_fk,
      'username': username,
      'imageUrl': imageUrl,
    };
  }

  factory FollowAccount.fromMap(Map<String, dynamic> map) {
    return FollowAccount(
      id: map['id'] != null ? map['id'] as int : null,
      my_profile_fk: map['my_profile_fk'] as int,
      other_profile_fk: map['other_profile_fk'] as int,
      username: map['username'] != null ? map['username'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList =
        parsedJsonList.map((i) => FollowAccount.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory FollowAccount.fromJson(String source) =>
      FollowAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FollowAccount(id: $id, my_profile_fk: $my_profile_fk, other_profile_fk: $other_profile_fk, username: $username, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant FollowAccount other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.my_profile_fk == my_profile_fk &&
        other.other_profile_fk == other_profile_fk &&
        other.username == username &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        my_profile_fk.hashCode ^
        other_profile_fk.hashCode ^
        username.hashCode ^
        imageUrl.hashCode;
  }
}
