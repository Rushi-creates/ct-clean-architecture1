// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ct_single_post/SERIALIZERS/models/songs_result.dart';
import 'package:flutter/foundation.dart';

class Songs {
  int resultCount;
  List<SongResults> results;
  Songs({
    required this.resultCount,
    required this.results,
  });

  Songs copyWith({
    int? resultCount,
    List<SongResults>? results,
  }) {
    return Songs(
      resultCount: resultCount ?? this.resultCount,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resultCount': resultCount,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory Songs.fromMap(Map<String, dynamic> map) {
    return Songs(
      resultCount: map['resultCount'] as int,
      results: List<SongResults>.from(
        (map['results'] as List<dynamic>).map<SongResults>(
          (x) => SongResults.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Songs.fromJson(String source) =>
      Songs.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Songs(resultCount: $resultCount, results: $results)';

  @override
  bool operator ==(covariant Songs other) {
    if (identical(this, other)) return true;

    return other.resultCount == resultCount &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode => resultCount.hashCode ^ results.hashCode;
}
