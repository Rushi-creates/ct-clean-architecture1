// To parse this JSON data, do
//
//     final youtubeTrendModel = youtubeTrendModelFromMap(jsonString);

import 'dart:convert';

class YoutubeTrendModel {
  final String? kind;
  final String? etag;
  final List<Item>? items;
  final String? nextPageToken;
  final PageInfo? pageInfo;

  YoutubeTrendModel({
    this.kind,
    this.etag,
    this.items,
    this.nextPageToken,
    this.pageInfo,
  });

  factory YoutubeTrendModel.fromJson(String str) =>
      YoutubeTrendModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory YoutubeTrendModel.fromMap(Map<String, dynamic> json) =>
      YoutubeTrendModel(
        kind: json["kind"],
        etag: json["etag"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
        nextPageToken: json["nextPageToken"],
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromMap(json["pageInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "nextPageToken": nextPageToken,
        "pageInfo": pageInfo?.toMap(),
      };
}

class Item {
  final Kind? kind;
  final String? etag;
  final String? id;
  final Snippet? snippet;

  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        kind: kindValues.map[json["kind"]]!,
        etag: json["etag"],
        id: json["id"],
        snippet:
            json["snippet"] == null ? null : Snippet.fromMap(json["snippet"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kindValues.reverse[kind],
        "etag": etag,
        "id": id,
        "snippet": snippet?.toMap(),
      };
}

enum Kind { YOUTUBE_VIDEO }

final kindValues = EnumValues({"youtube#video": Kind.YOUTUBE_VIDEO});

class Snippet {
  final DateTime? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final Thumbnails? thumbnails;
  final String? channelTitle;
  final List<String>? tags;
  final String? categoryId;
  final LiveBroadcastContent? liveBroadcastContent;
  final Localized? localized;
  final String? defaultAudioLanguage;
  final String? defaultLanguage;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.localized,
    this.defaultAudioLanguage,
    this.defaultLanguage,
  });

  factory Snippet.fromJson(String str) => Snippet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Snippet.fromMap(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] == null
            ? null
            : Thumbnails.fromMap(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        categoryId: json["categoryId"],
        liveBroadcastContent:
            liveBroadcastContentValues.map[json["liveBroadcastContent"]]!,
        localized: json["localized"] == null
            ? null
            : Localized.fromMap(json["localized"]),
        defaultAudioLanguage: json["defaultAudioLanguage"],
        defaultLanguage: json["defaultLanguage"],
      );

  Map<String, dynamic> toMap() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toMap(),
        "channelTitle": channelTitle,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "categoryId": categoryId,
        "liveBroadcastContent":
            liveBroadcastContentValues.reverse[liveBroadcastContent],
        "localized": localized?.toMap(),
        "defaultAudioLanguage": defaultAudioLanguage,
        "defaultLanguage": defaultLanguage,
      };
}

enum LiveBroadcastContent { NONE }

final liveBroadcastContentValues =
    EnumValues({"none": LiveBroadcastContent.NONE});

class Localized {
  final String? title;
  final String? description;

  Localized({
    this.title,
    this.description,
  });

  factory Localized.fromJson(String str) => Localized.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Localized.fromMap(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
      };
}

class Thumbnails {
  final Default? thumbnailsDefault;
  final Default? medium;
  final Default? high;
  final Default? standard;
  final Default? maxres;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(String str) =>
      Thumbnails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnails.fromMap(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault:
            json["default"] == null ? null : Default.fromMap(json["default"]),
        medium: json["medium"] == null ? null : Default.fromMap(json["medium"]),
        high: json["high"] == null ? null : Default.fromMap(json["high"]),
        standard:
            json["standard"] == null ? null : Default.fromMap(json["standard"]),
        maxres: json["maxres"] == null ? null : Default.fromMap(json["maxres"]),
      );

  Map<String, dynamic> toMap() => {
        "default": thumbnailsDefault?.toMap(),
        "medium": medium?.toMap(),
        "high": high?.toMap(),
        "standard": standard?.toMap(),
        "maxres": maxres?.toMap(),
      };
}

class Default {
  final String? url;
  final int? width;
  final int? height;

  Default({
    this.url,
    this.width,
    this.height,
  });

  factory Default.fromJson(String str) => Default.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Default.fromMap(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class PageInfo {
  final int? totalResults;
  final int? resultsPerPage;

  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  factory PageInfo.fromJson(String str) => PageInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PageInfo.fromMap(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toMap() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
