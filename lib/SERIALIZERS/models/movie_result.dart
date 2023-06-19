// import 'package:json_annotation/json_annotation.dart';

// part 'MovieResults.g.dart';

// @JsonSerializable()
class MovieResults {
  int id;
  String title;
  String? poster_path;
  MovieResults({
    required this.id,
    required this.title,
    this.poster_path,
  });

// // fromJson

//   factory MovieResults.fromJson(Map<String, dynamic> map) =>
//       _$MovieResultsFromJson(map);

// //toMap

//   Map<String, dynamic> toJson() => _$MovieResultsToJson(this);

  factory MovieResults.fromJson(Map<String, dynamic> json) {
    return MovieResults(
      id: json['id'] as int,
      title: json['title'] as String,
      poster_path: json['poster_path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'title': this.title,
      'poster_path': this.poster_path,
    };
  }
}



// // import 'package:json_annotation/json_annotation.dart';

// // part 'MovieResults.g.dart';

// // @JsonSerializable()
// class MovieResults {
//   int id;
//   String title;
//   String poster_path;
//   MovieResults({
//     required this.id,
//     required this.title,
//     required this.poster_path,
//   });

// // // fromJson

// //   factory MovieResults.fromJson(Map<String, dynamic> map) =>
// //       _$MovieResultsFromJson(map);

// // //toMap

// //   Map<String, dynamic> toJson() => _$MovieResultsToJson(this);

//   factory MovieResults.fromJson(Map<String, dynamic> json) {
//     return MovieResults(
//       id: json['id'] as int,
//       title: json['title'] as String,
//       poster_path: json['poster_path'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'id': this.id,
//       'title': this.title,
//       'poster_path': this.poster_path,
//     };
//   }
// }
