// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:json_annotation/json_annotation.dart';
// import 'package:test_series_db/service_layer_stub/models/SeriesResults.dart';

// part 'Series.g.dart';

// @JsonSerializable()

import 'series_result.dart';

class Series {
  int? page;
  List<SeriesResults>? results;
  int? totalPages;
  int? totalResults;
  Series({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

// // fromJson

//   factory Series.fromJson(Map<String, dynamic> map) => _$SeriesFromJson(map);

// //toJson

//   Map<String, dynamic> toJson() => _$SeriesToJson(this);

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SeriesResults.fromJson(e as Map<String, dynamic>))
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
