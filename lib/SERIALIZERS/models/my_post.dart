// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ct_single_post/SERIALIZERS/models/series_result.dart';
import 'package:ct_single_post/SERIALIZERS/models/songs_result.dart';
import 'package:ct_single_post/SERIALIZERS/models/youtube_single_result.dart';

import 'movie_result.dart';

class MyPost {
  int? id;
  int profile_fk;
  String api_id;
  String trendType;
  String watchedAt;
  String lovedFact;
  String createdAt;
  SongResults? songResults;
  MovieResults? movieResults;
  SeriesResults? seriesResults;
  YoutubeSingleResult? youtubeSingleResult;
  String? profile_username;
  String? profile_bio;
  String? userAcc_photoUrl;
  MyPost({
    this.id,
    required this.profile_fk,
    required this.api_id,
    required this.trendType,
    required this.watchedAt,
    required this.lovedFact,
    required this.createdAt,
    this.songResults,
    this.movieResults,
    this.seriesResults,
    this.youtubeSingleResult,
    this.profile_username,
    this.profile_bio,
    this.userAcc_photoUrl,
  });

  MyPost copyWith({
    int? id,
    int? profile_fk,
    String? api_id,
    String? trendType,
    String? watchedAt,
    String? lovedFact,
    String? createdAt,
    SongResults? songResults,
    MovieResults? movieResults,
    SeriesResults? seriesResults,
    YoutubeSingleResult? youtubeSingleResult,
    String? profile_username,
    String? profile_bio,
    String? userAcc_photoUrl,
  }) {
    return MyPost(
      id: id ?? this.id,
      profile_fk: profile_fk ?? this.profile_fk,
      api_id: api_id ?? this.api_id,
      trendType: trendType ?? this.trendType,
      watchedAt: watchedAt ?? this.watchedAt,
      lovedFact: lovedFact ?? this.lovedFact,
      createdAt: createdAt ?? this.createdAt,
      songResults: songResults ?? this.songResults,
      movieResults: movieResults ?? this.movieResults,
      seriesResults: seriesResults ?? this.seriesResults,
      youtubeSingleResult: youtubeSingleResult ?? this.youtubeSingleResult,
      profile_username: profile_username ?? this.profile_username,
      profile_bio: profile_bio ?? this.profile_bio,
      userAcc_photoUrl: userAcc_photoUrl ?? this.userAcc_photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profile_fk': profile_fk,
      'api_id': api_id,
      'trendType': trendType,
      'watchedAt': watchedAt,
      'lovedFact': lovedFact,
      'createdAt': createdAt,
      'songResults': songResults?.toMap(),
      'movieResults': movieResults?.toJson(),
      'seriesResults': seriesResults?.toJson(),
      'youtubeSingleResult': youtubeSingleResult?.toMap(),
      'profile_username': profile_username,
      'profile_bio': profile_bio,
      'userAcc_photoUrl': userAcc_photoUrl,
    };
  }

  factory MyPost.fromMap(Map<String, dynamic> map) {
    return MyPost(
      id: map['id'] != null ? map['id'] as int : null,
      profile_fk: map['profile_fk'] as int,
      api_id: map['api_id'] as String,
      trendType: map['trendType'] as String,
      watchedAt: map['watchedAt'] as String,
      lovedFact: map['lovedFact'] as String,
      createdAt: map['createdAt'] as String,
      songResults: map['songResults'] != null
          ? SongResults.fromMap(map['songResults'] as Map<String, dynamic>)
          : null,
      movieResults: map['movieResults'] != null
          ? MovieResults.fromJson(map['movieResults'] as Map<String, dynamic>)
          : null,
      seriesResults: map['seriesResults'] != null
          ? SeriesResults.fromJson(map['seriesResults'] as Map<String, dynamic>)
          : null,
      youtubeSingleResult: map['youtubeSingleResult'] != null
          ? YoutubeSingleResult.fromMap(
              map['youtubeSingleResult'] as Map<String, dynamic>)
          : null,
      profile_username: map['profile_username'] != null
          ? map['profile_username'] as String
          : null,
      profile_bio:
          map['profile_bio'] != null ? map['profile_bio'] as String : null,
      userAcc_photoUrl: map['userAcc_photoUrl'] != null
          ? map['userAcc_photoUrl'] as String
          : null,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => MyPost.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory MyPost.fromJson(String source) =>
      MyPost.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyPost(id: $id, profile_fk: $profile_fk, api_id: $api_id, trendType: $trendType, watchedAt: $watchedAt, lovedFact: $lovedFact, createdAt: $createdAt, songResults: $songResults, movieResults: $movieResults, seriesResults: $seriesResults, youtubeSingleResult: $youtubeSingleResult, profile_username: $profile_username, profile_bio: $profile_bio, userAcc_photoUrl: $userAcc_photoUrl)';
  }

  @override
  bool operator ==(covariant MyPost other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.profile_fk == profile_fk &&
        other.api_id == api_id &&
        other.trendType == trendType &&
        other.watchedAt == watchedAt &&
        other.lovedFact == lovedFact &&
        other.createdAt == createdAt &&
        other.songResults == songResults &&
        other.movieResults == movieResults &&
        other.seriesResults == seriesResults &&
        other.youtubeSingleResult == youtubeSingleResult &&
        other.profile_username == profile_username &&
        other.profile_bio == profile_bio &&
        other.userAcc_photoUrl == userAcc_photoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        profile_fk.hashCode ^
        api_id.hashCode ^
        trendType.hashCode ^
        watchedAt.hashCode ^
        lovedFact.hashCode ^
        createdAt.hashCode ^
        songResults.hashCode ^
        movieResults.hashCode ^
        seriesResults.hashCode ^
        youtubeSingleResult.hashCode ^
        profile_username.hashCode ^
        profile_bio.hashCode ^
        userAcc_photoUrl.hashCode;
  }
}
