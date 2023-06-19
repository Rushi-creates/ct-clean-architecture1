// import 'package:json_annotation/json_annotation.dart';

// part 'SeriesResults.g.dart';

// @JsonSerializable()
class SeriesResults {
  int id;
  String name;
  String? poster_path;

  SeriesResults({
    required this.id,
    required this.name,
    this.poster_path,
  });

// // fromJson

//   factory SeriesResults.fromJson(Map<String, dynamic> map) =>
//       _$SeriesResultsFromJson(map);

// //toMap

//   Map<String, dynamic> toJson() => _$SeriesResultsToJson(this);

  factory SeriesResults.fromJson(Map<String, dynamic> json) {
    return SeriesResults(
      id: json['id'] as int,
      name: json['name'] as String,
      poster_path: json['poster_path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'name': this.name,
      'poster_path': this.poster_path,
    };
  }
}
