// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:json_annotation/json_annotation.dart';
// import 'package:test_movie_db/service_layer_stub/models/MovieResults.dart';

// part 'Movie.g.dart';

// @JsonSerializable()

import 'movie_result.dart';

class Movie {
  int? page;
  List<MovieResults>? results;
  int? totalPages;
  int? totalResults;
  Movie({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

// // fromJson

//   factory Movie.fromJson(Map<String, dynamic> map) => _$MovieFromJson(map);

// //toJson

//   Map<String, dynamic> toJson() => _$MovieToJson(this);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieResults.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'page': this.page,
      'results': this.results,
      'totalPages': this.totalPages,
      'totalResults': this.totalResults,
    };
  }
}
